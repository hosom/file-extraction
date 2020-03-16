@load ../__load__

module FileExtraction;

const archive_types: set[string] = { "application/x-rar-compressed",
									"application/x-bzip2",
									"application/gzip",
									"application/x-lzma",
									"application/x-lzip",
									"application/x-xz",
									"application/x-lzop",
									"application/x-compress",
									"application/x-7z-compressed",
									"application/x-ace-compressed",
									"application/vnd.ms-cab-compressed",
									"application/x-gtar",
									"application/zip",
								  };

hook FileExtraction::extract(f: fa_file, meta: fa_metadata) &priority=5
	{
	if ( meta$mime_type in archive_types )
		break;
	}
