package example.module.flickr.view;

import example.module.flickr.model.IFlickrModelListener;
import example.module.flickr.model.IFlickrModelRO;
import hex.control.request.StringRequest;
import hex.view.viewhelper.ViewHelper;
import example.module.flickr.view.message.FlickrViewMessage;
import example.module.flickr.message.FlickrModuleMessage;

/**
 * ...
 * @author gtakaro
 */
class FlickrViewHelper extends ViewHelper<IFlickrView> implements IFlickrViewListener implements IFlickrModelListener
{

	var _flickrView : IFlickrView; 
	
	@Inject
	var _model:IFlickrModelRO;
	
	public function new(view : IFlickrView) 
	{
		super();
	}
	
	override function _initialize():Void 
	{
		super._initialize();
		
		this._flickrView = cast this._view;
		this._flickrView.addHandler( FlickrViewMessage.CLICK, this, this.onClick );
		
		this._model.addListener(this);
	}
	
	/* INTERFACE example.module.flickr.view.IFlickrViewListener */
	
	public function onClick(url:String):Void 
	{
		this.dispatcher.dispatch( FlickrModuleMessage.GET_NEW_IMAGE, [ new StringRequest(url)] );
	}
	
	public function onFullSizeGalleryImageChange( src : String ) : Void
	{
		_flickrView.showFullSizeGalleryImage(src);
	}
}