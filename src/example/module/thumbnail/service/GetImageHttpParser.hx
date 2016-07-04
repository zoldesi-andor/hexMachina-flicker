package example.module.thumbnail.service;
import hex.data.IParser;



/**
 * ...
 * @author gtakaro
 */
class GetImageHttpParser
{

	public function new() 
	{
		
	}
	
	                
	public function parse( serializedContent : Dynamic ) : Dynamic 
	{
		var jsonString : String = serializedContent;
		var json = haxe.Json.parse( jsonString );

		
		var res = new Array<String>();
		/*
		for (i in 0...5) {
			var indx = Std.random(json.photos.photo.length);
			var photo = (cast (json.photos.photo, Array<Dynamic>))[indx];
			res[i] = "https://farm" + photo.farm + ".staticflickr.com/" + photo.server + "/" + photo.id + "_" + photo.secret + "_b.jpg";
		}
		*/
		var i = 0;
		for(photo in (cast (json.photos.photo, Array<Dynamic>))) {
			res[i] = "https://farm" + photo.farm + ".staticflickr.com/" + photo.server + "/" + photo.id + "_" + photo.secret + "_b.jpg";
			i++;
		}
		return {page: json.photos.page, urls: res};
	}
	
}