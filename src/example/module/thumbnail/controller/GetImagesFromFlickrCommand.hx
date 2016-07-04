package example.module.thumbnail.controller;
import example.module.flickr.model.IFlickrModel;
import example.module.thumbnail.model.IThumbnailModel;
import example.module.thumbnail.service.IFlickrService;
import hex.control.async.AsyncCommand;
import hex.control.command.BasicCommand;
import hex.control.request.IntRequest;
import hex.control.request.StringRequest;
import hex.di.IInjectorContainer;
import hex.service.stateless.IAsyncStatelessService;
import hex.service.stateless.IAsyncStatelessServiceListener;
import hex.service.stateless.http.IHTTPService;


import hex.service.stateless.http.HTTPServiceConfiguration;


/**
 * ...
 * @author gtakaro
 */
class GetImagesFromFlickrCommand extends AsyncCommand implements IAsyncStatelessServiceListener implements IInjectorContainer
{

	@Inject
	public var thumbnailModel:IThumbnailModel;
	
	@Inject
    public var flickrService : IFlickrService;
	
	public function execute(  ) : Void 
	{
		this.getLogger().debug("GetImagesFromFlickrCommand execute.. ");
		flickrService.addListener(this);
		flickrService.setRequestPageNumber(thumbnailModel.getFlickrPageNumber() + 1);
		flickrService.call();
	}
	
	
	public function onServiceComplete( service : IAsyncStatelessService ) : Void 
	{
		thumbnailModel.setImages(service.getResult().urls);
		thumbnailModel.setFlickrPageNumber(service.getResult().page);
		this._handleComplete();
	}
	
	public function onServiceFail( service : IAsyncStatelessService ) : Void
	{
		this.getLogger().debug("GetImagesFromFlickrCommand onServiceFail... ");
		this._handleFail();
	}
	
	public function onServiceCancel( service : IAsyncStatelessService ) : Void
	{
		this.getLogger().debug("GetImagesFromFlickrCommand onServiceCancel... ");
		this._handleCancel();
	}
	
	public function onServiceTimeout( service : IAsyncStatelessService ) : Void 
	{
		this.getLogger().debug("GetImagesFromFlickrCommand onServiceTimeout... ");
		this._handleFail();
	}
}