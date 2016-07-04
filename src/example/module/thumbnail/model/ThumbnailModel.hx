package example.module.thumbnail.model;

/**
 * ...
 * @author gtakaro
 */
class ThumbnailModel implements IThumbnailModel
{

	var _images : Array<String>;
	var flickrPageNumber : Int;
	var _dispatcher : ThumbnailModelDispatcher;
	
	public function new() 
	{
		this._dispatcher = new ThumbnailModelDispatcher();
		this.flickrPageNumber = 0;
	}
	
	
	/* INTERFACE example.module.thumbnail.model.IThumbnailModel */
	
	public function setImages(urls:Array<String>):Void 
	{
		this._images = urls;
		this._dispatcher.onImagesChange( urls );
	}
	
	public function getImages():Array<String> 
	{
		return this._images;
	}
	
	public function addListener(listener:IThumbnailModelListener):Void 
	{
		this._dispatcher.addListener( listener );
	}
	
	public function removeListener(listener:IThumbnailModelListener):Void 
	{
		this._dispatcher.removeListener( listener );
	}
	
	public function getFlickrPageNumber( ) : Int {
		return this.flickrPageNumber;
	}
	
	public function setFlickrPageNumber( page : Int ) : Void
	{
		this.flickrPageNumber = page;
	}
}