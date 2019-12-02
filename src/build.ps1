$BuildFolder = $PSScriptRoot

$powerShellGet = Import-Module PowerShellGet  -PassThru -ErrorAction Ignore
if ($powerShellGet.Version -lt ([Version]'1.6.0')) {
    Install-Module PowerShellGet -Scope CurrentUser -Force -AllowClobber
    Import-Module PowerShellGet -Force
}

Set-Location $BuildFolder

$OutputPath = "$BuildFolder\output\UniversalDashboard.Semantic"

Remove-Item -Path "$BuildFolder\output" -Force -ErrorAction SilentlyContinue -Recurse
Remove-Item -Path "$BuildFolder\public" -Force -ErrorAction SilentlyContinue -Recurse

New-Item -Path $OutputPath -ItemType Directory

# & cyclonedx-bom -o antd.bom.xml
npm install
npm run build

Copy-Item $BuildFolder\public $OutputPath\jsfiles -Recurse -Force
Copy-Item $BuildFolder\Scripts $OutputPath\Scripts -Recurse -Force
Copy-Item $BuildFolder\less.js $OutputPath\jsfiles 
Copy-Item $BuildFolder\UniversalDashboard.Semantic.psm1 $OutputPath

Remove-Item -Path "$BuildFolder\public" -Force -ErrorAction SilentlyContinue -Recurse

$Version = "0.1.0"

$manifestParameters = @{
	Path = "$OutputPath\UniversalDashboard.Semantic.psd1"
	Author = "Augustin Ziegler"
	CompanyName = "Ironman Software, LLC"
	Copyright = "2019 Ironman Software, LLC"
	RootModule = "UniversalDashboard.Semantic.psm1"
	Description = "Semantic components for Universal Dashboard."
	ModuleVersion = $version
	Tags = @("universaldashboard")
	ReleaseNotes = "Initial release"
	FunctionsToExport = @(
		"New-UDSemanticBreadcrump", 'New-UDSemanticBreadcrumpDevider', 'New-UDSemanticBreadcrumpSection'
	)
  RequiredModules = @()
}

New-ModuleManifest @manifestParameters
