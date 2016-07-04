package example.module.flickr.view;
import hex.event.MessageType;
import hex.view.IView;

/**
 * @author gtakaro
 */
interface IFlickrView extends IView
{
 
	function showFullSizeGalleryImage( src : String ) : Void;
	
	function addHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
	
	function removeHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;

}