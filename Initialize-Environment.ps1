param()

# This forces XDG values on windows, even for apps not launched via pwsh
if ($IsWindows) {
  Set-ItemProperty -Path HKCU:Environment -Name XDG_CONFIG_HOME -Value "${HOME}/.config"
  Set-ItemProperty -Path HKCU:Environment -Name XDG_CACHE_HOME -Value "${HOME}/.cache"
  Set-ItemProperty -Path HKCU:Environment -Name XDG_STATE_HOME -Value "${HOME}/.local/state"
  Set-ItemProperty -Path HKCU:Environment -Name XDG_DATA_HOME -Value "${HOME}/.local/share"
}

Enable-ExperimentalFeature -Name PSCommandNotFoundSuggestion
Enable-ExperimentalFeature -Name PSNativePSPathResolution
Enable-ExperimentalFeature -Name PSAnsiRenderingFileInfo
