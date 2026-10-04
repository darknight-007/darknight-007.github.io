param([int]$Port = 8742, [string]$Root = $PSScriptRoot)
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Start()
$types = @{ '.html'='text/html; charset=utf-8'; '.css'='text/css; charset=utf-8'; '.jpg'='image/jpeg'; '.png'='image/png'; '.svg'='image/svg+xml'; '.xml'='application/xml'; '.txt'='text/plain' }
while ($listener.IsListening) {
  $ctx = $listener.GetContext()
  $rel = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
  if ($rel -eq '' -or $rel.EndsWith('/')) { $rel += 'index.html' }
  $path = Join-Path $Root $rel
  if (Test-Path $path -PathType Container) { $path = Join-Path $path 'index.html' }
  if (Test-Path $path -PathType Leaf) {
    $bytes = [IO.File]::ReadAllBytes($path)
    $ext = [IO.Path]::GetExtension($path).ToLower()
    $ctx.Response.ContentType = if ($types.ContainsKey($ext)) { $types[$ext] } else { 'application/octet-stream' }
    $ctx.Response.StatusCode = 200
  } else {
    $bytes = [Text.Encoding]::UTF8.GetBytes('404')
    $ctx.Response.StatusCode = 404
    $ctx.Response.ContentType = 'text/plain'
  }
  $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
  $ctx.Response.Close()
}
