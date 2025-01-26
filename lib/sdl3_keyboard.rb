# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  PROP_TEXTINPUT_TYPE_NUMBER = "SDL.textinput.type"
  PROP_TEXTINPUT_CAPITALIZATION_NUMBER = "SDL.textinput.capitalization"
  PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN = "SDL.textinput.autocorrect"
  PROP_TEXTINPUT_MULTILINE_BOOLEAN = "SDL.textinput.multiline"
  PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER = "SDL.textinput.android.inputtype"

  # Enum

  TEXTINPUT_TYPE_TEXT = 0
  TEXTINPUT_TYPE_TEXT_NAME = 1
  TEXTINPUT_TYPE_TEXT_EMAIL = 2
  TEXTINPUT_TYPE_TEXT_USERNAME = 3
  TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN = 4
  TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE = 5
  TEXTINPUT_TYPE_NUMBER = 6
  TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN = 7
  TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE = 8
  CAPITALIZE_NONE = 0
  CAPITALIZE_SENTENCES = 1
  CAPITALIZE_WORDS = 2
  CAPITALIZE_LETTERS = 3

  # Typedef

  typedef :uint, :SDL_KeyboardID
  typedef :int, :SDL_TextInputType
  typedef :int, :SDL_Capitalization

  # Struct


  # Function

  def self.setup_keyboard_symbols(output_error = false)
    entries = [
      [:HasKeyboard, :SDL_HasKeyboard, [], :bool],
      [:GetKeyboards, :SDL_GetKeyboards, [:pointer], :pointer],
      [:GetKeyboardNameForID, :SDL_GetKeyboardNameForID, [:uint], :pointer],
      [:GetKeyboardFocus, :SDL_GetKeyboardFocus, [], :pointer],
      [:GetKeyboardState, :SDL_GetKeyboardState, [:pointer], :pointer],
      [:ResetKeyboard, :SDL_ResetKeyboard, [], :void],
      [:GetModState, :SDL_GetModState, [], :ushort],
      [:SetModState, :SDL_SetModState, [:ushort], :void],
      [:GetKeyFromScancode, :SDL_GetKeyFromScancode, [:int, :ushort, :bool], :uint],
      [:GetScancodeFromKey, :SDL_GetScancodeFromKey, [:uint, :pointer], :int],
      [:SetScancodeName, :SDL_SetScancodeName, [:int, :pointer], :bool],
      [:GetScancodeName, :SDL_GetScancodeName, [:int], :pointer],
      [:GetScancodeFromName, :SDL_GetScancodeFromName, [:pointer], :int],
      [:GetKeyName, :SDL_GetKeyName, [:uint], :pointer],
      [:GetKeyFromName, :SDL_GetKeyFromName, [:pointer], :uint],
      [:StartTextInput, :SDL_StartTextInput, [:pointer], :bool],
      [:StartTextInputWithProperties, :SDL_StartTextInputWithProperties, [:pointer, :uint], :bool],
      [:TextInputActive, :SDL_TextInputActive, [:pointer], :bool],
      [:StopTextInput, :SDL_StopTextInput, [:pointer], :bool],
      [:ClearComposition, :SDL_ClearComposition, [:pointer], :bool],
      [:SetTextInputArea, :SDL_SetTextInputArea, [:pointer, :pointer, :int], :bool],
      [:GetTextInputArea, :SDL_GetTextInputArea, [:pointer, :pointer, :pointer], :bool],
      [:HasScreenKeyboardSupport, :SDL_HasScreenKeyboardSupport, [], :bool],
      [:ScreenKeyboardShown, :SDL_ScreenKeyboardShown, [:pointer], :bool],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

