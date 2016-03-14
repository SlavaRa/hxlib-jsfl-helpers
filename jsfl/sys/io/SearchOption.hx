package jsfl.sys.io;

enum SearchOption {
	
	/**
	 * Includes the current directory and all its subdirectories in a search operation. This option includes reparse points such as mounted drives and symbolic links in the search.
	 */
	AllDirectories;
	
	/**
	 * Includes only the current directory in a search operation.
	 */
	TopDirectoryOnly;
}