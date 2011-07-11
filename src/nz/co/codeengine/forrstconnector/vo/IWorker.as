
package nz.co.codeengine.forrstconnector.vo
{
	public interface IWorker
	{
		function init():void;
		
		function get factory():WorkerFactory;
		function set factory(value:WorkerFactory):void;
		
		function destroy():void;
		
		function get workerId():String;
		function set workerId(value:String):void;
		
		function get response():IResponse;
		function set response(value:IResponse):void;
		
		function stringify():String;
		function paramify():Object;
		
		function transformResponseObject(responseObject:Object):void;
	}
}