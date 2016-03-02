package jsfl;
import jsfl.Library;
using StringTools;

/**
 * @author SlavaRa
 */
class LibraryHelper {
	public static inline function getLinkageClassNames(lib:Library):Array<String> {
		return [for(it in lib.items) if(it.linkageExportForAS) it.linkageClassName];
	}
	
	public static inline function getNameToLinkageClassName(lib:Library):Map<String, String> {
		return [for(it in lib.items) if(it.linkageExportForAS) it.name => it.linkageClassName];
	}
	
	public static inline function getLinkageClassNameToName(lib:Library):Map<String, String> {
		return [for(it in lib.items) if(it.linkageExportForAS) it.linkageClassName => it.name];
	}
	
	public static inline function getLinkageClassNamesFromFolder(lib:Library, folder:String):Array<String> {
		var linkagesToNames = getLinkageClassNameToName(lib);
		var result = new Array<String>();
		for(linkage in linkagesToNames.keys()) {
			var name = linkagesToNames.get(linkage);
			if(!name.startsWith('${folder}/')) continue;
			result.push(linkage);
		}
		return result;
	}
}