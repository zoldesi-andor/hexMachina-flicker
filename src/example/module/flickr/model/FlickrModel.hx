package example.module.flickr.model;

/**
 * ...
 * @author gtakaro
 */
class FlickrModel implements IFlickrModel
{
	var _dispatcher : FlickrModelDispatcher;
	var _fullSizeGalleryImage : String;

	public function new() 
	{
		this._dispatcher = new FlickrModelDispatcher();
	}
	
	
	/* INTERFACE example.module.flickr.model.IFlickrModel */
	
	public function setFullSizeGalleryImage(src:String):Void 
	{
		this._fullSizeGalleryImage = src;
		this._dispatcher.onFullSizeGalleryImageChange( src );
	}
	
	public function getFullSizeGalleryImage():String 
	{
		return this._fullSizeGalleryImage;
	}
	
	public function addListener(listener:IFlickrModelListener):Void 
	{
		this._dispatcher.addListener( listener );
	}
	
	public function removeListener(listener:IFlickrModelListener):Void 
	{
		this._dispatcher.removeListener( listener );
	}
	
}