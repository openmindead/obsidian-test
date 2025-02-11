#!/bin/bash

# Search for .json files in the parent directory
cd "$(dirname "${BASH_SOURCE[0]}")" || exit
cd ../../!Notes/Manuscripts/Output/ 
realpath | pbcopy
echo "Пусть скопирован! Теперь можно вернуться в настройки плагина Obsidian и вставить значение в поле Export Folder."
