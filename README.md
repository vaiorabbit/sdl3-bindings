<!-- -*- mode:markdown; coding:utf-8; -*- -->

# sdl3-bindings : SDL3 wrapper for Ruby #

*   Created : 2015-09-19
*   Last modified : 2025-07-19

## Features ##

*   Generated semi-automatically
*   Based on Ruby/FFI
    *   No need to build C extension library

See the project below to learn how to use this library:

*   Whac-a-Mole! : Ruby SDL2 bindings demo
    *   <https://github.com/vaiorabbit/sdl2-bindings-whacamole/tree/feature/sdl3>
    *   [![](http://img.youtube.com/vi/HroP-_EWcg8/mqdefault.jpg)](https://www.youtube.com/watch?v=HroP-_EWcg8)

## Limitations ##

*   Several original APIs originally defined with pre-processor macro are unavailable in this library (e.g. `SDL_TriggerBreakpoint`, `SDL_stack_alloc`, `SDL_BUTTON_MASK`, etc.)

## Target version ##

*   [2025-05-10]
    * SDL : 3.2.18
    * SDL_image : 3.2.4
    * SDL_mixer : dd801fdd9af752c99c32a2356d2ebdf1ebb7ebaa
    * SDL_sound : 68d18fe0a1105d1043b9f62d5e37fca19c0cd2c1
    * SDL_ttf : 3.2.2


<details>
<summary>Older versions</summary>

*   [2015-09-19] SDL 2.0.3
*   [2016-04-03] SDL 2.0.4
*   [2019-08-31] SDL 2.0.10
*   [2020-03-22] SDL 2.0.12
*   [2020-12-27] SDL 2.0.14
*   [2021-08-12] SDL 2.0.16
*   [2021-12-02] SDL 2.0.18
*   [2022-03-28]
    *   SDL : 2.0.20
    *   SDL_image : 2.0.5
    *   SDL_mixer : 2.0.4
    *   SDL_ttf : 2.0.18
    *   SDL2_gfx : 1.0.4
    *   SDL_sound : 2.0.1
*   [2022-04-29]
    *   SDL : 2.0.22
    *   SDL_image : 2.0.5
    *   SDL_mixer : 2.0.4
    *   SDL_ttf : 2.0.18
    *   SDL2_gfx : 1.0.4
    *   SDL_sound : 2.0.1
*   [2022-07-31]
    *   SDL : 2.0.22
    *   SDL_image : 2.6.0
    *   SDL_mixer : 2.6.0
    *   SDL_ttf : 2.20.0
    *   SDL2_gfx : 1.0.4
    *   SDL_sound : 2.0.1
*   [2022-08-20]
    *   SDL : 2.24.0
    *   SDL_image : 2.6.2
    *   SDL_mixer : 2.6.2
    *   SDL_ttf : 2.20.1
    *   SDL2_gfx : 1.0.4
    *   SDL_sound : 2.0.1
*   [2022-10-09]
    *   SDL : 2.24.1
    *   SDL_image : 2.6.2
    *   SDL_mixer : 2.6.2
    *   SDL_ttf : 2.20.1
    *   SDL2_gfx : 1.0.4
    *   SDL_sound : 2.0.1
*   [2022-11-03]
    *   SDL : 2.24.2
    *   SDL_image : 2.6.2
    *   SDL_mixer : 2.6.2
    *   SDL_ttf : 2.20.1
    *   SDL2_gfx : 1.0.4
    *   SDL_sound : 2.0.1
*   [2022-11-23]
    *   SDL : 2.26.0 - 2.26.2
    *   SDL_image : 2.6.2
    *   SDL_mixer : 2.6.2
    *   SDL_ttf : 2.20.1
    *   SDL2_gfx : 1.0.4
    *   SDL_sound : 2.0.1
*   [2025-01-26]
    *   SDL : 3.2.4
    *   SDL_image : 3.2.0
    *   SDL_mixer : 3.0.0
    *   SDL_ttf : 3.1.2
    *   SDL_sound : 3.0.0
*   [2025-03-29]
    *   SDL : 3.2.8
    *   SDL_image : 3.2.4
    *   SDL_mixer : 698aaa2e2fd18900f0e28132a8de9b48538d4857
    *   SDL_ttf : 3.2.0
    *   SDL_sound : f2705793331771fc584c34c3b26581462a3e95f4
*   [2025-05-10]
    * SDL : 3.2.12
    * SDL_image : 3.2.4
    * SDL_mixer : b3a6fa8b5ad183f0a1bad02527d89a00c3c90106
    * SDL_sound : 68d18fe0a1105d1043b9f62d5e37fca19c0cd2c1
    * SDL_ttf : 3.2.2

</details>

## Tested Environments ##

*   [2025-03-29] Windows 11 (24H2), ruby 3.4.2 (2025-02-15 revision d2930f8e7a) +PRISM [x64-mingw-ucrt]

<details>
<summary>Older Environments</summary>

*   [2025-01-26] Windows 11 (24H2), ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +PRISM [x64-mingw-ucrt]
*   [2023-02-05] Ubuntu Linux 22.04 LTS (jammy) on WSL/Windows 11, ruby 3.2.0 (2022-12-25 revision a528908271) [x86_64-linux]
*   [2023-01-07] Windows 11 (22H2), ruby 3.2.0 (2022-12-25 revision a528908271) [x64-mingw-ucrt]
*   [2023-01-07] macOS Ventura (13.1) ruby 3.2.0 (2022-12-25 revision a528908271) [arm64-darwin21]
*   [2022-10-09] Debian 11 (bullseye) on ASUS Chromebook Detachable CZ1, ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [aarch64-linux]
*   [2022-04-29] Windows 10 (21H1), ruby 3.1.1p18 (2022-02-18 revision 53f5fc4236) [x64-mingw-ucrt]
*   [2022-10-09] macOS Monterey (12.5.1), ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [arm64-darwin21]
*   [2022-07-31] macOS Monterey (12.4), ruby 3.1.0p0 (2021-12-25 revision fb4df44d16) [arm64-darwin21]
*   [2022-02-12] Windows 10 (21H1), ruby 3.1.0p0 (2021-12-25 revision fb4df44d16) [x64-mingw-ucrt]
*   [2022-01-11] macOS Monterey (12.1), ruby 3.1.0p0 (2021-12-25 revision fb4df44d16) [arm64-darwin20]
*   [2021-12-02] macOS Big Sur (11.6), ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [arm64-darwin20]
*   [2021-08-12] macOS Big Sur (11.5), ruby 3.0.1p64 (2021-04-05 revision 0fb782ee38) [arm64-darwin20]
*   [2020-12-27] macOS Big Sur (11.0.1), ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [arm64-darwin20]
*   [2016-04-03] Mac OS X 10.11.4, ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
*   [2015-09-19] Mac OS X 10.10.5, ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]

</details>

## License ##

The zlib/libpng License ( http://opensource.org/licenses/Zlib ).

    This software is provided 'as-is', without any express or implied
    warranty. In no event will the authors be held liable for any damages
    arising from the use of this software.

    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:

        1. The origin of this software must not be misrepresented; you must not
        claim that you wrote the original software. If you use this software
        in a product, an acknowledgment in the product documentation would be
        appreciated but is not required.

        2. Altered source versions must be plainly marked as such, and must not be
        misrepresented as being the original software.

        3. This notice may not be removed or altered from any source
        distribution.
