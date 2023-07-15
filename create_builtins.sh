#!/bin/bash
curl https://raw.githubusercontent.com/ShadowGear-SL/kwdb/dev/outputs/builtins.txt -o builtins.txt
echo "Rebuilding builtins_txt.cc..."
echo "const char *builtins_txt[] = {" > builtins_txt.cc
sed -e '/^\/\//d; s/"/\\\"/g; s/^/"/; s/$/",/' builtins.txt >> builtins_txt.cc || { rm -f builtins_txt.cc ; false ; }
echo "(char*)0 };" >> builtins_txt.cc
echo "Finished!"
