package example;

import hex.unittest.notifier.BrowserUnitTestNotifier;
import hex.unittest.runner.ExMachinaUnitCore;
import hex.unittest.runner.TestRunner;

#if flash
import hex.unittest.notifier.TraceNotifier;
#else
import hex.unittest.notifier.ConsoleNotifier;
#end

/**
 * ...
 * @author gtakaro
 */
class FlickrSuiteMainTest
{

	static public function main() : Void
	{
		var emu = new ExMachinaUnitCore();

		#if flash
		TestRunner.RENDER_DELAY = 0;
		emu.addListener( new TraceNotifier( false ) );
		#else
		emu.addListener( new ConsoleNotifier( false ) );
		emu.addListener( new BrowserUnitTestNotifier( "console" ) );
		#end

		emu.addTest( FlickrSuite );
		emu.run();

	}
	
}