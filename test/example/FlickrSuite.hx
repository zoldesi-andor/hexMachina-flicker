package example;

import example.service.ServiceSuite;
/**
 * ...
 * @author gtakaro
 */
class FlickrSuite
{

	@Suite("Flickr suite")
    public var list : Array<Class<Dynamic>> = [ServiceSuite];
	
}