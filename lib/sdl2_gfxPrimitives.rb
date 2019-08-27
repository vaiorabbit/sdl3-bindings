# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL2_GFXPRIMITIVES_MAJOR = 1
  SDL2_GFXPRIMITIVES_MINOR = 0
  SDL2_GFXPRIMITIVES_MICRO = 4

  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_gfx_primitives_symbols()
    gfx_primitives_symbols = [
      :pixelColor,
      :pixelRGBA,
      :hlineColor,
      :hlineRGBA,
      :vlineColor,
      :vlineRGBA,
      :rectangleColor,
      :rectangleRGBA,
      :roundedRectangleColor,
      :roundedRectangleRGBA,
      :boxColor,
      :boxRGBA,
      :roundedBoxColor,
      :roundedBoxRGBA,
      :lineColor,
      :lineRGBA,
      :aalineColor,
      :aalineRGBA,
      :thickLineColor,
      :thickLineRGBA,
      :circleColor,
      :circleRGBA,
      :arcColor,
      :arcRGBA,
      :aacircleColor,
      :aacircleRGBA,
      :filledCircleColor,
      :filledCircleRGBA,
      :ellipseColor,
      :ellipseRGBA,
      :aaellipseColor,
      :aaellipseRGBA,
      :filledEllipseColor,
      :filledEllipseRGBA,
      :pieColor,
      :pieRGBA,
      :filledPieColor,
      :filledPieRGBA,
      :trigonColor,
      :trigonRGBA,
      :aatrigonColor,
      :aatrigonRGBA,
      :filledTrigonColor,
      :filledTrigonRGBA,
      :polygonColor,
      :polygonRGBA,
      :aapolygonColor,
      :aapolygonRGBA,
      :filledPolygonColor,
      :filledPolygonRGBA,
      :texturedPolygon,
      :bezierColor,
      :bezierRGBA,
      :gfxPrimitivesSetFont,
      :gfxPrimitivesSetFontRotation,
      :characterColor,
      :characterRGBA,
      :stringColor,
      :stringRGBA,
    ]
    gfx_primitives_args = {
      :pixelColor => [:pointer, :short, :short, :uint], 
      :pixelRGBA => [:pointer, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :hlineColor => [:pointer, :short, :short, :short, :uint], 
      :hlineRGBA => [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :vlineColor => [:pointer, :short, :short, :short, :uint], 
      :vlineRGBA => [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :rectangleColor => [:pointer, :short, :short, :short, :short, :uint], 
      :rectangleRGBA => [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :roundedRectangleColor => [:pointer, :short, :short, :short, :short, :short, :uint], 
      :roundedRectangleRGBA => [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :boxColor => [:pointer, :short, :short, :short, :short, :uint], 
      :boxRGBA => [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :roundedBoxColor => [:pointer, :short, :short, :short, :short, :short, :uint], 
      :roundedBoxRGBA => [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :lineColor => [:pointer, :short, :short, :short, :short, :uint], 
      :lineRGBA => [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :aalineColor => [:pointer, :short, :short, :short, :short, :uint], 
      :aalineRGBA => [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :thickLineColor => [:pointer, :short, :short, :short, :short, :uchar, :uint], 
      :thickLineRGBA => [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar, :uchar], 
      :circleColor => [:pointer, :short, :short, :short, :uint], 
      :circleRGBA => [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :arcColor => [:pointer, :short, :short, :short, :short, :short, :uint], 
      :arcRGBA => [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :aacircleColor => [:pointer, :short, :short, :short, :uint], 
      :aacircleRGBA => [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :filledCircleColor => [:pointer, :short, :short, :short, :uint], 
      :filledCircleRGBA => [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :ellipseColor => [:pointer, :short, :short, :short, :short, :uint], 
      :ellipseRGBA => [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :aaellipseColor => [:pointer, :short, :short, :short, :short, :uint], 
      :aaellipseRGBA => [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :filledEllipseColor => [:pointer, :short, :short, :short, :short, :uint], 
      :filledEllipseRGBA => [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :pieColor => [:pointer, :short, :short, :short, :short, :short, :uint], 
      :pieRGBA => [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :filledPieColor => [:pointer, :short, :short, :short, :short, :short, :uint], 
      :filledPieRGBA => [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :trigonColor => [:pointer, :short, :short, :short, :short, :short, :short, :uint], 
      :trigonRGBA => [:pointer, :short, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :aatrigonColor => [:pointer, :short, :short, :short, :short, :short, :short, :uint], 
      :aatrigonRGBA => [:pointer, :short, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :filledTrigonColor => [:pointer, :short, :short, :short, :short, :short, :short, :uint], 
      :filledTrigonRGBA => [:pointer, :short, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], 
      :polygonColor => [:pointer, :pointer, :pointer, :int, :uint], 
      :polygonRGBA => [:pointer, :pointer, :pointer, :int, :uchar, :uchar, :uchar, :uchar], 
      :aapolygonColor => [:pointer, :pointer, :pointer, :int, :uint], 
      :aapolygonRGBA => [:pointer, :pointer, :pointer, :int, :uchar, :uchar, :uchar, :uchar], 
      :filledPolygonColor => [:pointer, :pointer, :pointer, :int, :uint], 
      :filledPolygonRGBA => [:pointer, :pointer, :pointer, :int, :uchar, :uchar, :uchar, :uchar], 
      :texturedPolygon => [:pointer, :pointer, :pointer, :int, :pointer, :int, :int], 
      :bezierColor => [:pointer, :pointer, :pointer, :int, :int, :uint], 
      :bezierRGBA => [:pointer, :pointer, :pointer, :int, :int, :uchar, :uchar, :uchar, :uchar], 
      :gfxPrimitivesSetFont => [:pointer, :uint, :uint], 
      :gfxPrimitivesSetFontRotation => [:uint], 
      :characterColor => [:pointer, :short, :short, :char, :uint], 
      :characterRGBA => [:pointer, :short, :short, :char, :uchar, :uchar, :uchar, :uchar], 
      :stringColor => [:pointer, :short, :short, :pointer, :uint], 
      :stringRGBA => [:pointer, :short, :short, :pointer, :uchar, :uchar, :uchar, :uchar], 
    }
    gfx_primitives_retvals = {
      :pixelColor => :int,
      :pixelRGBA => :int,
      :hlineColor => :int,
      :hlineRGBA => :int,
      :vlineColor => :int,
      :vlineRGBA => :int,
      :rectangleColor => :int,
      :rectangleRGBA => :int,
      :roundedRectangleColor => :int,
      :roundedRectangleRGBA => :int,
      :boxColor => :int,
      :boxRGBA => :int,
      :roundedBoxColor => :int,
      :roundedBoxRGBA => :int,
      :lineColor => :int,
      :lineRGBA => :int,
      :aalineColor => :int,
      :aalineRGBA => :int,
      :thickLineColor => :int,
      :thickLineRGBA => :int,
      :circleColor => :int,
      :circleRGBA => :int,
      :arcColor => :int,
      :arcRGBA => :int,
      :aacircleColor => :int,
      :aacircleRGBA => :int,
      :filledCircleColor => :int,
      :filledCircleRGBA => :int,
      :ellipseColor => :int,
      :ellipseRGBA => :int,
      :aaellipseColor => :int,
      :aaellipseRGBA => :int,
      :filledEllipseColor => :int,
      :filledEllipseRGBA => :int,
      :pieColor => :int,
      :pieRGBA => :int,
      :filledPieColor => :int,
      :filledPieRGBA => :int,
      :trigonColor => :int,
      :trigonRGBA => :int,
      :aatrigonColor => :int,
      :aatrigonRGBA => :int,
      :filledTrigonColor => :int,
      :filledTrigonRGBA => :int,
      :polygonColor => :int,
      :polygonRGBA => :int,
      :aapolygonColor => :int,
      :aapolygonRGBA => :int,
      :filledPolygonColor => :int,
      :filledPolygonRGBA => :int,
      :texturedPolygon => :int,
      :bezierColor => :int,
      :bezierRGBA => :int,
      :gfxPrimitivesSetFont => :void,
      :gfxPrimitivesSetFontRotation => :void,
      :characterColor => :int,
      :characterRGBA => :int,
      :stringColor => :int,
      :stringRGBA => :int,
    }
    gfx_primitives_symbols.each do |sym|
      begin
        attach_function sym, gfx_primitives_args[sym], gfx_primitives_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

