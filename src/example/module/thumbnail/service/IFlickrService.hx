package example.module.thumbnail.service;
import hex.service.stateless.IAsyncStatelessService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;

/**
 * @author gtakaro
 */
interface IFlickrService extends IHTTPService
{
  function setRequestPageNumber( page:Int) : Void;
}