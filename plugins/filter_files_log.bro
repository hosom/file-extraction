# Filter files.log based on a whitelist
# Aaron Eppert - 2016

module Filter_FilesLog;

export {
	## Analyzers we wish to include
	const whitelist = set("EXTRACT", "PE") &redef;
}

# Filter out files.log entries if the
event bro_init()
{
	Log::remove_default_filter(Files::LOG);
	Log::add_filter(Files::LOG, [$name = "files-log-filter-whitelist",
		$pred(rec: Files::Info) = {
			local result = T;
			if ( rec?$analyzers ) {
				for (wl_entry in whitelist) {
					if ( wl_entry in rec$analyzers ) {
						result = T;
						break; 
					} else {
						result = F;
					}
	
				}
			}
			
			return result;
		}
	]);
}
