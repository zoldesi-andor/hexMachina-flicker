package example.module.thumbnail.model;

import hex.model.ModelDispatcher;

/**
 * ...
 * @author gtakaro
 */
class ThumbnailModelDispatcher extends ModelDispatcher<IThumbnailModelListener> implements IThumbnailModelListener
{
	
	/* INTERFACE example.module.thumbnail.model.IThumbnailModelListener */
	
	public function onImagesChange(urls:Array<String>):Void 
	{
		// macro does it
	}
	
}