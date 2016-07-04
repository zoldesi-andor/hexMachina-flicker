package hex.control.request;

import hex.control.payload.ExecutionPayload;

/**
 * ...
 * @author gtakaro
 */
class IntRequest extends Request
{
	public var value : Int; 
	
	public function new( value : Int, ?executionPayloads : Array<ExecutionPayload> ) 
	{
		super(executionPayloads);
		this.value = value;
	}
	
}