package example.service;
import example.module.thumbnail.service.GetImageHttpParser;
import hex.unittest.assertion.Assert;
import hex.error.Exception;

/**
 * ...
 * @author gtakaro
 */
class GetImageHttpParserTest
{
	
	var parser : GetImageHttpParser;
	
	@Before
    public function init() : Void
    {
        parser = new GetImageHttpParser();
    }

	@Test( "Test parse page number" )
    public function testParsePageNumber() : Void
    {
        var result = parser.parse(getSampleJson());
		Assert.equals(2, result.page, "page property should be 2" );
    }

	@Test( "Test parse photos size" )
    public function testParsePhotosSize() : Void
    {
        var result = parser.parse(getSampleJson());
		Assert.equals(3, result.urls.length, "urls length should be 3" );
    }

	
	function getSampleJson() : String
	{
		var json = "{ \"photos\": { \"page\": 2, \"pages\": \"140626\", \"perpage\": 3, \"total\": \"421878\", " +
			"\"photo\": [ " +
			"{ \"id\": \"27974000042\", \"owner\": \"31357475@N08\", \"secret\": \"f3206225d4\", \"server\": \"7308\", \"farm\": 8, \"title\": \"VQ-BID UTair Aviation  Boeing 737-45S\", \"ispublic\": 1, \"isfriend\": 0, \"isfamily\": 0 }, " +
			"{ \"id\": \"27974244212\", \"owner\": \"9964400@N07\", \"secret\": \"0a218ba364\", \"server\": \"7346\", \"farm\": 8, \"title\": \"First home on the last day.\", \"ispublic\": 1, \"isfriend\": 0, \"isfamily\": 0 }, " +
			"{ \"id\": \"27462413163\", \"owner\": \"9964400@N07\", \"secret\": \"61a5f62692\", \"server\": \"7478\", \"farm\": 8, \"title\": \"Back second today!\", \"ispublic\": 1, \"isfriend\": 0, \"isfamily\": 0 } " +
			"] }, \"stat\": \"ok\" }"; 
		return json;
	}
	
}