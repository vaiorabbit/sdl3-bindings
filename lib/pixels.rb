module SDL2

  extend Fiddle::Importer

  # Transparency definitions
  SDL_ALPHA_OPAQUE      = 255
  SDL_ALPHA_TRANSPARENT = 0

  # Pixel type
  SDL_PIXELTYPE_UNKNOWN  = 0
  SDL_PIXELTYPE_INDEX1   = 1
  SDL_PIXELTYPE_INDEX4   = 2
  SDL_PIXELTYPE_INDEX8   = 3
  SDL_PIXELTYPE_PACKED8  = 4
  SDL_PIXELTYPE_PACKED16 = 5
  SDL_PIXELTYPE_PACKED32 = 6
  SDL_PIXELTYPE_ARRAYU8  = 7
  SDL_PIXELTYPE_ARRAYU16 = 8
  SDL_PIXELTYPE_ARRAYU32 = 9
  SDL_PIXELTYPE_ARRAYF16 = 10
  SDL_PIXELTYPE_ARRAYF32 = 11

  # Bitmap pixel order, high bit -> low bit
  SDL_BITMAPORDER_NONE = 0
  SDL_BITMAPORDER_4321 = 1
  SDL_BITMAPORDER_1234 = 2

  # Packed component order, high bit -> low bit
  SDL_PACKEDORDER_NONE = 0
  SDL_PACKEDORDER_XRGB = 1
  SDL_PACKEDORDER_RGBX = 2
  SDL_PACKEDORDER_ARGB = 3
  SDL_PACKEDORDER_RGBA = 4
  SDL_PACKEDORDER_XBGR = 5
  SDL_PACKEDORDER_BGRX = 6
  SDL_PACKEDORDER_ABGR = 7
  SDL_PACKEDORDER_BGRA = 8

  # Array component order, low byte -> high byte
  SDL_ARRAYORDER_NONE = 0
  SDL_ARRAYORDER_RGB  = 1
  SDL_ARRAYORDER_RGBA = 2
  SDL_ARRAYORDER_ARGB = 3
  SDL_ARRAYORDER_BGR  = 4
  SDL_ARRAYORDER_BGRA = 5
  SDL_ARRAYORDER_ABGR = 6

  # Packed component layout
  SDL_PACKEDLAYOUT_NONE    = 0
  SDL_PACKEDLAYOUT_332     = 1
  SDL_PACKEDLAYOUT_4444    = 2
  SDL_PACKEDLAYOUT_1555    = 3
  SDL_PACKEDLAYOUT_5551    = 4
  SDL_PACKEDLAYOUT_565     = 5
  SDL_PACKEDLAYOUT_8888    = 6
  SDL_PACKEDLAYOUT_2101010 = 7
  SDL_PACKEDLAYOUT_1010102 = 8

  def self.fourcc(a, b, c, d)
    ((a & 0x000000ff) << 0) | ((b & 0x000000ff) << 8) | ((c & 0x000000ff) << 16) | ((d & 0x000000ff) << 24)
  end

  def self.pixelfourcc(a, b, c, d)
    fourcc(a.ord, b.ord, c.ord, d.ord)
  end

  def self.pixelformat(type, order, layout, bits, bytes)
    ((1 << 28) | ((type) << 24) | ((order) << 20) | ((layout) << 16) | ((bits) << 8) | ((bytes) << 0))
  end

  def self.pixelflag(x); (((x) >> 28) & 0x0F); end
  def self.pixeltype(x); (((x) >> 24) & 0x0F); end
  def self.pixelorder(x); (((x) >> 20) & 0x0F); end
  def self.pixellayout(x); (((x) >> 16) & 0x0F); end
  def self.bitsperpixel(x) (((x) >> 8) & 0xFF); end
  def self.bytesperpixel(x)
    (ispixelformat_fourcc(x) ? 
       ((((x) == SDL_PIXELFORMAT_YUY2) || 
         ((x) == SDL_PIXELFORMAT_UYVY) || 
         ((x) == SDL_PIXELFORMAT_YVYU)) ? 2 : 1) : (((x) >> 0) & 0xFF))
  end

  def self.ispixelformat_indexed(format)
    (!ispixelformat_fourcc(format) &&
     ((pixeltype(format) == SDL_PIXELTYPE_INDEX1) ||
      (pixeltype(format) == SDL_PIXELTYPE_INDEX4) ||
      (pixeltype(format) == SDL_PIXELTYPE_INDEX8)))
  end

  def self.ispixelformat_alpha_old(format) # [Warning] SDL 2.0.3
    (!ispixelformat_fourcc(format) &&
     ((pixelorder(format) == SDL_PACKEDORDER_ARGB) ||
      (pixelorder(format) == SDL_PACKEDORDER_RGBA) ||
      (pixelorder(format) == SDL_PACKEDORDER_ABGR) ||
      (pixelorder(format) == SDL_PACKEDORDER_BGRA)))
  end

  def self.ispixelformat_packed(format) # [Warning] Available since SDL 2.0.4
    (!ispixelformat_fourcc(format) && 
     ((pixeltype(format) == SDL_PIXELTYPE_PACKED8)  ||
      (pixeltype(format) == SDL_PIXELTYPE_PACKED16) ||
      (pixeltype(format) == SDL_PIXELTYPE_PACKED32)))
  end

  def self.ispixelformat_array(format) # [Warning] Available since SDL 2.0.4
    (!ispixelformat_fourcc(format) &&
     ((pixeltype(format) == SDL_PIXELTYPE_ARRAYU8)  ||
      (pixeltype(format) == SDL_PIXELTYPE_ARRAYU16) ||
      (pixeltype(format) == SDL_PIXELTYPE_ARRAYU32) ||
      (pixeltype(format) == SDL_PIXELTYPE_ARRAYF16) ||
      (pixeltype(format) == SDL_PIXELTYPE_ARRAYF32)))
  end

  def self.ispixelformat_alpha(format) # [Warning] Available since SDL 2.0.4
    ((!ispixelformat_fourcc(format) &&
      ((pixelorder(format) == SDL_PACKEDORDER_ARGB) ||
       (pixelorder(format) == SDL_PACKEDORDER_RGBA) ||
       (pixelorder(format) == SDL_PACKEDORDER_ABGR) ||
       (pixelorder(format) == SDL_PACKEDORDER_BGRA))) ||
     (ispixelformat_array(format) &&
      ((pixelorder(format) == SDL_ARRAYORDER_ARGB) ||
       (pixelorder(format) == SDL_ARRAYORDER_RGBA) ||
       (pixelorder(format) == SDL_ARRAYORDER_ABGR) ||
       (pixelorder(format) == SDL_ARRAYORDER_BGRA))))
  end


  def self.ispixelformat_fourcc(format)
    ((format) && (pixelflag(format) != 1))
  end


  SDL_PIXELFORMAT_UNKNOWN     = 0
  SDL_PIXELFORMAT_INDEX1LSB   = pixelformat(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_4321, 0, 1, 0)
  SDL_PIXELFORMAT_INDEX1MSB   = pixelformat(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_1234, 0, 1, 0)
  SDL_PIXELFORMAT_INDEX4LSB   = pixelformat(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_4321, 0, 4, 0)
  SDL_PIXELFORMAT_INDEX4MSB   = pixelformat(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_1234, 0, 4, 0)
  SDL_PIXELFORMAT_INDEX8      = pixelformat(SDL_PIXELTYPE_INDEX8, 0, 0, 8, 1)
  SDL_PIXELFORMAT_RGB332      = pixelformat(SDL_PIXELTYPE_PACKED8, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_332, 8, 1)
  SDL_PIXELFORMAT_RGB444      = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_4444, 12, 2)
  SDL_PIXELFORMAT_RGB555      = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_1555, 15, 2)
  SDL_PIXELFORMAT_BGR555      = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_1555, 15, 2)
  SDL_PIXELFORMAT_ARGB4444    = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_4444, 16, 2)
  SDL_PIXELFORMAT_RGBA4444    = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_4444, 16, 2)
  SDL_PIXELFORMAT_ABGR4444    = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_4444, 16, 2)
  SDL_PIXELFORMAT_BGRA4444    = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_4444, 16, 2)
  SDL_PIXELFORMAT_ARGB1555    = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_1555, 16, 2)
  SDL_PIXELFORMAT_RGBA5551    = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_5551, 16, 2)
  SDL_PIXELFORMAT_ABGR1555    = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_1555, 16, 2)
  SDL_PIXELFORMAT_BGRA5551    = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_5551, 16, 2)
  SDL_PIXELFORMAT_RGB565      = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_565, 16, 2)
  SDL_PIXELFORMAT_BGR565      = pixelformat(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_565, 16, 2)
  SDL_PIXELFORMAT_RGB24       = pixelformat(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_RGB, 0, 24, 3)
  SDL_PIXELFORMAT_BGR24       = pixelformat(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_BGR, 0, 24, 3)
  SDL_PIXELFORMAT_RGB888      = pixelformat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_8888, 24, 4)
  SDL_PIXELFORMAT_RGBX8888    = pixelformat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBX, SDL_PACKEDLAYOUT_8888, 24, 4)
  SDL_PIXELFORMAT_BGR888      = pixelformat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_8888, 24, 4)
  SDL_PIXELFORMAT_BGRX8888    = pixelformat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRX, SDL_PACKEDLAYOUT_8888, 24, 4)
  SDL_PIXELFORMAT_ARGB8888    = pixelformat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_8888, 32, 4)
  SDL_PIXELFORMAT_RGBA8888    = pixelformat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_8888, 32, 4)
  SDL_PIXELFORMAT_ABGR8888    = pixelformat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_8888, 32, 4)
  SDL_PIXELFORMAT_BGRA8888    = pixelformat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_8888, 32, 4)
  SDL_PIXELFORMAT_ARGB2101010 = pixelformat(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_2101010, 32, 4)

  SDL_PIXELFORMAT_YV12 = pixelfourcc('Y', 'V', '1', '2')
  SDL_PIXELFORMAT_IYUV = pixelfourcc('I', 'Y', 'U', 'V')
  SDL_PIXELFORMAT_YUY2 = pixelfourcc('Y', 'U', 'Y', '2')
  SDL_PIXELFORMAT_UYVY = pixelfourcc('U', 'Y', 'V', 'Y')
  SDL_PIXELFORMAT_YVYU = pixelfourcc('Y', 'V', 'Y', 'U')
  SDL_PIXELFORMAT_NV12 = pixelfourcc('N', 'V', '1', '2') # [Warning] Available since SDL 2.0.4
  SDL_PIXELFORMAT_NV21 = pixelfourcc('N', 'V', '2', '1') # [Warning] Available since SDL 2.0.4


  SDL_Color = struct(["unsigned char r",
                      "unsigned char g",
                      "unsigned char b",
                      "unsigned char a"])

  SDL_Palette = struct(["int ncolors",
                        "SDL_Color* colors",
                        "unsigned int version",
                        "int refcount"])

  SDL_PixelFormat = struct(["unsigned int format",
                            "SDL_Palette* palette",
                            "unsigned char BitsPerPixel",
                            "unsigned char BytesPerPixel",
                            "unsigned char padding[2]",
                            "unsigned int Rmask",
                            "unsigned int Gmask",
                            "unsigned int Bmask",
                            "unsigned int Amask",
                            "unsigned char Rloss",
                            "unsigned char Gloss",
                            "unsigned char Bloss",
                            "unsigned char Aloss",
                            "unsigned char Rshift",
                            "unsigned char Gshift",
                            "unsigned char Bshift",
                            "unsigned char Ashift",
                            "int refcount",
                            "SDL_PixelFormat* next"])


  def self.import_pixels_symbols
    # function
    extern 'const char* SDL_GetPixelFormatName(unsigned int)'
    extern 'int SDL_PixelFormatEnumToMasks(unsigned int, int*, unsigned int*, unsigned int*, unsigned int*, unsigned int*)'
    extern 'unsigned int SDL_MasksToPixelFormatEnum(int, unsigned int, unsigned int, unsigned int, unsigned int)'
    extern 'SDL_PixelFormat* SDL_AllocFormat(unsigned int)'
    extern 'void SDL_FreeFormat(SDL_PixelFormat*)'
    extern 'SDL_Palette* SDL_AllocPalette(int)'
    extern 'int SDL_SetPixelFormatPalette(SDL_PixelFormat*, SDL_Palette*)'
    extern 'int SDL_SetPaletteColors(SDL_Palette*, const SDL_Color*, int, int)'
    extern 'void SDL_FreePalette(SDL_Palette*)'
    extern 'unsigned int SDL_MapRGB(const SDL_PixelFormat*, unsigned char, unsigned char, unsigned char)'
    extern 'unsigned int SDL_MapRGBA(const SDL_PixelFormat*, unsigned char, unsigned char, unsigned char, unsigned char)'
    extern 'void SDL_GetRGB(unsigned int, const SDL_PixelFormat*, unsigned char*, unsigned char*, unsigned char*)'
    extern 'void SDL_GetRGBA(unsigned int, const SDL_PixelFormat*, unsigned char*, unsigned char*, unsigned char*, unsigned char*)'
    extern 'void SDL_CalculateGammaRamp(float, unsigned short*)'
  end

end
