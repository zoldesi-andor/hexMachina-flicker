package example.module.thumbnail;
import hex.module.IModule;

/**
 * @author gtakaro
 */
interface IThumbnailModule extends IModule
{
	function getFullSizeGalleryImage(actualUrl:String):Void;
}