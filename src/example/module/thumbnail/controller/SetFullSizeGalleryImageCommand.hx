package example.module.thumbnail.controller;
import example.module.flickr.model.IFlickrModel;
import hex.control.command.BasicCommand;
import hex.control.request.SetFullSizeGalleryImageRequest;
import hex.di.IInjectorContainer;
import example.module.thumbnail.message.ThumbnailModuleMessage;

/**
 * ...
 * @author gtakaro
 */
class SetFullSizeGalleryImageCommand extends BasicCommand implements IInjectorContainer
{

	@Inject
	public var request : SetFullSizeGalleryImageRequest;
	
	public function execute( ) : Void 
	{
		this.getLogger().debug("SetFullSizeGalleryImageCommand execute request: " + request.value);
		this._owner.dispatchPublicMessage( ThumbnailModuleMessage.SET_FULLSIZE_GALLERY_IMAGE, [request.value] );
	}
	
}