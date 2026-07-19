# coding: utf-8
require_relative '../lib/sdl3'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl3_lib()
  exit unless SDL.Init(SDL::INIT_VIDEO)

  # SDL_ShowSimpleMessageBox
  success = SDL.ShowSimpleMessageBox(SDL::MESSAGEBOX_ERROR,
                                     "Simple MessageBox",
                                     "これが SDL_ShowSimpleMessageBox です。",
                                     nil)

  # SDL_ShowMessageBox
  buttons = FFI::MemoryPointer.new(SDL::MessageBoxButtonData, 2)
  button = [SDL::MessageBoxButtonData.new(buttons[0]), SDL::MessageBoxButtonData.new(buttons[1])]

  button[0][:flags] = SDL::MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT
  button[0][:buttonID] = 0
  button[0][:text] = FFI::MemoryPointer.from_string("OK")

  button[1][:flags] = SDL::MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT
  button[1][:buttonID] = 1
  button[1][:text] = FFI::MemoryPointer.from_string("Cancel")

  data = SDL::MessageBoxData.new
  data[:flags] = SDL::MESSAGEBOX_INFORMATION
  data[:window] = nil
  data[:title] = FFI::MemoryPointer.from_string("Custom MessageBox")
  data[:message] = FFI::MemoryPointer.from_string("カスタマイズされたメッセージボックスの利用例です。")
  data[:numbuttons] = 2
  data[:buttons] = buttons
  data[:colorScheme] = nil

  clicked = FFI::MemoryPointer.new(:int)
  success = SDL.ShowMessageBox(data, clicked)
  puts "Clicked button id: #{clicked.read_int}" if success

  SDL.Quit()
end
