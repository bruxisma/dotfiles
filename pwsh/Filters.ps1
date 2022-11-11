filter Replace-Root { $_.Replace((Resolve-Path $_).Drive.Root, '/') }
filter Replace-Home { $_.Replace($HOME, '~') }
filter Replace-Sep { $_.Replace('\', '/') }
