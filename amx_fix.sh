
#!/bin/bash
cd dependencies
rm -r amx_assembly
git clone git@github.com:Mrucznik/amx_assembly
cd amx_assembly
git checkout v4.69
cd ../
rm -r indirection
git clone git@github.com:Mrucznik/indirection



