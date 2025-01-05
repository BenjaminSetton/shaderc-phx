
project "ShaderC"

	location "out"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"
	warnings "off"
	targetname "shaderc"

	targetdir ("out/bin/" .. outputDir)
	objdir ("out/obj/" .. outputDir)

	files
	{
		"libshaderc/src/*",
		"libshaderc_util/src/*"
	}
	
	includedirs
	{
		"libshaderc/include",
		"libshaderc_util/include",
		"third_party/glslang/",
		"third_party/googletest/googletest/include",
		"third_party/googletest/googlemock/include",
		"third_party/spirv-headers/include",
		"third_party/spirv-tools/include"
	}
	
	defines
	{
		"ENABLE_HLSL"
	}
	
	filter "system:windows"
		defines
		{
			"WIN32"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"
