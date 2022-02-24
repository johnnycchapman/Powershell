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

try
{
    Merge-CSVFiles -CSVPath ".\" -XLOutput ".\Inventory-Joint.xlsx"
    Write-Host "Merging csv file into Excel!" -ForegroundColor Green
}
catch {
    Write-Error -Message $_.Exception
    Write-Host "Export failed." -ForegroundColor Red
}