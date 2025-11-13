# jiejiariapi
api for jiejiariapi.com  Free holiday in China
# Example
```nim
import asyncdispatch, jiejiariapi, json, strutils
let data = waitFor get_holidays(2025)
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
