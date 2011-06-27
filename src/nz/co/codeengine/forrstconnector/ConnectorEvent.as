package nz.co.codeengine.forrstconnector
{
	import flash.events.Event;
	
	import nz.co.codeengine.forrstconnector.vo.IWorker;
	
	public class ConnectorEvent extends Event
	{
		public static var ON_CONNECTOR_FAULT:String="connectorFault";
		public static var ON_POST_COMMENTS:String="post/info";
		public static var ON_POSTS_LIST:String="posts/list";
		public static var ON_POSTS_ALL:String="posts/all";
		public static var ON_POSTS_SHOW:String="posts/show";
		public static var ON_USERS_INFO:String="users/info";
		public static var ON_USER_POSTS:String="user/posts";
		public static var ON_USERS_AUTH:String="users/auth";
		public static var ON_STATS:String="stats";
		
		public var response:String;
		public var endpoint:String="endpoint: uninitialized";
		public var worker:IWorker;
		public var object:Object;
		public function ConnectorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}