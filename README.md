#  Module for File Extraction

This is a Zeek package that provides convenient extraction of files.

As a secondary goal, this script performs additional commonly requested file extraction and logging tasks, such as naming extracted files after their calculated file checksum or naming the file with its common file extension.

## Installing with zkg (preferred)

This package can be installed through the [zeek package manager](https://docs.zeek.org/projects/package-manager/en/stable/quickstart.html) by utilizing the following commands:

```sh
zkg install zeek/hosom/file-extraction

# you must separately load the package for it to actually do anything
zkg load zeek/hosom/file-extraction
```

## Installing manually

While not preferred, this package can also be installed manually. To do this, follow the tasks below:

```
cd <prefix>/share/zeek/site

git clone git://github.com/hosom/file-extraction file-extraction

echo "@load file-extraction" >> local.zeek
```

## Configuration

The package installs with the **extract-common-exploit-types.zeek** policy, however, additional functionality may be desired. 

Configuration must **always be done within the config.zeek** file. Failure to isolate configuration to **config.zeek** will result in your configuration being overwritten.

### Advanced Configuration

For advanced configuration of file extraction, the best option available is to hook the FileExtraction::extract hook. For examples of this, look at the scripts in the plugins directory.

## Plugins

### extract-all-files.zeek

Attaches the extract files analyzer to every file that has a mime_type detected.

### extract-java.zeek

Attaches the extract files analyzer to every JNLP and Java Archive file detected.

### extract-pe.zeek

Attaches the extract files analyzer to every PE file detected.

### extract-ms-office.zeek

Attaches the extract files analyzer to every ms office file detected.

### extract-pdf.zeek

Attaches the extract files analyzer to every PDF file detected.

### extract-common-exploit-types.zeek

Loads the following plugins:
- extract-java.zeek
- extract-pe.zeek
- extract-ms-office.zeek
- extract-pdf.zeek

### store-files-by-md5.zeek

Uses file_state_remove to rename extracted files based on the md5 checksum whenever it is available.

### store-files-by-sha1.zeek

Uses file_state_remove to rename extracted files based on the sha1 checksum whenever it is available.

### store-files-by-sha256.zeek

Uses file_state_remove to rename extracted files based on the sha256 checksum whenever it is available.
