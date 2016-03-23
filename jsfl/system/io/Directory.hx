package jsfl.system.io;
using Lambda;
using StringTools;
using jsfl.FLfile;
using system.io.Path;
using system.io.SearchOption;

class Directory {
	
	/**
	 * Returns the names of the subdirectories (including their paths) that match the specified search pattern in the specified directory, and optionally searches subdirectories.
	 * @param path The relative or absolute path to the directory to search. This string is not case-sensitive.
	 * @param searchPattern The search string to match against the names of subdirectories in path. This parameter can contain a combination of valid literal and wildcard characters (see Remarks), but doesn't support regular expressions.
	 * @param searchOption One of the enumeration values that specifies whether the search operation should include all subdirectories or only the current directory.
	 * @return An array of the full names (including paths) of the subdirectories that match the specified criteria, or an empty array if no directories are found.
	 */
	public static inline function getFiles(path:String, searchPattern:String, searchOption:SearchOption):Array<String> {
		return _getFiles(haxe.io.Path.addTrailingSlash(path), searchPattern, searchOption, []);
	}
	
	static inline var FILES:String = "files";
	static inline var DIRECTORIES:String = "directories";
	
	static function _getFiles(path:String, pattern:String, option:SearchOption, result:Array<String>):Array<String> {
		var paths = FLfile.listFolder(haxe.io.Path.addTrailingSlash(path), FILES);
		if(pattern.startsWith("*")) {
			var extension = pattern.substring(1);
			paths = paths.filter(function(p) return p.endsWith(extension));
		}
		paths = paths.map(function(p) return path.combine2(p));
		result = result.concat(paths);
		if(option == SearchOption.AllDirectories) {
			for(it in FLfile.listFolder(path, DIRECTORIES)) {
				result = result.concat(_getFiles(path.combine2(it), pattern, option, []));
			}
		}
		return result;
	}
}
