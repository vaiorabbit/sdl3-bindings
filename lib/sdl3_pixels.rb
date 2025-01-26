# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  ALPHA_OPAQUE = 255
  ALPHA_OPAQUE_FLOAT = 1.0
  ALPHA_TRANSPARENT = 0
  ALPHA_TRANSPARENT_FLOAT = 0.0

  # Enum

  PIXELTYPE_UNKNOWN = 0
  PIXELTYPE_INDEX1 = 1
  PIXELTYPE_INDEX4 = 2
  PIXELTYPE_INDEX8 = 3
  PIXELTYPE_PACKED8 = 4
  PIXELTYPE_PACKED16 = 5
  PIXELTYPE_PACKED32 = 6
  PIXELTYPE_ARRAYU8 = 7
  PIXELTYPE_ARRAYU16 = 8
  PIXELTYPE_ARRAYU32 = 9
  PIXELTYPE_ARRAYF16 = 10
  PIXELTYPE_ARRAYF32 = 11
  PIXELTYPE_INDEX2 = 12
  BITMAPORDER_NONE = 0
  BITMAPORDER_4321 = 1
  BITMAPORDER_1234 = 2
  PACKEDORDER_NONE = 0
  PACKEDORDER_XRGB = 1
  PACKEDORDER_RGBX = 2
  PACKEDORDER_ARGB = 3
  PACKEDORDER_RGBA = 4
  PACKEDORDER_XBGR = 5
  PACKEDORDER_BGRX = 6
  PACKEDORDER_ABGR = 7
  PACKEDORDER_BGRA = 8
  ARRAYORDER_NONE = 0
  ARRAYORDER_RGB = 1
  ARRAYORDER_RGBA = 2
  ARRAYORDER_ARGB = 3
  ARRAYORDER_BGR = 4
  ARRAYORDER_BGRA = 5
  ARRAYORDER_ABGR = 6
  PACKEDLAYOUT_NONE = 0
  PACKEDLAYOUT_332 = 1
  PACKEDLAYOUT_4444 = 2
  PACKEDLAYOUT_1555 = 3
  PACKEDLAYOUT_5551 = 4
  PACKEDLAYOUT_565 = 5
  PACKEDLAYOUT_8888 = 6
  PACKEDLAYOUT_2101010 = 7
  PACKEDLAYOUT_1010102 = 8
  PIXELFORMAT_UNKNOWN = 0
  PIXELFORMAT_INDEX1LSB = 286261504
  PIXELFORMAT_INDEX1MSB = 287310080
  PIXELFORMAT_INDEX2LSB = 470811136
  PIXELFORMAT_INDEX2MSB = 471859712
  PIXELFORMAT_INDEX4LSB = 303039488
  PIXELFORMAT_INDEX4MSB = 304088064
  PIXELFORMAT_INDEX8 = 318769153
  PIXELFORMAT_RGB332 = 336660481
  PIXELFORMAT_XRGB4444 = 353504258
  PIXELFORMAT_XBGR4444 = 357698562
  PIXELFORMAT_XRGB1555 = 353570562
  PIXELFORMAT_XBGR1555 = 357764866
  PIXELFORMAT_ARGB4444 = 355602434
  PIXELFORMAT_RGBA4444 = 356651010
  PIXELFORMAT_ABGR4444 = 359796738
  PIXELFORMAT_BGRA4444 = 360845314
  PIXELFORMAT_ARGB1555 = 355667970
  PIXELFORMAT_RGBA5551 = 356782082
  PIXELFORMAT_ABGR1555 = 359862274
  PIXELFORMAT_BGRA5551 = 360976386
  PIXELFORMAT_RGB565 = 353701890
  PIXELFORMAT_BGR565 = 357896194
  PIXELFORMAT_RGB24 = 386930691
  PIXELFORMAT_BGR24 = 390076419
  PIXELFORMAT_XRGB8888 = 370546692
  PIXELFORMAT_RGBX8888 = 371595268
  PIXELFORMAT_XBGR8888 = 374740996
  PIXELFORMAT_BGRX8888 = 375789572
  PIXELFORMAT_ARGB8888 = 372645892
  PIXELFORMAT_RGBA8888 = 373694468
  PIXELFORMAT_ABGR8888 = 376840196
  PIXELFORMAT_BGRA8888 = 377888772
  PIXELFORMAT_XRGB2101010 = 370614276
  PIXELFORMAT_XBGR2101010 = 374808580
  PIXELFORMAT_ARGB2101010 = 372711428
  PIXELFORMAT_ABGR2101010 = 376905732
  PIXELFORMAT_RGB48 = 403714054
  PIXELFORMAT_BGR48 = 406859782
  PIXELFORMAT_RGBA64 = 404766728
  PIXELFORMAT_ARGB64 = 405815304
  PIXELFORMAT_BGRA64 = 407912456
  PIXELFORMAT_ABGR64 = 408961032
  PIXELFORMAT_RGB48_FLOAT = 437268486
  PIXELFORMAT_BGR48_FLOAT = 440414214
  PIXELFORMAT_RGBA64_FLOAT = 438321160
  PIXELFORMAT_ARGB64_FLOAT = 439369736
  PIXELFORMAT_BGRA64_FLOAT = 441466888
  PIXELFORMAT_ABGR64_FLOAT = 442515464
  PIXELFORMAT_RGB96_FLOAT = 454057996
  PIXELFORMAT_BGR96_FLOAT = 457203724
  PIXELFORMAT_RGBA128_FLOAT = 455114768
  PIXELFORMAT_ARGB128_FLOAT = 456163344
  PIXELFORMAT_BGRA128_FLOAT = 458260496
  PIXELFORMAT_ABGR128_FLOAT = 459309072
  PIXELFORMAT_YV12 = 842094169
  PIXELFORMAT_IYUV = 1448433993
  PIXELFORMAT_YUY2 = 844715353
  PIXELFORMAT_UYVY = 1498831189
  PIXELFORMAT_YVYU = 1431918169
  PIXELFORMAT_NV12 = 842094158
  PIXELFORMAT_NV21 = 825382478
  PIXELFORMAT_P010 = 808530000
  PIXELFORMAT_EXTERNAL_OES = 542328143
  PIXELFORMAT_RGBA32 = 376840196
  PIXELFORMAT_ARGB32 = 377888772
  PIXELFORMAT_BGRA32 = 372645892
  PIXELFORMAT_ABGR32 = 373694468
  PIXELFORMAT_RGBX32 = 374740996
  PIXELFORMAT_XRGB32 = 375789572
  PIXELFORMAT_BGRX32 = 370546692
  PIXELFORMAT_XBGR32 = 371595268
  COLOR_TYPE_UNKNOWN = 0
  COLOR_TYPE_RGB = 1
  COLOR_TYPE_YCBCR = 2
  COLOR_RANGE_UNKNOWN = 0
  COLOR_RANGE_LIMITED = 1
  COLOR_RANGE_FULL = 2
  COLOR_PRIMARIES_UNKNOWN = 0
  COLOR_PRIMARIES_BT709 = 1
  COLOR_PRIMARIES_UNSPECIFIED = 2
  COLOR_PRIMARIES_BT470M = 4
  COLOR_PRIMARIES_BT470BG = 5
  COLOR_PRIMARIES_BT601 = 6
  COLOR_PRIMARIES_SMPTE240 = 7
  COLOR_PRIMARIES_GENERIC_FILM = 8
  COLOR_PRIMARIES_BT2020 = 9
  COLOR_PRIMARIES_XYZ = 10
  COLOR_PRIMARIES_SMPTE431 = 11
  COLOR_PRIMARIES_SMPTE432 = 12
  COLOR_PRIMARIES_EBU3213 = 22
  COLOR_PRIMARIES_CUSTOM = 31
  TRANSFER_CHARACTERISTICS_UNKNOWN = 0
  TRANSFER_CHARACTERISTICS_BT709 = 1
  TRANSFER_CHARACTERISTICS_UNSPECIFIED = 2
  TRANSFER_CHARACTERISTICS_GAMMA22 = 4
  TRANSFER_CHARACTERISTICS_GAMMA28 = 5
  TRANSFER_CHARACTERISTICS_BT601 = 6
  TRANSFER_CHARACTERISTICS_SMPTE240 = 7
  TRANSFER_CHARACTERISTICS_LINEAR = 8
  TRANSFER_CHARACTERISTICS_LOG100 = 9
  TRANSFER_CHARACTERISTICS_LOG100_SQRT10 = 10
  TRANSFER_CHARACTERISTICS_IEC61966 = 11
  TRANSFER_CHARACTERISTICS_BT1361 = 12
  TRANSFER_CHARACTERISTICS_SRGB = 13
  TRANSFER_CHARACTERISTICS_BT2020_10BIT = 14
  TRANSFER_CHARACTERISTICS_BT2020_12BIT = 15
  TRANSFER_CHARACTERISTICS_PQ = 16
  TRANSFER_CHARACTERISTICS_SMPTE428 = 17
  TRANSFER_CHARACTERISTICS_HLG = 18
  TRANSFER_CHARACTERISTICS_CUSTOM = 31
  MATRIX_COEFFICIENTS_IDENTITY = 0
  MATRIX_COEFFICIENTS_BT709 = 1
  MATRIX_COEFFICIENTS_UNSPECIFIED = 2
  MATRIX_COEFFICIENTS_FCC = 4
  MATRIX_COEFFICIENTS_BT470BG = 5
  MATRIX_COEFFICIENTS_BT601 = 6
  MATRIX_COEFFICIENTS_SMPTE240 = 7
  MATRIX_COEFFICIENTS_YCGCO = 8
  MATRIX_COEFFICIENTS_BT2020_NCL = 9
  MATRIX_COEFFICIENTS_BT2020_CL = 10
  MATRIX_COEFFICIENTS_SMPTE2085 = 11
  MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL = 12
  MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL = 13
  MATRIX_COEFFICIENTS_ICTCP = 14
  MATRIX_COEFFICIENTS_CUSTOM = 31
  CHROMA_LOCATION_NONE = 0
  CHROMA_LOCATION_LEFT = 1
  CHROMA_LOCATION_CENTER = 2
  CHROMA_LOCATION_TOPLEFT = 3
  COLORSPACE_UNKNOWN = 0
  COLORSPACE_SRGB = 301991328
  COLORSPACE_SRGB_LINEAR = 301991168
  COLORSPACE_HDR10 = 301999616
  COLORSPACE_JPEG = 570426566
  COLORSPACE_BT601_LIMITED = 554703046
  COLORSPACE_BT601_FULL = 571480262
  COLORSPACE_BT709_LIMITED = 554697761
  COLORSPACE_BT709_FULL = 571474977
  COLORSPACE_BT2020_LIMITED = 554706441
  COLORSPACE_BT2020_FULL = 571483657
  COLORSPACE_RGB_DEFAULT = 301991328
  COLORSPACE_YUV_DEFAULT = 570426566

  # Typedef

  typedef :int, :SDL_PixelType
  typedef :int, :SDL_BitmapOrder
  typedef :int, :SDL_PackedOrder
  typedef :int, :SDL_ArrayOrder
  typedef :int, :SDL_PackedLayout
  typedef :int, :SDL_PixelFormat
  typedef :int, :SDL_ColorType
  typedef :int, :SDL_ColorRange
  typedef :int, :SDL_ColorPrimaries
  typedef :int, :SDL_TransferCharacteristics
  typedef :int, :SDL_MatrixCoefficients
  typedef :int, :SDL_ChromaLocation
  typedef :int, :SDL_Colorspace

  # Struct

  class Color < FFI::Struct
    layout(
      :r, :uchar,
      :g, :uchar,
      :b, :uchar,
      :a, :uchar,
    )
  end

  class FColor < FFI::Struct
    layout(
      :r, :float,
      :g, :float,
      :b, :float,
      :a, :float,
    )
  end

  class Palette < FFI::Struct
    layout(
      :ncolors, :int,
      :colors, :pointer,
      :version, :uint,
      :refcount, :int,
    )
  end

  class PixelFormatDetails < FFI::Struct
    layout(
      :format, :int,
      :bits_per_pixel, :uchar,
      :bytes_per_pixel, :uchar,
      :padding, [:uchar, 2],
      :Rmask, :uint,
      :Gmask, :uint,
      :Bmask, :uint,
      :Amask, :uint,
      :Rbits, :uchar,
      :Gbits, :uchar,
      :Bbits, :uchar,
      :Abits, :uchar,
      :Rshift, :uchar,
      :Gshift, :uchar,
      :Bshift, :uchar,
      :Ashift, :uchar,
    )
  end


  # Function

  def self.setup_pixels_symbols(output_error = false)
    entries = [
      [:GetPixelFormatName, :SDL_GetPixelFormatName, [:int], :pointer],
      [:GetMasksForPixelFormat, :SDL_GetMasksForPixelFormat, [:int, :pointer, :pointer, :pointer, :pointer, :pointer], :bool],
      [:GetPixelFormatForMasks, :SDL_GetPixelFormatForMasks, [:int, :uint, :uint, :uint, :uint], :int],
      [:GetPixelFormatDetails, :SDL_GetPixelFormatDetails, [:int], :pointer],
      [:CreatePalette, :SDL_CreatePalette, [:int], :pointer],
      [:SetPaletteColors, :SDL_SetPaletteColors, [:pointer, :pointer, :int, :int], :bool],
      [:DestroyPalette, :SDL_DestroyPalette, [:pointer], :void],
      [:MapRGB, :SDL_MapRGB, [:pointer, :pointer, :uchar, :uchar, :uchar], :uint],
      [:MapRGBA, :SDL_MapRGBA, [:pointer, :pointer, :uchar, :uchar, :uchar, :uchar], :uint],
      [:GetRGB, :SDL_GetRGB, [:uint, :pointer, :pointer, :pointer, :pointer, :pointer], :void],
      [:GetRGBA, :SDL_GetRGBA, [:uint, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :void],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

