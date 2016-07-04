package;
import hex.unittest.notifier.BrowserUnitTestNotifier;
import hex.unittest.runner.ExMachinaUnitCore;
import example.HelloWorldExampleTest;

/**
 * ...
 * @author azoldesi
 */
class TestRunner
{

	public function new() 
	{
		
	}
	
	public static function main()
	{
		var emu = new ExMachinaUnitCore(); // new ExMachinaUnitCore();
		emu.addListener( new BrowserUnitTestNotifier( "console" ) );
		
		emu.addTest( HelloWorldExampleTest );
		
		emu.run();
	}
}