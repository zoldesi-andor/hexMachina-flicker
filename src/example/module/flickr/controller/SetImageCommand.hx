package example.module.flickr.controller;
import example.module.flickr.model.IFlickrModel;
import example.module.thumbnail.service.IFlickrService;
import hex.control.command.BasicCommand;
import hex.control.request.StringRequest;
import hex.di.IInjectorContainer;
import hex.service.stateless.IAsyncStatelessService;
import hex.service.stateless.http.IHTTPService;

import hex.service.stateless.http.HTTPServiceConfiguration;


/**
 * ...
 * @author gtakaro
 */
class SetImageCommand extends BasicCommand implements IInjectorContainer
{

	@Inject
	public var flickrModel:IFlickrModel;
	
	public function execute( ?request:StringRequest ) : Void 
	{
		this.getLogger().debug("SetImageCommand execute... url:" + request.value);
		flickrModel.setFullSizeGalleryImage(request.value);
	}
	
}