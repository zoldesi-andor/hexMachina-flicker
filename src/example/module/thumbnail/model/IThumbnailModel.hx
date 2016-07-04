package example.module.thumbnail.model;

/**
 * @author gtakaro
 */
interface IThumbnailModel extends IThumbnailModelRO
{
  function setImages( urls : Array<String> ) : Void;
  
  function setFlickrPageNumber( page : Int ) : Void;
  
  function getFlickrPageNumber( ) : Int;
}