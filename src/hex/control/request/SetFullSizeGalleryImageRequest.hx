package hex.control.request;
import hex.control.payload.ExecutionPayload;

/**
 * ...
 * @author gtakaro
 */
class SetFullSizeGalleryImageRequest extends Request
{
	public var value : String; 
	
	public function new( value : String ) 
	{
		super([new ExecutionPayload(this, SetFullSizeGalleryImageRequest)]);
		this.value = value;
	}
}