<#
.SYNOPSIS
    Sample control for UniversalDashboard.
.DESCRIPTION
    Sample control function for UniversalDashboard. This function must have an ID and return a hash table.
.PARAMETER Id
    An id for the component default value will be generated by new-guid.
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    https://react.semantic-ui.com/collections/breadcrumb/
#>
function New-UDSemanticBreadcrump {
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),

        [Parameter()]
        [Array]$Sections,

        [Parameter()]
        $Devider = (New-UDSemanticBreadcrumpDevider -Text '/'),

        [Parameter()]
        [ValidateSet('mini', 'tiny', 'small', 'large', 'big', 'huge', 'massive')]
        [string]$Size
    )

    End {
        $Object = @{
            # The AssetID of the main JS File
            assetId = $AssetId 
            # Tell UD this is a plugin
            isPlugin = $true 
            # This ID must be the same as the one used in the JavaScript to register the control with UD
            type = "ud-semantic-breadcrumb"
            # An ID is mandatory 
            id = $Id

            sections = $Sections
            divider = $Devider
        }

        if($Size)
        {
            $Object.size = $Size
        }

        $Object.PSTypeNames.Insert(0, 'UDSemantic.Breadcrump')

        return $Object
    }
}