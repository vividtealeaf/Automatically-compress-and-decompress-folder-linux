# Automatically-compress-folder (linux only)
Recursively compresses every folder inside a target folder.

Uses tar to create the archive and then uses xz to compress it for the best compression ratio.  
Threads used by xz can be changed in the script. The compression ratio can also be changed. 

Make sure to change the directory in the script.  
This script also uses detox (https://github.com/dharple/detox). Download it from your favourite package manager before excecuting the script. 

Fully written in bash.  

## Dependencies

This script requires:

detox - Renames folders to allow easier compression (https://github.com/dharple/detox)  
xz - For compression using the lzma2 algorithm (https://github.com/xz-mirror/xz)  
tar - For creating archives which will be later compressed (This should be installed already) 

Install these using your favourite package manager or build them from source if not available.

## Running

Before anything make sure to ``` cd ``` into the cloned repo.

To run this script make sure it is excecutable with:
```
chmod +x auto-compress.sh
```

Then run it with:
```
./auto-compress.sh
```
### substitute auto-decompress.sh in place of auto-compress.sh to decompress .tar.xz folders


## usage - Auto-compression

To use the script open it in a text editor and change the directory variable to the folder in which all other folders should be compressed.

For example: If you have a folder named 'Games' with contents being 'Game1', 'Game2' and 'Game3', then setting 'Games' as the directory will compress the 'Game1', 'Game2' and 'Game3' folders.

## usage - Auto-decompression

To use the script open it in a text editor and change the directory variable to the folder in which all other folders should be decompressed.

For example: If you have a folder named 'Games' with contents being 'Game1.tar.xz', 'Game2.tar.xz' and 'Game3.tar.xz', then setting 'Games' as the directory will decompress the 'Game1.tar.xz', 'Game2.tar.xz' and 'Game3.tar.xz' folders.

The script first decompresses them all with ``` xz -d ``` and then untars them with ``` tar -xf ```


