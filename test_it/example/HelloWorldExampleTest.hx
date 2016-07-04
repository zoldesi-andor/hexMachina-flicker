package example;

import example.module.flickr.IFlickrModule;
import example.module.flickr.model.IFlickrModel;
import example.module.thumbnail.IThumbnailModule;
import hex.di.IDependencyInjector;
import hex.ioc.parser.xml.XmlReader;
import hex.log.DomainLogger;
import hex.service.stateless.http.MockHTTPRequestFactory;
import hex.service.stateless.http.HTTPService;
import hex.unittest.assertion.Assert;
import test_data.MockHttpRequestData;
import haxe.Json;

import example.module.flickr.message.FlickrModuleMessage;

import hex.event.MessageType;
import hex.domain.TopLevelDomain;
import hex.domain.ApplicationDomainDispatcher;
import hex.control.request.StringRequest;
import hex.event.IDispatcher;

/**
 * ...
 * @author azoldesi
 */
class HelloWorldExampleTest extends BasicMain
{
	private var mockRequestFactory: MockHTTPRequestFactory;
	
	private var logger = new DomainLogger(TopLevelDomain.DOMAIN);
	
	
	public function new() 
	{
		super();
	}
	
	@Before
	public function before()
	{
		var source:String = XmlReader.readXmlFile( "example/configuration/contextJS.xml" );

		this.mockRequestFactory = new MockHTTPRequestFactory();
		HTTPService.requestFactory = mockRequestFactory;
		
		this.mockRequestFactory.map("https://api.flickr.com/services/rest/").to(Json.stringify(MockHttpRequestData.data));

		this._build( source );
	}

	@After
	public function after()
	{
		
	}
	
	@Test("Tests Application Start Up")
	public function appStartUpTest()
	{
		Assert.isTrue(this.mockRequestFactory.errors.length == 0, this.mockRequestFactory.errors.join(", "));
	}
	
	@Test("Testing dispatch injection / spying on dispatcher")
	public function imageClicked()
	{
		var factory = this._applicationAssembler.getApplicationContext("flickr").getCoreFactory();		
		var flickrModule: IFlickrModule = cast factory.locate("flickrModule");
		var thumbnailModule: IThumbnailModule = cast factory.locate("thumbnailModule");	
		
		var d1: Dynamic = cast ApplicationDomainDispatcher.getInstance().getDomainDispatcher( flickrModule.getDomain() );
		// d1.addHandler(FlickrModuleMessage.GET_NEW_IMAGE, this, function() { logger.debug("Hello"); });
		
		var original = d1.dispatch;
		d1.dispatch = function( messageType : MessageType, ?data : Array<Dynamic> ) {
			logger.debug("hello");
			Reflect.callMethod(d1, original, [messageType, data]);
		};
		
		this.mockRequestFactory.map("https://api.flickr.com/services/rest/").to(Json.stringify(MockHttpRequestData.data));
		this.mockRequestFactory.map("https://api.flickr.com/services/rest/").to(Json.stringify(MockHttpRequestData.data));
		
		flickrModule.dispatchPublicMessage( FlickrModuleMessage.GET_NEW_IMAGE, [ new StringRequest("https://farm8.staticflickr.com/7239/27858309112_13f0d28bd1_b.jpg")] );
		
		var i1 = flickrModule.getBasicInjector();
		var model: IFlickrModel = cast i1.getInstance(IFlickrModel);
		
		Assert.isNotNull(model.getFullSizeGalleryImage(), "");
	}
	
	@Test("Testing Spying on module")
	public function spyingTest()
	{
		var factory = this._applicationAssembler.getApplicationContext("flickr").getCoreFactory();		
		var flickrModule: IFlickrModule = cast factory.locate("flickrModule");
		var thumbnailModule: IThumbnailModule = cast factory.locate("thumbnailModule");	
		
		var allFields = Type.getInstanceFields(Type.getClass(flickrModule));
		
		this.logger.debug("fields: " + allFields);
	}
}