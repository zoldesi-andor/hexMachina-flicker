package example.module.thumbnail.service;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.log.Logger;

/**
 * ...
 * @author gtakaro
 */
class FlickrService extends HTTPService implements IFlickrService
{

	
	
	public function new() 
	{
		super();
	}
	
	@PostConstruct
	override public function createConfiguration() : Void
	{
		
		
		this.setConfiguration( new HTTPServiceConfiguration("https://api.flickr.com/services/rest/" ) );
		
		this.setParser( new GetImageHttpParser() );
	}
	
	public function setRequestPageNumber( page:Int) : Void
	{
		this.setParameters(new FlickrServiceParameters(page));
	}
	
}