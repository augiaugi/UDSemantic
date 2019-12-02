<#
.SYNOPSIS
    Sample control for UniversalDashboard.
.DESCRIPTION
    Sample control function for UniversalDashboard. This function must have an ID and return a hash table.
.PARAMETER Id
    An id for the component default value will be generated by new-guid.
.EXAMPLE
    PS C:\> New-UDSemanticBreadcrumpSection -Text 'Home' -Link 'https://google.com' -Active
    create a new section with a link
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
function New-UDSemanticBreadcrumpSection {
    param(
        [Parameter()]
        [string]$Text,

        [Parameter()]
        [string]$Link,

        [Parameter()]
        [switch]$Active
    )

    End {

        $Object = @{
            content = $Text
            active = $Active
        }

        if($Link)
        {
            $Object.href = $Link
            $Object.link = $true
        }

        $Object.PSTypeNames.Insert(0, 'UDSemantic.BreadcrumpSection')

        return $Object
    }
}