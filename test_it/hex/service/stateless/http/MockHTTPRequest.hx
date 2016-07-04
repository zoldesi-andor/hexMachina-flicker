package hex.service.stateless.http;

import hex.service.stateless.http.IHTTPRequest;
import hex.service.stateless.http.HTTPRequestMethod;
import hex.service.stateless.http.MockHTTPRequestFactory;

/**
 * ...
 * @author azoldesi
 */
class MockHTTPRequest implements IHTTPRequest
{
	public var url: String;
	public var headers = new Map<String, String>();
	public var parameters = new Map<String, String>();
	
	public var factory: MockHTTPRequestFactory;
	
	public var onData: String -> Void;
	
	public function new(mockFactory: MockHTTPRequestFactory, url:String, ?onData:String-> Void, ?onError:String-> Void, ?onStatus:Int-> Void)  
	{
		this.factory = mockFactory;
		this.url = url;
		this.onData = onData;
	}
	
	
	/* INTERFACE hex.service.stateless.http.IHTTPRequest */
	
	public function request(method:HTTPRequestMethod):Void 
	{
		var data = this.factory.match(this);
		
		if (this.onData != null) 
		{
			this.onData(data);
		}
	}
	
	public function cancel():Void 
	{
		
	}
	
	public function addHeader(key:String, value:String):IHTTPRequest 
	{
		this.headers.set(key, value);
		
		return this;
	}
	
	public function addParameter(param:String, value:String):IHTTPRequest 
	{
		this.parameters.set(param, value);
		
		return this;
	}
}