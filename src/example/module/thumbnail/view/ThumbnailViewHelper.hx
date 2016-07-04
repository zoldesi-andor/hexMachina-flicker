package example.module.thumbnail.view;
import example.module.thumbnail.model.IThumbnailModelListener;
import example.module.thumbnail.model.IThumbnailModelRO;
import hex.control.request.SetFullSizeGalleryImageRequest;
import hex.control.request.StringRequest;
import hex.view.viewhelper.ViewHelper;
import example.module.thumbnail.message.ThumbnailModuleMessage;
import example.module.thumbnail.view.message.ThumbnailViewMessage;

/**
 * ...
 * @author gtakaro
 */
class ThumbnailViewHelper extends ViewHelper<IThumbnailView> implements IThumbnailViewListener implements IThumbnailModelListener
{

	var _thumbnailView : IThumbnailView; 
	
	@Inject
	var _model:IThumbnailModelRO;
	
	public function new(view : IThumbnailView) 
	{
		super();
	}
		
	override function _initialize():Void 
	{
		super._initialize();
		
		this._thumbnailView = cast this._view;
		this._thumbnailView.addHandler(ThumbnailViewMessage.THUMBNAIL_CLICK, this, this.onClick );
	
		this._model.addListener(this);
	}
	
	public function onClick(url:String):Void 
	{
		this.dispatcher.dispatch(ThumbnailModuleMessage.SET_FULLSIZE_GALLERY_IMAGE, [ new SetFullSizeGalleryImageRequest(url) ] );
	}
	
	public function onImagesChange( urls : Array<String> ) : Void
	{
		_thumbnailView.setImages(urls);
	}
}