$path = ".\pz23.docx"
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead((Resolve-Path $path))
$entry = $zip.GetEntry("word/document.xml")
$stream = $entry.Open()
$reader = New-Object System.IO.StreamReader($stream)
$content = $reader.ReadToEnd()
$reader.Close()
$stream.Close()
$zip.Dispose()
[xml]$xml = $content
$ns = @{w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"}
$nodes = Select-Xml -Xml $xml -Namespace $ns -XPath "//w:p"
foreach ($p in $nodes) {
    $texts = Select-Xml -Xml $p.Node -Namespace $ns -XPath ".//w:t"
    $line = ($texts | ForEach-Object { $_.Node.InnerText }) -join ""
    if ($line.Trim() -ne "") {
        [Console]::Out.WriteLine($line)
    }
}
