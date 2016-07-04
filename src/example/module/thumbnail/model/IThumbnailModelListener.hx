package example.module.thumbnail.model;


/**
 * @author gtakaro
 */
interface IThumbnailModelListener 
{
  function onImagesChange( urls : Array<String> ) : Void;
}