workspace "DirectX2DGameEngine"
	architecture "x86_64"
	toolset "v143"
	cppdialect "C++20"
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "DirectX2DGameEngine"
	location "DirectX2DGameEngine"
	kind "SharedLib"
	language "C++"

	targetdir("../output/bin/" .. outputdir .. "/%{prj.name}")
	objdir("../output/bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "stdafx.h"
    pchsource "DirectX2DGameEngine/src/Headers/stdafx.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/src/**.hpp",
		"premake5.lua"
	}

	includedirs
	{
		"%{prj.name}/src/Headers",
	}

	libdirs
	{
	}

	links
	{
		"d3d11",
		"d3dcompiler",
		"dxgi",
		"dinput8",
		"dxguid",
	}

	filter "system:windows"
		staticruntime "off"
		systemversion "latest"

	filter "configurations:Debug"
		defines "_DEBUG"
		staticruntime "off"
		symbols "On"
		runtime "Debug"

		defines
		{
		}

		libdirs
		{
		}

		links
		{
		}

	filter "configurations:Release"
		defines "_RELEASE"
		staticruntime "off"
		optimize "On"
		runtime "Release"
		

		defines
		{
		}


		libdirs
		{
		}

		links
		{
		}

	filter "configurations:Dist"
		defines "_DIST"
		staticruntime "off"
		optimize "On"
		runtime "Release"

		libdirs
		{
		}
		
		links
		{
		}