import sdl_parser, sdl_generator

TYPEDEF_PREFIX_RWOPS = """
  class RWops_mem < FFI::Struct
    layout(
      :base, :pointer,
      :here, :pointer,
      :stop, :pointer,
    )
  end

  class RWops_unknown < FFI::Struct
    layout(
      :data1, :pointer,
      :data2, :pointer,
    )
  end
  class RWops_windowsio_buffer < FFI::Struct
    layout(
      :data, :pointer,
      :size, :size_t,
      :left, :size_t,
    )
  end

  class RWops_windowsio < FFI::Struct
    layout(
      :append, :int,
      :h, :pointer,
      :buffer, RWops_windowsio_buffer,
    )
  end

  class Default_RWops_hidden < FFI::Union
    layout(
      :mem, RWops_mem,
      :unknown, RWops_unknown,
    )
  end

  class Win32_RWops_hidden < FFI::Union
    layout(
      :mem, RWops_mem,
      :unknown, RWops_unknown,
      :windowsio, RWops_windowsio,
    )
  end

  class Default_RWops < FFI::Struct
    layout(
      :size, :pointer,
      :seek, :pointer,
      :read, :pointer,
      :write, :pointer,
      :close, :pointer,
      :type, :uint,
      :hidden, Default_RWops_hidden,
    )
  end

  class Win32_RWops < FFI::Struct
    layout(
      :size, :pointer,
      :seek, :pointer,
      :read, :pointer,
      :write, :pointer,
      :close, :pointer,
      :type, :uint,
      :hidden, Win32_RWops_hidden
    )
  end

  if RUBY_PLATFORM =~ /mswin|msys|mingw|cygwin/
    RWops = Win32_RWops
  else
    RWops = Default_RWops
  end
"""

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_rwops.h')
    sdl_parser.execute(ctx)

    # TODO : Merge anonymous structs into one union (e.g. SDL_RWops)
    #
    # SDL_RWops is a bit complicated so I unfortunately have to
    # substitute the parsed definition with my handwritten one.
    ctx.decl_structs['SDL_RWops'] = None

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx,
                            typedef_prefix = TYPEDEF_PREFIX_RWOPS,
                            setup_method_name = 'rwops'
    )
