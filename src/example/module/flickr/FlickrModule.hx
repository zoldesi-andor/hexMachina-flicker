package example.module.flickr;
import example.module.flickr.view.IFlickrView;
import example.module.flickr.view.FlickrViewHelper;
import example.module.flickr.controller.GetNewImageCommand;
import example.module.flickr.controller.SetImageCommand;
import example.module.flickr.message.FlickrModuleMessage;
import example.module.flickr.model.FlickrModel;
import example.module.flickr.model.IFlickrModel;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.control.request.StringRequest;
import hex.di.IBasicInjector;
import hex.log.ILogger;
import hex.domain.Domain;
import hex.event.MessageType;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;

/**
 * ...
 * @author gtakaro
 */
class FlickrModule extends Module implements IFlickrModule
{

	public function new(view : IFlickrView) 
	{
		super();
		#if debug
		getLogger().debug( "FlickrModule new " );
		#end
		this._addStatelessConfigClasses([CommandConfig, ModelConfig]);
		this.buildViewHelper( FlickrViewHelper, view );
	}
	
	// Don't ask why, it is mandatory!
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		return rd;
	}
	
	
	public function setFullSizeGalleryImage( url:String ):Void
	{
		getLogger().debug( "FlickrModule setFullSizeGalleryImage url:" + url );
		this._dispatchPrivateMessage( FlickrModuleMessage.SET_IMAGE, [new StringRequest(url)] ); 
	}
}

	
private class CommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( FlickrModuleMessage.GET_NEW_IMAGE, GetNewImageCommand );
		this.map( FlickrModuleMessage.SET_IMAGE, SetImageCommand  );
	}
}

private class ModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( IFlickrModel, FlickrModel);
	}
}