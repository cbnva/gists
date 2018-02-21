function Run-Command {
  Param(
    [Parameter(Mandatory=$true,
               Position = 0)]
    [String]
    $FileName,
    [Parameter(Mandatory=$true,
               Position = 1)]
    [String]
    $Arguments
    
  )
  $pinfo = new-object System.Diagnostics.ProcessStartInfo
  $pinfo.FileName = $FileName
  $pinfo.Arguments = $Arguments
  
  $pinfo.UseShellExecute = $false
  $pinfo.CreateNoWindow = $true
  $pinfo.RedirectStandardError = $true
  $pinfo.RedirectStandardOutput = $true
  
  $process = New-Object System.Diagnostics.Process 
  $process.StartInfo = $pinfo
  
  $null = $process.Start()
  $process.WaitForExit()
  
  $data = @{
            stdout = $process.StandardOutput.ReadToEnd() 
            stderr = $process.StandardError.ReadToEnd()
           }
  return $data  
}
