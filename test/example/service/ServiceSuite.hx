package example.service;

/**
 * ...
 * @author gtakaro
 */
class ServiceSuite
{

	@Suite("Flickr sercice suite")
    public var list : Array<Class<Dynamic>> = [GetImageHttpParserTest];
	
}