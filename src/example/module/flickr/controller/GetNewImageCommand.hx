package example.module.flickr.controller;
import example.module.flickr.model.IFlickrModel;
import example.module.flickr.message.FlickrModuleMessage;
import example.module.thumbnail.model.IThumbnailModel;
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
class GetNewImageCommand extends BasicCommand 
{


	
	public function execute( ?request:StringRequest) : Void 
	{
		this.getLogger().debug("GetNewImageCommand execute... value:" + request.value);
		this._owner.dispatchPublicMessage( FlickrModuleMessage.GET_NEW_IMAGE, [request.value] );
	}
	
	
	
}