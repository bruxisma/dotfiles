<# This file is the "common" set of options that we use #>
@{
  link = @(
      @{ source = '$env:XDG_CONFIG_HOME/git'; target = 'git' }
      @{ source = '$HOME/.gvimrc'; target = "gvimrc" },
      @{ source = '$HOME/.vimrc'; target = "vimrc" },
      @{ source = '$HOME/.vim'; target = "vim" }
  )
  alias = @{
    which = 'Get-Command'
    edit = 'Edit-File'
    info = "Get-Help"
  }
  env = @(
      #    FZF_DEFAULT_COMMAND = "fd --type f",
      #    GOPATH = '$HOME/.cache/Go'
  )
  input = @(
    @{ key = "Ctrl+d"; function = "DeleteCharOrExit" }
    @{ key = "Ctrl+a"; function = "BeginningOfLine" }
    @{ key = "Ctrl+e"; function = "EndOfLine" }
  )
  readline = @{
    colors = @{
      ContinuationPrompt = "White"
      Default = "White"
      Parameter = "DarkMagenta"
      Operator = "Magenta"
      Type = "Blue"
    }
  }
}
