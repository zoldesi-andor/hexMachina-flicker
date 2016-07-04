package hex.service.stateless.http;

import hex.error.Exception;
import hex.service.stateless.http.IHTTPRequestFactory;
import hex.service.stateless.http.*;
import hex.unittest.assertion.Assert;

/**
 * ...
 * @author azoldesi
 */
class MockHTTPRequestFactory implements IHTTPRequestFactory
{
	private var mappings = new Array<MockHttpRequestMapping>();

	public var errors = new Array<String>();
	
	public function new() 
	{
		
	}
	
	
	/* INTERFACE hex.service.stateless.http.IHTTPRequestFactory */
	
	public function createRequest(url:String, ?onData:String-> Void, ?onError:String-> Void, ?onStatus:Int-> Void) 
	{
		return new MockHTTPRequest(this, url, onData, onError, onStatus);
	}
	
	public function map(url: String, method = HTTPRequestMethod.GET): MockHttpRequestMapping
	{
		var mapping = new MockHttpRequestMapping(url, method);
		
		this.mappings.push(mapping);
		
		return mapping;
	}
	
	public function match(request: MockHTTPRequest): String
	{
		var match: MockHttpRequestMapping= null;
		
		for (mapping in this.mappings)
		{
			if (mapping.match(request))
			{
				match = mapping;
				break;
			}
		}
		
		if (match != null)
		{
			this.mappings.remove(match);
			return match.data;
		}
		
		this.errors.push("Unmapped request! " + request);
		
		return null;
	}
}