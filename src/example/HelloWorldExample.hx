package example;
import hex.ioc.assembler.AbstractApplicationContext;
import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.ioc.parser.xml.XmlReader;
/**
 * ...
 * @author duke
 */
@:expose("FlickrExample")
class HelloWorldExample extends BasicMain
{
	static var self:HelloWorldExample;
	
	var _applicationContext:AbstractApplicationContext;
	var _applicationAssembler:hex.ioc.assembler.ApplicationAssembler;

	static public function main() : Void
	{
		#if debug
		//todo zubi why is in debug? - ANSWER: to let the js instantiate when it is on it's correct place
		self = new HelloWorldExample(); 
		#end
	}
	
	public function new()
	{
		super();
		
		#if js
		var source:String = XmlReader.readXmlFile( "example/configuration/contextJS.xml" );
		#elseif flash
		var source:String = XmlReader.readXmlFile( "example/configuration/contextFlash.xml" );
		#else
		#error
		#end
		
		this._applicationAssembler = new ApplicationAssembler();
		var xml:Xml = Xml.parse( source );
		
		var normalParser : ApplicationXMLParser = new ApplicationXMLParser();
		normalParser.parse( this._applicationAssembler, xml );
		this._applicationContext = this._applicationAssembler.getApplicationContext("flickr");
		
		
		_register(js.Browser.document.getElementById("flickrRootDiv"), "dom");
		
		this._applicationAssembler.buildEverything();

		
		
	}
	
	function _register( element:Dynamic, id:String ):Void
	{
		this._applicationAssembler.getApplicationContext("flickr").getCoreFactory().register( id, element );
	}

}