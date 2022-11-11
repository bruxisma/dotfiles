# Contains posix-like commands, such as 'which' etc.

<#
.SYNOPSIS
  returns the full path for a given command (if it is an executable).
  Uses the system PATH for information.
#>

function which([string]$exe) {
  if (!$exe.EndsWith('.exe')) { $exe = [String]::Format('{0}.exe', $exe) }
  $env:PATH.Split([IO.Path]::PathSeparator) | foreach-object {
    $path = [IO.Path]::Combine($_, $exe)
    if (test-path $path) { return $path }
  }
  return $null
}
