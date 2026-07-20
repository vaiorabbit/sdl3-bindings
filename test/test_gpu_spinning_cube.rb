# Windows-only SDL3 GPU sample ported from SDL testgpu_spinning_cube.c.

require 'ffi'
require_relative '../lib/sdl3'
require_relative 'util'

NUM_SPRITES = 100
MAX_SPRITE_SPEED = 1.0
SPRITE_SIZE = 20.0

VERTEX_DATA = [
  -0.5,  0.5, -0.5, 1.0, 0.0, 0.0,
   0.5, -0.5, -0.5, 0.0, 0.0, 1.0,
  -0.5, -0.5, -0.5, 0.0, 1.0, 0.0,
  -0.5,  0.5, -0.5, 1.0, 0.0, 0.0,
   0.5,  0.5, -0.5, 1.0, 1.0, 0.0,
   0.5, -0.5, -0.5, 0.0, 0.0, 1.0,

  -0.5,  0.5,  0.5, 1.0, 1.0, 1.0,
  -0.5, -0.5, -0.5, 0.0, 1.0, 0.0,
  -0.5, -0.5,  0.5, 0.0, 1.0, 1.0,
  -0.5,  0.5,  0.5, 1.0, 1.0, 1.0,
  -0.5,  0.5, -0.5, 1.0, 0.0, 0.0,
  -0.5, -0.5, -0.5, 0.0, 1.0, 0.0,

  -0.5, 0.5,  0.5, 1.0, 1.0, 1.0,
   0.5, 0.5, -0.5, 1.0, 1.0, 0.0,
  -0.5, 0.5, -0.5, 1.0, 0.0, 0.0,
  -0.5, 0.5,  0.5, 1.0, 1.0, 1.0,
   0.5, 0.5,  0.5, 0.0, 0.0, 0.0,
   0.5, 0.5, -0.5, 1.0, 1.0, 0.0,

   0.5,  0.5, -0.5, 1.0, 1.0, 0.0,
   0.5, -0.5,  0.5, 1.0, 0.0, 1.0,
   0.5, -0.5, -0.5, 0.0, 0.0, 1.0,
   0.5,  0.5, -0.5, 1.0, 1.0, 0.0,
   0.5,  0.5,  0.5, 0.0, 0.0, 0.0,
   0.5, -0.5,  0.5, 1.0, 0.0, 1.0,

   0.5,  0.5, 0.5, 0.0, 0.0, 0.0,
  -0.5, -0.5, 0.5, 0.0, 1.0, 1.0,
   0.5, -0.5, 0.5, 1.0, 0.0, 1.0,
   0.5,  0.5,  0.5, 0.0, 0.0, 0.0,
  -0.5,  0.5,  0.5, 1.0, 1.0, 1.0,
  -0.5, -0.5,  0.5, 0.0, 1.0, 1.0,

  -0.5, -0.5, -0.5, 0.0, 1.0, 0.0,
   0.5, -0.5,  0.5, 1.0, 0.0, 1.0,
  -0.5, -0.5,  0.5, 0.0, 1.0, 1.0,
  -0.5, -0.5, -0.5, 0.0, 1.0, 0.0,
   0.5, -0.5, -0.5, 0.0, 0.0, 1.0,
   0.5, -0.5,  0.5, 1.0, 0.0, 1.0
].freeze

def sdl_error
  ptr = SDL.GetError()
  ptr && !ptr.null? ? ptr.read_string : "unknown error"
end

def ensure_ok(ok, msg)
  return if ok
  raise "#{msg}: #{sdl_error}"
end

def rotate_matrix(angle, x, y, z)
  radians = angle * Math::PI / 180.0
  c = Math.cos(radians)
  s = Math.sin(radians)
  c1 = 1.0 - c
  length = Math.sqrt((x * x) + (y * y) + (z * z))
  u0 = x / length
  u1 = y / length
  u2 = z / length

  r = Array.new(16, 0.0)
  r[15] = 1.0

  r[0 * 4 + 1] = u2 * s
  r[0 * 4 + 2] = -u1 * s
  r[1 * 4 + 2] = u0 * s
  r[1 * 4 + 0] = -u2 * s
  r[2 * 4 + 0] = u1 * s
  r[2 * 4 + 1] = -u0 * s

  3.times do |i|
    3.times do |j|
      r[i * 4 + j] += c1 * [u0, u1, u2][i] * [u0, u1, u2][j] + (i == j ? c : 0.0)
    end
  end

  r
end

def perspective_matrix(fovy, aspect, znear, zfar)
  f = 1.0 / Math.tan((fovy / 180.0) * Math::PI * 0.5)
  r = Array.new(16, 0.0)
  r[0] = f / aspect
  r[5] = f
  r[10] = (znear + zfar) / (znear - zfar)
  r[11] = -1.0
  r[14] = (2.0 * znear * zfar) / (znear - zfar)
  r
end

def multiply_matrix(lhs, rhs)
  out = Array.new(16, 0.0)
  4.times do |i|
    4.times do |j|
      sum = 0.0
      4.times do |k|
        sum += lhs[k * 4 + j] * rhs[i * 4 + k]
      end
      out[i * 4 + j] = sum
    end
  end
  out
end

def shader_base_dir
  File.join(__dir__, 'test_gpu')
end

def select_shader_format(device)
  formats = SDL.GetGPUShaderFormats(device)
  if (formats & SDL::GPU_SHADERFORMAT_DXIL) != 0
    [SDL::GPU_SHADERFORMAT_DXIL, 'dxil']
  elsif (formats & SDL::GPU_SHADERFORMAT_SPIRV) != 0
    [SDL::GPU_SHADERFORMAT_SPIRV, 'spv']
  else
    raise 'No supported shader format (DXIL/SPIR-V) is available on this device'
  end
end

def read_shader_blob(name, ext)
  path = File.join(shader_base_dir, "#{name}.#{ext}")
  raise "Shader file was not found: #{path}" unless File.file?(path)
  File.binread(path)
end

def create_shader(device, format, ext, base_name, stage, num_uniform_buffers, num_samplers)
  blob = read_shader_blob(base_name, ext)
  code_ptr = FFI::MemoryPointer.new(:uint8, blob.bytesize)
  code_ptr.put_bytes(0, blob)
  entrypoint = FFI::MemoryPointer.from_string('main')

  info = SDL::GPUShaderCreateInfo.new
  info[:code_size] = blob.bytesize
  info[:code] = code_ptr
  info[:entrypoint] = entrypoint
  info[:format] = format
  info[:stage] = stage
  info[:num_samplers] = num_samplers
  info[:num_storage_textures] = 0
  info[:num_storage_buffers] = 0
  info[:num_uniform_buffers] = num_uniform_buffers
  info[:props] = 0

  shader = SDL.CreateGPUShader(device, info)
  raise "Failed to create shader #{base_name}: #{sdl_error}" if shader.nil? || shader.null?
  shader
end

def create_depth_texture(device, sample_count, width, height)
  info = SDL::GPUTextureCreateInfo.new
  info[:type] = SDL::GPU_TEXTURETYPE_2D
  info[:format] = SDL::GPU_TEXTUREFORMAT_D16_UNORM
  info[:usage] = SDL::GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET
  info[:width] = width
  info[:height] = height
  info[:layer_count_or_depth] = 1
  info[:num_levels] = 1
  info[:sample_count] = sample_count
  info[:props] = 0
  tex = SDL.CreateGPUTexture(device, info)
  raise "Failed to create depth texture: #{sdl_error}" if tex.nil? || tex.null?
  tex
end

def random_velocity
  v = ((rand * (MAX_SPRITE_SPEED * 2.0)) - MAX_SPRITE_SPEED)
  v = 0.25 if v.abs < 0.1
  v
end

def init_sprite_window_state
  {
    initialized: false,
    target: nil,
    texture: nil,
    target_w: 0,
    target_h: 0,
    positions: Array.new(NUM_SPRITES) { { x: 0.0, y: 0.0, w: SPRITE_SIZE, h: SPRITE_SIZE } },
    velocities: Array.new(NUM_SPRITES) { { x: 0.0, y: 0.0 } }
  }
end

def destroy_texture_if_needed(tex)
  return if tex.nil? || tex.null?
  SDL.DestroyTexture(tex)
end

def update_render_target(rs, ws, width, height)
  target = ws[:target]
  if target.nil? || target.null? || ws[:target_w] != width || ws[:target_h] != height
    destroy_texture_if_needed(target)

    target = SDL.CreateTexture(rs[:renderer], SDL::PIXELFORMAT_BGRA32, SDL::TEXTUREACCESS_TARGET, width, height)
    ensure_ok(!(target.nil? || target.null?), 'Failed to create overlay target texture')
    ensure_ok(SDL.SetRenderTarget(rs[:renderer], target), 'Failed to set overlay target')

    texture_props = SDL.GetTextureProperties(target)
    key_ptr = FFI::MemoryPointer.from_string(SDL::PROP_TEXTURE_GPU_TEXTURE_POINTER)
    gpu_tex = SDL.GetPointerProperty(texture_props, key_ptr, nil)

    ws[:target] = target
    ws[:texture] = gpu_tex
    ws[:target_w] = width
    ws[:target_h] = height
  else
    ensure_ok(SDL.SetRenderTarget(rs[:renderer], target), 'Failed to set overlay target')
  end
end

def update_sprites(ws, width, height)
  if !ws[:initialized]
    ws[:positions].each_with_index do |pos, i|
      pos[:x] = rand * [width - SPRITE_SIZE, 1].max
      pos[:y] = rand * [height - SPRITE_SIZE, 1].max
      ws[:velocities][i][:x] = random_velocity
      ws[:velocities][i][:y] = random_velocity
    end
    ws[:initialized] = true
  end

  ws[:positions].each_with_index do |pos, i|
    vel = ws[:velocities][i]
    pos[:x] += vel[:x]
    max_x = width - pos[:w]
    if pos[:x] < 0.0 || pos[:x] >= max_x
      vel[:x] = -vel[:x]
      pos[:x] += vel[:x]
    end

    pos[:y] += vel[:y]
    max_y = height - pos[:h]
    if pos[:y] < 0.0 || pos[:y] >= max_y
      vel[:y] = -vel[:y]
      pos[:y] += vel[:y]
    end
  end
end

def render_sprites(renderer, ws)
  rect = SDL::FRect.new
  ws[:positions].each do |pos|
    rect[:x] = pos[:x]
    rect[:y] = pos[:y]
    rect[:w] = pos[:w]
    rect[:h] = pos[:h]
    SDL.RenderFillRect(renderer, rect)
  end
end

def update_sprite_overlay(rs, ws, width, height)
  update_render_target(rs, ws, width, height)

  SDL.SetRenderDrawColor(rs[:renderer], 0, 0, 0, SDL::ALPHA_TRANSPARENT)
  SDL.RenderClear(rs[:renderer])

  if rs[:show_sprites]
    SDL.SetRenderDrawColor(rs[:renderer], 60, 190, 255, 200)
    update_sprites(ws, width, height)
    render_sprites(rs[:renderer], ws)
  end

  SDL.SetRenderDrawColor(rs[:renderer], 255, 255, 255, SDL::ALPHA_OPAQUE)
  SDL.RenderDebugText(rs[:renderer], 4.0, 4.0, FFI::MemoryPointer.from_string("Press S to toggle 2D sprites"))
  SDL.RenderPresent(rs[:renderer])
end

def render_sprite_overlay(pass, rs, ws)
  tex = ws[:texture]
  return if tex.nil? || tex.null?

  binding = SDL::GPUTextureSamplerBinding.new
  binding[:texture] = tex
  binding[:sampler] = rs[:sampler]

  SDL.BindGPUGraphicsPipeline(pass, rs[:pipeline])
  SDL.BindGPUFragmentSamplers(pass, 0, binding, 1)
  SDL.DrawGPUPrimitives(pass, 6, 1, 0, 0)
end

def init_sprite_overlay(device, window, format, ext)
  rs = {
    renderer: SDL.CreateGPURenderer(device, nil),
    pipeline: nil,
    sampler: nil,
    show_sprites: true
  }
  ensure_ok(!(rs[:renderer].nil? || rs[:renderer].null?), 'Failed to create GPURenderer')

  vtx = create_shader(device, format, ext, 'overlay.vert', SDL::GPU_SHADERSTAGE_VERTEX, 0, 0)
  frag = create_shader(device, format, ext, 'overlay.frag', SDL::GPU_SHADERSTAGE_FRAGMENT, 0, 1)

  ctd = SDL::GPUColorTargetDescription.new
  ctd[:format] = SDL.GetGPUSwapchainTextureFormat(device, window)
  ctd[:blend_state][:enable_blend] = true
  ctd[:blend_state][:color_write_mask] = 0x0F
  ctd[:blend_state][:color_blend_op] = SDL::GPU_BLENDOP_ADD
  ctd[:blend_state][:alpha_blend_op] = SDL::GPU_BLENDOP_ADD
  ctd[:blend_state][:src_color_blendfactor] = SDL::GPU_BLENDFACTOR_SRC_ALPHA
  ctd[:blend_state][:dst_color_blendfactor] = SDL::GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA
  ctd[:blend_state][:src_alpha_blendfactor] = SDL::GPU_BLENDFACTOR_SRC_ALPHA
  ctd[:blend_state][:dst_alpha_blendfactor] = SDL::GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA

  ctd_ptr = FFI::MemoryPointer.new(SDL::GPUColorTargetDescription, 1)
  ctd_on_ptr = SDL::GPUColorTargetDescription.new(ctd_ptr)
  ctd_on_ptr[:format] = ctd[:format]
  ctd_on_ptr[:blend_state][:enable_blend] = ctd[:blend_state][:enable_blend]
  ctd_on_ptr[:blend_state][:color_write_mask] = ctd[:blend_state][:color_write_mask]
  ctd_on_ptr[:blend_state][:color_blend_op] = ctd[:blend_state][:color_blend_op]
  ctd_on_ptr[:blend_state][:alpha_blend_op] = ctd[:blend_state][:alpha_blend_op]
  ctd_on_ptr[:blend_state][:src_color_blendfactor] = ctd[:blend_state][:src_color_blendfactor]
  ctd_on_ptr[:blend_state][:dst_color_blendfactor] = ctd[:blend_state][:dst_color_blendfactor]
  ctd_on_ptr[:blend_state][:src_alpha_blendfactor] = ctd[:blend_state][:src_alpha_blendfactor]
  ctd_on_ptr[:blend_state][:dst_alpha_blendfactor] = ctd[:blend_state][:dst_alpha_blendfactor]

  pci = SDL::GPUGraphicsPipelineCreateInfo.new
  pci[:vertex_shader] = vtx
  pci[:fragment_shader] = frag
  pci[:primitive_type] = SDL::GPU_PRIMITIVETYPE_TRIANGLELIST
  pci[:rasterizer_state][:enable_depth_clip] = true
  pci[:target_info][:num_color_targets] = 1
  pci[:target_info][:color_target_descriptions] = ctd_ptr
  pci[:props] = 0

  rs[:pipeline] = SDL.CreateGPUGraphicsPipeline(device, pci)
  SDL.ReleaseGPUShader(device, vtx)
  SDL.ReleaseGPUShader(device, frag)
  ensure_ok(!(rs[:pipeline].nil? || rs[:pipeline].null?), 'Failed to create overlay pipeline')

  sci = SDL::GPUSamplerCreateInfo.new
  sci[:min_filter] = SDL::GPU_FILTER_NEAREST
  sci[:mag_filter] = SDL::GPU_FILTER_NEAREST
  sci[:mipmap_mode] = SDL::GPU_SAMPLERMIPMAPMODE_NEAREST
  sci[:address_mode_u] = SDL::GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE
  sci[:address_mode_v] = SDL::GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE
  sci[:address_mode_w] = SDL::GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE
  sci[:compare_op] = SDL::GPU_COMPAREOP_ALWAYS
  sci[:props] = 0

  rs[:sampler] = SDL.CreateGPUSampler(device, sci)
  ensure_ok(!(rs[:sampler].nil? || rs[:sampler].null?), 'Failed to create overlay sampler')

  rs
end

def shutdown_sprite_overlay(device, rs, ws)
  return if rs.nil?

  destroy_texture_if_needed(ws[:target]) if ws
  if rs[:sampler] && !rs[:sampler].null?
    SDL.ReleaseGPUSampler(device, rs[:sampler])
  end
  if rs[:pipeline] && !rs[:pipeline].null?
    SDL.ReleaseGPUGraphicsPipeline(device, rs[:pipeline])
  end
  if rs[:renderer] && !rs[:renderer].null?
    SDL.DestroyRenderer(rs[:renderer])
  end
end

def init_cube_pipeline(device, window, format, ext)
  render_state = {
    buf_vertex: nil,
    pipeline: nil,
    sample_count: SDL::GPU_SAMPLECOUNT_1
  }

  vtx = create_shader(device, format, ext, 'cube.vert', SDL::GPU_SHADERSTAGE_VERTEX, 1, 0)
  frag = create_shader(device, format, ext, 'cube.frag', SDL::GPU_SHADERSTAGE_FRAGMENT, 0, 0)

  buffer_desc = SDL::GPUBufferCreateInfo.new
  buffer_desc[:usage] = SDL::GPU_BUFFERUSAGE_VERTEX
  buffer_desc[:size] = VERTEX_DATA.length * FFI.type_size(:float)
  buffer_desc[:props] = 0
  render_state[:buf_vertex] = SDL.CreateGPUBuffer(device, buffer_desc)
  ensure_ok(!(render_state[:buf_vertex].nil? || render_state[:buf_vertex].null?), 'Failed to create vertex buffer')

  transfer_desc = SDL::GPUTransferBufferCreateInfo.new
  transfer_desc[:usage] = SDL::GPU_TRANSFERBUFFERUSAGE_UPLOAD
  transfer_desc[:size] = buffer_desc[:size]
  transfer_desc[:props] = 0
  transfer = SDL.CreateGPUTransferBuffer(device, transfer_desc)
  ensure_ok(!(transfer.nil? || transfer.null?), 'Failed to create transfer buffer')

  map = SDL.MapGPUTransferBuffer(device, transfer, false)
  map.put_array_of_float(0, VERTEX_DATA)
  SDL.UnmapGPUTransferBuffer(device, transfer)

  cmd = SDL.AcquireGPUCommandBuffer(device)
  ensure_ok(!(cmd.nil? || cmd.null?), 'Failed to acquire GPU command buffer for upload')

  copy = SDL.BeginGPUCopyPass(cmd)
  src = SDL::GPUTransferBufferLocation.new
  src[:transfer_buffer] = transfer
  src[:offset] = 0

  dst = SDL::GPUBufferRegion.new
  dst[:buffer] = render_state[:buf_vertex]
  dst[:offset] = 0
  dst[:size] = buffer_desc[:size]

  SDL.UploadToGPUBuffer(copy, src, dst, false)
  SDL.EndGPUCopyPass(copy)
  ensure_ok(SDL.SubmitGPUCommandBuffer(cmd), 'Failed to submit vertex upload command buffer')
  SDL.ReleaseGPUTransferBuffer(device, transfer)

  color_desc = SDL::GPUColorTargetDescription.new
  color_desc[:format] = SDL.GetGPUSwapchainTextureFormat(device, window)
  color_desc_ptr = FFI::MemoryPointer.new(SDL::GPUColorTargetDescription, 1)
  color_desc_on_ptr = SDL::GPUColorTargetDescription.new(color_desc_ptr)
  color_desc_on_ptr[:format] = color_desc[:format]

  vb_desc_ptr = FFI::MemoryPointer.new(SDL::GPUVertexBufferDescription, 1)
  vb_desc = SDL::GPUVertexBufferDescription.new(vb_desc_ptr)
  vb_desc[:slot] = 0
  vb_desc[:pitch] = 6 * FFI.type_size(:float)
  vb_desc[:input_rate] = SDL::GPU_VERTEXINPUTRATE_VERTEX
  vb_desc[:instance_step_rate] = 0

  attr_ptr = FFI::MemoryPointer.new(SDL::GPUVertexAttribute, 2)
  attr0 = SDL::GPUVertexAttribute.new(attr_ptr)
  attr1 = SDL::GPUVertexAttribute.new(attr_ptr + SDL::GPUVertexAttribute.size)
  attr0[:location] = 0
  attr0[:buffer_slot] = 0
  attr0[:format] = SDL::GPU_VERTEXELEMENTFORMAT_FLOAT3
  attr0[:offset] = 0
  attr1[:location] = 1
  attr1[:buffer_slot] = 0
  attr1[:format] = SDL::GPU_VERTEXELEMENTFORMAT_FLOAT3
  attr1[:offset] = 3 * FFI.type_size(:float)

  pci = SDL::GPUGraphicsPipelineCreateInfo.new
  pci[:vertex_shader] = vtx
  pci[:fragment_shader] = frag
  pci[:primitive_type] = SDL::GPU_PRIMITIVETYPE_TRIANGLELIST
  pci[:target_info][:num_color_targets] = 1
  pci[:target_info][:color_target_descriptions] = color_desc_ptr
  pci[:target_info][:depth_stencil_format] = SDL::GPU_TEXTUREFORMAT_D16_UNORM
  pci[:target_info][:has_depth_stencil_target] = true
  pci[:depth_stencil_state][:enable_depth_test] = true
  pci[:depth_stencil_state][:enable_depth_write] = true
  pci[:depth_stencil_state][:compare_op] = SDL::GPU_COMPAREOP_LESS_OR_EQUAL
  pci[:multisample_state][:sample_count] = render_state[:sample_count]
  pci[:vertex_input_state][:num_vertex_buffers] = 1
  pci[:vertex_input_state][:vertex_buffer_descriptions] = vb_desc_ptr
  pci[:vertex_input_state][:num_vertex_attributes] = 2
  pci[:vertex_input_state][:vertex_attributes] = attr_ptr
  pci[:props] = 0

  render_state[:pipeline] = SDL.CreateGPUGraphicsPipeline(device, pci)
  SDL.ReleaseGPUShader(device, vtx)
  SDL.ReleaseGPUShader(device, frag)
  ensure_ok(!(render_state[:pipeline].nil? || render_state[:pipeline].null?), 'Failed to create cube graphics pipeline')

  render_state
end

def release_gpu_ptr(device, ptr, release_fn)
  return if ptr.nil? || ptr.null?
  release_fn.call(device, ptr)
end

def run
  unless /mswin|msys|mingw|cygwin/ =~ RbConfig::CONFIG['host_os']
    raise 'This sample currently supports Windows only'
  end

  load_sdl3_lib
  ensure_ok(SDL.Init(SDL::INIT_VIDEO), 'SDL.Init failed')

  window = SDL.CreateWindow(
    FFI::MemoryPointer.from_string('SDL3 GPU Spinning Cube (Ruby)'),
    960,
    540,
    SDL::WINDOW_RESIZABLE | SDL::WINDOW_HIGH_PIXEL_DENSITY
  )
  ensure_ok(!(window.nil? || window.null?), 'CreateWindow failed')

  format_flags = SDL::GPU_SHADERFORMAT_DXIL | SDL::GPU_SHADERFORMAT_SPIRV
  gpu_device = SDL.CreateGPUDevice(format_flags, true, nil)
  ensure_ok(!(gpu_device.nil? || gpu_device.null?), 'CreateGPUDevice failed')

  ensure_ok(SDL.ClaimWindowForGPUDevice(gpu_device, window), 'ClaimWindowForGPUDevice failed')

  shader_format, shader_ext = select_shader_format(gpu_device)
  render_state = init_cube_pipeline(gpu_device, window, shader_format, shader_ext)
  sprite_state = init_sprite_overlay(gpu_device, window, shader_format, shader_ext)
  window_state = {
    angle_x: 0,
    angle_y: 0,
    angle_z: 0,
    tex_depth: nil,
    prev_w: 0,
    prev_h: 0,
    sprite: init_sprite_window_state
  }

  event = SDL::Event.new
  done = false

  while !done
    while SDL.PollEvent(event)
      case event[:common][:type]
      when SDL::EVENT_QUIT
        done = true
      when SDL::EVENT_KEY_DOWN
        key = event[:key][:key]
        done = true if key == SDL::SDLK_ESCAPE
        if key == SDL::SDLK_S
          sprite_state[:show_sprites] = !sprite_state[:show_sprites]
        end
      end
    end

    cmd = SDL.AcquireGPUCommandBuffer(gpu_device)
    ensure_ok(!(cmd.nil? || cmd.null?), 'AcquireGPUCommandBuffer failed')

    swapchain_ptr = FFI::MemoryPointer.new(:pointer)
    drawable_w_ptr = FFI::MemoryPointer.new(:uint)
    drawable_h_ptr = FFI::MemoryPointer.new(:uint)

    unless SDL.WaitAndAcquireGPUSwapchainTexture(cmd, window, swapchain_ptr, drawable_w_ptr, drawable_h_ptr)
      SDL.CancelGPUCommandBuffer(cmd)
      raise "WaitAndAcquireGPUSwapchainTexture failed: #{sdl_error}"
    end

    swapchain_texture = swapchain_ptr.read_pointer
    if swapchain_texture.null?
      SDL.CancelGPUCommandBuffer(cmd)
      next
    end

    drawable_w = drawable_w_ptr.read_uint
    drawable_h = drawable_h_ptr.read_uint

    update_sprite_overlay(sprite_state, window_state[:sprite], drawable_w, drawable_h)

    if window_state[:prev_w] != drawable_w || window_state[:prev_h] != drawable_h
      release_gpu_ptr(gpu_device, window_state[:tex_depth], SDL.method(:ReleaseGPUTexture))
      window_state[:tex_depth] = create_depth_texture(gpu_device, render_state[:sample_count], drawable_w, drawable_h)
      window_state[:prev_w] = drawable_w
      window_state[:prev_h] = drawable_h
    end

    model = rotate_matrix(window_state[:angle_x].to_f, 1.0, 0.0, 0.0)
    rot_y = rotate_matrix(window_state[:angle_y].to_f, 0.0, 1.0, 0.0)
    model = multiply_matrix(rot_y, model)
    rot_z = rotate_matrix(window_state[:angle_z].to_f, 0.0, 0.0, 1.0)
    model = multiply_matrix(rot_z, model)
    model[14] -= 2.5

    persp = perspective_matrix(45.0, drawable_w.to_f / drawable_h.to_f, 0.01, 100.0)
    final_matrix = multiply_matrix(persp, model)
    matrix_ptr = FFI::MemoryPointer.new(:float, 16)
    matrix_ptr.put_array_of_float(0, final_matrix)

    window_state[:angle_x] = (window_state[:angle_x] + 3) % 360
    window_state[:angle_y] = (window_state[:angle_y] + 2) % 360
    window_state[:angle_z] = (window_state[:angle_z] + 1) % 360

    color_target = SDL::GPUColorTargetInfo.new
    color_target[:texture] = swapchain_texture
    color_target[:load_op] = SDL::GPU_LOADOP_CLEAR
    color_target[:store_op] = SDL::GPU_STOREOP_STORE
    color_target[:clear_color][:a] = 1.0

    depth_target = SDL::GPUDepthStencilTargetInfo.new
    depth_target[:texture] = window_state[:tex_depth]
    depth_target[:clear_depth] = 1.0
    depth_target[:load_op] = SDL::GPU_LOADOP_CLEAR
    depth_target[:store_op] = SDL::GPU_STOREOP_DONT_CARE
    depth_target[:stencil_load_op] = SDL::GPU_LOADOP_DONT_CARE
    depth_target[:stencil_store_op] = SDL::GPU_STOREOP_DONT_CARE
    depth_target[:cycle] = true

    vertex_binding = SDL::GPUBufferBinding.new
    vertex_binding[:buffer] = render_state[:buf_vertex]
    vertex_binding[:offset] = 0

    SDL.PushGPUVertexUniformData(cmd, 0, matrix_ptr, 16 * FFI.type_size(:float))

    pass = SDL.BeginGPURenderPass(cmd, color_target, 1, depth_target)
    SDL.BindGPUGraphicsPipeline(pass, render_state[:pipeline])
    SDL.BindGPUVertexBuffers(pass, 0, vertex_binding, 1)
    SDL.DrawGPUPrimitives(pass, 36, 1, 0, 0)
    SDL.EndGPURenderPass(pass)

    color_target[:load_op] = SDL::GPU_LOADOP_LOAD
    overlay_pass = SDL.BeginGPURenderPass(cmd, color_target, 1, nil)
    render_sprite_overlay(overlay_pass, sprite_state, window_state[:sprite])
    SDL.EndGPURenderPass(overlay_pass)

    ensure_ok(SDL.SubmitGPUCommandBuffer(cmd), 'SubmitGPUCommandBuffer failed')
  end

  shutdown_sprite_overlay(gpu_device, sprite_state, window_state[:sprite])
  release_gpu_ptr(gpu_device, window_state[:tex_depth], SDL.method(:ReleaseGPUTexture))
  release_gpu_ptr(gpu_device, render_state[:buf_vertex], SDL.method(:ReleaseGPUBuffer))
  release_gpu_ptr(gpu_device, render_state[:pipeline], SDL.method(:ReleaseGPUGraphicsPipeline))
  SDL.ReleaseWindowFromGPUDevice(gpu_device, window)
  SDL.DestroyGPUDevice(gpu_device)
  SDL.DestroyWindow(window)
  SDL.Quit
rescue => e
  warn "[ERROR] #{e}"
  warn e.backtrace.join("\n")
  SDL.Quit
  exit(1)
end

run if __FILE__ == $PROGRAM_NAME
