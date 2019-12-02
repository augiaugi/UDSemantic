try
{   
    $ErrorActionPreference = 'Stop'

    Import-Module UniversalDashboard.Community -Force
    Import-Module "$((Get-Item $PSScriptRoot).Parent.FullName)\output\UniversalDashboard.Semantic\UniversalDashboard.Semantic.psm1" -Force

    $Dashboard = New-UDDashboard -Title "Breadcrump" -Content {
        New-UDSemanticBreadcrump -Sections @(
            New-UDSemanticBreadcrumpSection -Text 'Home'
            New-UDSemanticBreadcrumpSection -Text 'Page1'
            New-UDSemanticBreadcrumpSection -Text 'Page2'
        )
    }
    
    $Server = Start-UDDashboard -Port 10000 -Dashboard $Dashboard

    Read-Host "press any key to stop the UD server (http://localhost:10000/) ..."
}
catch
{
    throw
}
finally
{
    if($Server)
    {
        Stop-UDDashboard -Server $Server
    }
}