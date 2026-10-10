$dir = "C:\Users\nik20\AndroidStudioProjects\23_Tarasenko\app\src\main\res\raw"
if (!(Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir }
$url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
$output = Join-Path $dir "music.mp3"
try {
    Invoke-WebRequest -Uri $url -OutFile $output
    Write-Host "Downloaded successfully"
} catch {
    Write-Host "Download failed: $_"
}
