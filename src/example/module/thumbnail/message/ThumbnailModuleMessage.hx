package example.module.thumbnail.message;
import hex.event.MessageType;

/**
 * ...
 * @author gtakaro
 */
class ThumbnailModuleMessage
{

	static public var SET_FULLSIZE_GALLERY_IMAGE = new MessageType( "setFullSizeGalleryImage" );
	static public var GET_FULLSIZE_GALLERY_IMAGE = new MessageType( "getFullSizeGalleryImage" );
	static public var GET_IMAGES = new MessageType( "getImagesFromFlickr" );

}