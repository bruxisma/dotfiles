@{
  Rules = @{
    PSUseConsistentWhitespace = @{
      Enable = $true
    }
    PSUseConsistentIndentation = @{
      Enable = $true
      IndentationSize = 2
      Kind = 'space'
    }
    PSPlaceOpenBrace = @{
      Enable = $true
      OnSameLine = $true
    }
    PSAlignAssignmentStatement = @{
      Enable = $true
      CheckHashTable = $true
    }
    PSAvoidLongLines = @{
      Enable = $true
      MaximumLineLength = 100
    }
  }
}
