package example.module.flickr.model;

/**
 * @author gtakaro
 */
interface IFlickrModel extends IFlickrModelRO
{
  function setFullSizeGalleryImage( src : String ) : Void;
}