package example.module.thumbnail.view;
import hex.event.Dispatcher;
import hex.event.Event;
import hex.event.MessageType;
import hex.log.Logger;
import js.html.DivElement;
import js.Browser;
import js.html.Image;
import example.module.thumbnail.view.message.ThumbnailViewMessage;
import js.html.InputElement;
import js.html.MouseEvent;
import js.html.KeyboardEvent;

/**
 * ...
 * @author gtakaro
 */
class ThumbnailView implements IThumbnailView
{

	var thumbnailBar:DivElement;
	
	var dispatcher:Dispatcher<IThumbnailViewListener>;
	
		
	public function new() 
	{
		this.dispatcher = new Dispatcher();
		this.thumbnailBar = cast Browser.document.getElementById("thumbnailBar");
	}
	
	public function setImages(urls:Array<String>) : Void
	{
		Logger.DEBUG( "ThumbnailModule setImages urls:" + urls );
		
		while (this.thumbnailBar.firstChild != null) {
			this.thumbnailBar.removeChild(this.thumbnailBar.firstChild);
		}
		
		for (url in urls) {
			var tImage:Image = new Image();
			tImage.src = url;
			tImage.width = 200;
			var f = this._onClick.bind(_, url);
			tImage.addEventListener( "click", f );
			this.thumbnailBar.appendChild(tImage);
		}
		
		this.dispatcher.dispatch( ThumbnailViewMessage.THUMBNAIL_CLICK, [urls[0]]);
	}
	
	private function _onClick(e:MouseEvent, url:String):Void 
	{
		this.dispatcher.dispatch( ThumbnailViewMessage.THUMBNAIL_CLICK, [url]);
	}
	
	/* INTERFACE example.module.thumbnail.view.IThumbnailView */
	
	public function addHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool 
	{
		return this.dispatcher.addHandler( messageType, scope, callback );
	}
	
	public function removeHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool 
	{
		return this.dispatcher.removeHandler( messageType, scope, callback );
	}
	
	@:isVar public var visible(get, set):Bool;
	
	function get_visible():Bool 
	{
		return visible;
	}
	
	function set_visible(value:Bool):Bool 
	{
		return visible = value;
	}
	
}