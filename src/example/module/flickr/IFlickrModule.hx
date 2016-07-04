package example.module.flickr;
import hex.module.IModule;

/**
 * @author gtakaro
 */
interface IFlickrModule extends IModule
{
  function setFullSizeGalleryImage( url:String ):Void;
}