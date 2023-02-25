$OutputFile = "C:\_DEV\Akcenta\emails.txt" #Resulting file with harvested info
$SiteMapFile = "C:\_DEV\Akcenta\sitemap.xml" #Source file with URL addresses to check and harvest the data from
Get-Content -Path $SiteMapFile | ForEach-Object -Process {
    $URL = $_;
    $Request = Invoke-WebRequest $URL;$Request.AllElements | Where-Object {$_.InnerHtml -like "*@*"} | Select-Object innerText -Unique | Where-Object{$_.InnerText -like "*@*.*"} | Select-Object -ExpandProperty innerText >> $OutputFile
}
