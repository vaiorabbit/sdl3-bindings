* Upstream reference:
	* https://github.com/libsdl-org/SDL/tree/main/test/testgpu

Windows shader build:

1. Open a terminal in this directory.
2. Run build-shaders.bat.
3. This generates the following files for each .hlsl shader:
	 * .dxil (preferred on Windows)
	 * .spv (fallback)

Expected generated files:

* cube.vert.dxil
* cube.vert.spv
* cube.frag.dxil
* cube.frag.spv
* overlay.vert.dxil
* overlay.vert.spv
* overlay.frag.dxil
* overlay.frag.spv
