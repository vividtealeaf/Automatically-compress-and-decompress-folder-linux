# Automatically-compress-folder
Recursively compresses every folder inside a target folder.

Uses tar to create the archive and then uses xz to compress it for the best compression ratio.
Threads used by xz can be changed in the script. The compression ratio can also be changed.

Make sure to change the directory in the script.
This script also uses detox (https://github.com/dharple/detox). Download it from your favourite package manager before excecuting the script.
