package example.module.flickr.model;
import hex.model.IModelRO;

/**
 * @author gtakaro
 */
interface IFlickrModelRO extends IModelRO<IFlickrModelListener>
{
  function getFullSizeGalleryImage() : String;
}