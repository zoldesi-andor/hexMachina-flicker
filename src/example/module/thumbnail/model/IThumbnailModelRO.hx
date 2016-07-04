package example.module.thumbnail.model;
import hex.model.IModelRO;

/**
 * @author gtakaro
 */
interface IThumbnailModelRO extends IModelRO<IThumbnailModelListener>
{
  function getImages() : Array<String>;
}