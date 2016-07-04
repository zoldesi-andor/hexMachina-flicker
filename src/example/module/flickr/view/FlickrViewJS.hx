package example.module.flickr.view;

import hex.event.Dispatcher;
import hex.event.Event;
import hex.event.MessageType;
import js.html.Image;
import js.Browser;
import example.module.flickr.view.IFlickrViewListener;
import example.module.flickr.view.message.FlickrViewMessage;

/**
 * ...
 * @author gtakaro
 */
class FlickrViewJS implements IFlickrView
{

	var fullSizeGalleryImage:Image;
	
	var dispatcher:Dispatcher<IFlickrViewListener>;
	
	public function new() 
	{
		this.dispatcher = new Dispatcher();
		this.fullSizeGalleryImage = cast Browser.document.getElementById("fullSizeGalleryImage");
		this.fullSizeGalleryImage.addEventListener( "click", this._onClick );
	}
	
	public function showFullSizeGalleryImage( src : String ) : Void
	{
		this.fullSizeGalleryImage.src = src;
	
	}
	
	private function _onClick(e:Event):Void 
	{
		this.dispatcher.dispatch( FlickrViewMessage.CLICK, [fullSizeGalleryImage.src] );
	}
	
	/* INTERFACE example.module.flickr.view.IFlickrView */
	
	@:isVar public var visible(get, set):Bool;
	
	function get_visible():Bool 
	{
		return visible;
	}
	
	function set_visible(value:Bool):Bool 
	{
		return visible = value;
	}
	
	public function addHandler( messageType : MessageType, scope : Dynamic, callback : Dynamic ) : Bool
	{
		return this.dispatcher.addHandler( messageType, scope, callback );
	}
	
	public function removeHandler( messageType : MessageType, scope : Dynamic, callback : Dynamic ) : Bool
	{
		return this.dispatcher.removeHandler( messageType, scope, callback );
	}
	
}