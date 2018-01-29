function Add-ContentToMarkdown {
    [CmdletBinding()]
    param(
        $Content = ""
    )

    Add-Content 'C:\InstalledSoftware.md' $Content
}


function Add-SoftwareDetailsToMarkdown {
    [CmdletBinding()]
    param(
        $SoftwareName = "",
        $DescriptionMarkdown = ""
    )

$Content = @"

## $SoftwareName

$Description
"@
   Add-ContentToMarkdown -Content $Content
}
