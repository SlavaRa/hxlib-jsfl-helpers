package jsfl;
import jsfl.Library;

/**
 * @author SlavaRa
 */
class LibraryHelper {
	
	public static inline function getLinkageClassNames(lib:Library):Array<String> {
		return [for(it in lib.items) if(it.linkageExportForAS) it.linkageClassName];
	}
}