package example;

import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.log.layout.LogProxyLayout;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class BasicMain
{
	
	
	public function new() 
	{
		this._initLogger();
	}
	
	function _initLogger() : Void
	{
		var proxy : LogProxyLayout = new LogProxyLayout();
		#if js
		var controller = new hex.log.layout.LogLayoutHTMLView( proxy );
		proxy.addListener( new hex.log.layout.SimpleBrowserLayout( controller.consoleWrapperTaget ) );
		proxy.addListener( new hex.log.layout.JavaScriptConsoleLayout() );
		#elseif flash
		//proxy.addListener( new hex.log.layout.TraceLayout() );
		#end
	}
	
	
	
}