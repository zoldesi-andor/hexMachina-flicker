package example.module.thumbnail;

import example.module.thumbnail.view.IThumbnailView;
import example.module.thumbnail.view.ThumbnailViewHelper;
import example.module.thumbnail.message.ThumbnailModuleMessage;
import example.module.thumbnail.controller.SetFullSizeGalleryImageCommand;
import example.module.thumbnail.controller.GetFullSizeGalleryImageMacro;
import example.module.flickr.model.FlickrModel;
import example.module.flickr.model.IFlickrModel;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.control.payload.ExecutionPayload;
import hex.control.request.StringRequest;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import example.module.thumbnail.model.IThumbnailModel;
import example.module.thumbnail.model.ThumbnailModel;
import example.module.thumbnail.controller.GetImagesFromFlickrCommand;
import example.module.thumbnail.service.IFlickrService;


/**
 * ...
 * @author gtakaro
 */
class ThumbnailModule extends  Module implements IThumbnailModule
{

	public function new(view : IThumbnailView,?serviceConfig : IStatefulConfig) 
	{
		super();
		super();
		#if debug
		getLogger().debug( "ThumbnailModule new " );
		#end
		this._addStatefulConfigs( [ serviceConfig ] );
		this._addStatelessConfigClasses([CommandConfig, ModelConfig]); //
		this.buildViewHelper( ThumbnailViewHelper, view );
	}
	
	// Don't ask why, it is mandatory!
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		return rd;
	}
	
	public function setInitialImages( ) : Void
	{
		this._dispatchPrivateMessage( ThumbnailModuleMessage.GET_IMAGES, [] );
	}

	
	public function getFullSizeGalleryImage(actualUrl:String):Void
	{
		getLogger().debug( "ThumbnailModule: Flickr view requested new Image actual:" + actualUrl );
		this._dispatchPrivateMessage( ThumbnailModuleMessage.GET_FULLSIZE_GALLERY_IMAGE, [new StringRequest(actualUrl)] );
	}
}

private class CommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( ThumbnailModuleMessage.SET_FULLSIZE_GALLERY_IMAGE, SetFullSizeGalleryImageCommand );
		this.map( ThumbnailModuleMessage.GET_IMAGES, GetImagesFromFlickrCommand );
		this.map( ThumbnailModuleMessage.GET_FULLSIZE_GALLERY_IMAGE, GetFullSizeGalleryImageMacro );
		
	}
}

private class ModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( IThumbnailModel, ThumbnailModel);
	}
}