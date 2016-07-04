package hex.service.stateless.http;

import hex.service.stateless.http.HTTPRequestMethod;

/**
 * ...
 * @author azoldesi
 */
class MockHttpRequestMapping
{
	private var url: String;
	private var method: HTTPRequestMethod;
	private var headers = new Map<String, String>();
	private var parameters = new Map<String, String>();
	
	public var data: String;

	public function new(?url: String, method = HTTPRequestMethod.GET) 
	{
		this.url = url;
		this.method = method;
	}
	
	public function withHeader(key: String, value: String): MockHttpRequestMapping
	{
		this.headers.set(key, value);
		
		return this;
	}
	
	public function withParam(key: String, value: String): MockHttpRequestMapping
	{
		this.parameters.set(key, value);
		
		return this;
	}
	
	public function to(data: String): Void
	{
		this.data = data;
	}
	
	public function match(request: MockHTTPRequest): Bool
	{
		if (request.url != this.url)
		{
			return false;
		}
		
		return matchMap(this.headers, request.headers) && matchMap(this.parameters, request.parameters);
	}
	
	private static function matchMap(m1: Map<String, String>, m2: Map<String, String>): Bool
	{
		for (key in m1.keys())
		{
			if (!m2.exists(key))
			{
				return false;
			}
			
			if (m1[key] != m2[key])
			{
				return false;
			}
		}
		
		return true;
	}
}