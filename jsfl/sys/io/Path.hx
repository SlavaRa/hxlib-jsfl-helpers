package jsfl.sys.io;

extern class Path {
	
	/**
	 * Combines two strings into a path.
	 * @param	path1 The first path to combine.
	 * @param	path2 The second path to combine.
	 * @return 	The combined paths.
	 */
	public static inline function combine2(path1:String, path2:String):String {
		return haxe.io.Path.addTrailingSlash(path1) + path2;
	}
	
	/**
	 * Combines three strings into a path.
	 * @param	path1 The first path to combine.
	 * @param	path2 The second path to combine.
	 * @param	path3 The third path to combine.
	 * @return  The combined paths.
	 */
	public static inline function combine3(path1:String, path2:String, path3:String):String {
		return haxe.io.Path.addTrailingSlash(combine2(path1, path2)) + path3;
	}
}