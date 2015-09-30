Bro Module for File Extraction
==============================

This is a Bro script module for Bro (current master release only) that provides convenient extraction of files.

Additionally, this script will generate file extensions for commonly encountered file types.

Installation
------------

::

		cd <prefix>/share/bro/site/
		git clone git://github.com/hosom/bro-file-extraction file-extraction
		echo "@load file-extraction" >> local.bro

With the above installation, the module will not extract any files. In addition to the changes above, code must be written to hook FileExtraction::extract. For examples of this, look at the scripts in the plugins directory.

In many cases, the desired functionality is for files commonly containing malware or exploits to be extracted. To do that, perform the actions below.

::

		echo "@load file-extraction/plugins/extract-common-exploit-types

Additionally, to store files by sha1 hash, use the following:

::

		echo "@load file-extraction/plugins/store-files-by-sha1

Configuration
-------------

This set of scripts provides you with the ability to tune which files you are extracting and from where.

Output
-------------

Other than the extracted files, this module will generate no output.

Plugins
===============================

extract-all-files.bro
-------------

Attaches the extract files analyzer to every file that has a mime_type detected.

extract-java.bro
-------------

Attaches the extract files analyzer to every JNLP and Java Archive file detected.

extract-pe.bro
-------------

Attaches the extract files analyzer to every PE file detected.

extract-ms-office.bro
-------------

Attaches the extract files analyzer to every ms office file detected.

extract-common-exploit-types.bro
-------------

Loads the following plugins:
extract-java.bro
extract-pe.bro
extract-ms-office.bro

store-files-by-md5.bro
-------------

Uses file_state_remove to rename extracted files based on the md5 checksum whenever it is available.

store-files-by-sha1.bro
-------------

Uses file_state_remove to rename extracted files based on the sha1 checksum whenever it is available.
