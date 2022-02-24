Function Merge-CSVFiles
{
    Param(
        $CSVPath = "C:\CSV", ## Soruce CSV Folder
        $XLOutput="C:\temp.xlsx" ## Output file name
    )

    $csvFiles = Get-ChildItem ("$CSVPath\*") -Include *.csv
    $Excel = New-Object -ComObject Excel.Application 
    $Excel.visible = $false
    $Excel.sheetsInNewWorkbook = $csvFiles.Count
    $workbooks = $excel.Workbooks.Add()
    $CSVSheet = 1

    Foreach ($CSV in $Csvfiles)

    {
        $worksheets = $workbooks.worksheets
        $CSVFullPath = $CSV.FullName
        $SheetName = ($CSV.name -split "\.")[0]
        $worksheet = $worksheets.Item($CSVSheet)
        $worksheet.Name = $SheetName
        $TxtConnector = ("TEXT;" + $CSVFullPath)
        $CellRef = $worksheet.Range("A1")
        $Connector = $worksheet.QueryTables.add($TxtConnector,$CellRef)
        $worksheet.QueryTables.item($Connector.name).TextFileCommaDelimiter = $True
        $worksheet.QueryTables.item($Connector.name).TextFileParseType  = 1
        $worksheet.QueryTables.item($Connector.name).Refresh()
        $worksheet.QueryTables.item($Connector.name).delete()
        $worksheet.UsedRange.EntireColumn.AutoFit()
        $CSVSheet++

    }

    $workbooks.SaveAs($XLOutput,51)
    $workbooks.Saved = $true
    $workbooks.Close()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbooks) | Out-Null
    $excel.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()

}
"Intialized function."


# Import Modules
#Import-Module Az.Storage
#Import-Module Az.Compute
#
## Initialize variables
#$connectionName = "AzureRunAsConnection"
#$EnvironmentName = 'AzureCloud'
#$AArg = "msp-experts" 
#$automationaccount = "PHRFSAutomation"


# Login to Azure using service Principal
#try
#{
#    # Get the connection "AzureRunAsConnection "
#    $aspervicePrincipalConnection=Get-AutomationConnection -Name $connectionName         
#    "Logging in to Azure..."
#    Connect-AzAccount `
#        -ServicePrincipal `
#        -Tenant $aspervicePrincipalConnection.TenantId `
#        -ApplicationId $aspervicePrincipalConnection.ApplicationId `
#        -CertificateThumbprint $aspervicePrincipalConnection.CertificateThumbprint `
#        -Environment $EnvironmentName
#}
#catch {
#    if (!$aspervicePrincipalConnection)
#    {
#        $ErrorMessage = "Connection $connectionName not found."
#        throw $ErrorMessage
#    } else{
#        Write-Error -Message $_.Exception
#        throw $_.Exception
#    }
#}
#"Logged in."
#
## Get Automation Account Variables 
#$Container = 'inventory'
#$Subscription = Get-AzAutomationVariable -AutomationAccountName $automationaccount -Name 'SubscriptionName' -ResourceGroupName $AArg 
#$StrgRG = Get-AzAutomationVariable -AutomationAccountName $automationaccount -Name 'StrgAcctRG' -ResourceGroupName $AArg 
#$StrgAcctName = Get-AzAutomationVariable -AutomationAccountName $automationaccount -Name 'InventoryTestStrg' -ResourceGroupName $AArg
#$StrgAcct = Get-AzStorageAccount -Name $StrgAcctName.Value -ResourceGroupName $StrgRG.Value
#
#Select-AzSubscription -Subscription $Subscription.Value


try
{
    Merge-CSVFiles -CSVPath "C:\Users\Johnny C\Desktop" -XLOutput "C:\Users\Johnny C\Desktop\Inventory-Joint.xlsx"
}
catch {
    Write-Error -Message $_.Exception
    "Export failed."
}