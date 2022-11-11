$env:EDITOR = (which gvim)
$env:GOPATH = "$HOME/.cache/go"

Append-Path $HOME/.cargo/bin
Append-Path /usr/local/go/bin
