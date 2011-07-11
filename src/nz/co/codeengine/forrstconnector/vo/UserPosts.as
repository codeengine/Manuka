package nz.co.codeengine.forrstconnector.vo
{
	public class UserPosts extends AbstractWorker implements IWorker
	{
		public var id:String;
		public var username:String;
		public var type:String; //code, snap, link, question
		public var limit:int = 10; 
		public var after:int;
		public function UserPosts()
		{
			super();
		}
		
		
		public function init():void{
			trace("UserPosts::init says: NOT IMPLEMENTED");
		}
		
		public function paramify():Object
		{
			var o:Object = new Object();
			o.id = id;
			o.username = username;
			o.type = type;
			o.limit = limit;
			o.after = after;
			return o;
		}
	}
}