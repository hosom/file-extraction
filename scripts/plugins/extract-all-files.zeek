@load ../__load__

module FileExtraction;

hook FileExtraction::extract(f: fa_file, meta: fa_metadata) &priority=10
	{
	break;
	}
