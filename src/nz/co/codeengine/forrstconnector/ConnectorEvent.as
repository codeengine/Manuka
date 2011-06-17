package nz.co.codeengine.forrstconnector
{
	import flash.events.Event;
	
	public class ConnectorEvent extends Event
	{
		public static var CONNECTOR_AUTHENTICATED:String="users/auth";
		public static var CONNECTOR_FAULT:String="connectorFault";
		public static var CONNECTOR_USERS_INFO:String="users/info";
		
		public var response:String;
		public var endpoint:String="endpoint: uninitialized";
		public var worker:String="";
		public var object:Object;
		public function ConnectorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}