# Contains posix-like commands, such as 'which' etc.

<#
.SYNOPSIS
  returns the full path for a given command (if it is an executable).
  Uses the system PATH for information.
#>

function which([string]$exe) {
  if (!$exe.EndsWith('.exe')) { $exe = [String]::Format('{0}.exe', $exe) }
  [Environment]::GetEnvironmentVariable("PATH").Split([IO.Path]::PathSeparator)`
  | foreach-object {
    $var = [String]::Format('{0}{1}{2}',
                            $_,
                            [IO.Path]::DirectorySeparatorChar,
                            $exe)
    if (test-path $var) { return $var }
  }
  return $null
}
