package example.module.thumbnail.controller;
import example.module.thumbnail.model.IThumbnailModel;
import hex.control.macro.Macro;
import hex.control.payload.ExecutionPayload;
import hex.control.request.SetFullSizeGalleryImageRequest;
import hex.control.request.StringRequest;

/**
 * ...
 * @author gtakaro
 */
class GetFullSizeGalleryImageMacro extends Macro
{

	@Inject
	public var thumbnailModel:IThumbnailModel;
	
	@Inject
	public var request : StringRequest;
	
	override public function _prepare() : Void
	{
		var index = thumbnailModel.getImages().indexOf(request.value);
		if (index == -1) {
			// nem találtuk, ilyen nem lehetne elvileg -> lekérjük a kövezkező képeket flickr-től
			add(GetImagesFromFlickrCommand);
		} else if (index == (thumbnailModel.getImages().length - 1)) {
			// ez az utolsó kép -> lekérjük a kövezkező képeket flickr-től
			add(GetImagesFromFlickrCommand);
		} else {
			
			// a következőt adjuk
			var  url = thumbnailModel.getImages()[index + 1];
			add(SetFullSizeGalleryImageCommand).withPayloads(new SetFullSizeGalleryImageRequest(url).getExecutionPayloads());
		}
		
	}
	
}