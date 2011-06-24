package nz.co.codeengine.forrstconnector.vo
{
	public interface IResponse
	{
		
		function get isAthenticated():Boolean;
		function get isAuthenticatedAs():Boolean;
		function get apiEnvironment():String;
		function get executionTime():Number;
		function get status():String;
		function get payload():IPayLoad;
		
		function set isAthenticated(value:Boolean):void;
		function set isAuthenticatedAs(value:Boolean):void;
		function set apiEnvironment(value:String):void;
		function set executionTime(value:Number):void;
		function set status(value:String):void;
		function set payload(value:IPayLoad):void;
	}
}