package example.module.flickr.model;

import hex.model.ModelDispatcher;

/**
 * ...
 * @author gtakaro
 */
class FlickrModelDispatcher extends ModelDispatcher<IFlickrModelListener> implements IFlickrModelListener
{
	
	/* INTERFACE example.module.flickr.model.IFlickrModelListener */
	
	public function onFullSizeGalleryImageChange(src:String):Void 
	{
		// the method content it's filled by Macro
	}
	
}