package example.module.thumbnail.service;
import hex.service.stateless.http.HTTPServiceParameters;

/**
 * ...
 * @author gtakaro
 */
class FlickrServiceParameters extends HTTPServiceParameters
{

	public var method : String;
	public var api_key : String;
	public var tags : String;
	public var per_page : Int;
	public var page : Int;
	public var format : String;
	public var nojsoncallback : Int;
	
	//we can create queries at: https://www.flickr.com/services/api/explore/flickr.photos.search
	
	public function new( page : Int ) 
	{
		super();
		this.method = "flickr.photos.search";
		this.api_key = "52fe8fba4ebab60f11b0db7e42b1c66b";
		this.tags = "aircraft";
		this.per_page = 5;
		this.page = page;
		this.format = "json";
		this.nojsoncallback = 1;
	}
	
}