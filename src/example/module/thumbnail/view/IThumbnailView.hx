package example.module.thumbnail.view;
import hex.event.MessageType;
import hex.view.IView;

/**
 * @author gtakaro
 */
interface IThumbnailView  extends IView
{
  
	function setImages(urls:Array<String>) : Void;
	
	function addHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
	
	function removeHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;

}