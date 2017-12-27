# Pluma-Manual-save-file-versioner
Bash script for Pluma editor... This bash script is for "External tools" from snippets


## Setting Pluma
* Menu Tools -> Manage external tools -> add tool -> write this bash script 
```bash
#!/bin/bash
bash "/path/to/script/save_script.sh" -f="$PLUMA_CURRENT_DOCUMENT_PATH"
```
* Set keyboard shortcut and use it as save
* Set *Save* and *Input* as **Current Document**
* *Output:* Display in bottom panel
