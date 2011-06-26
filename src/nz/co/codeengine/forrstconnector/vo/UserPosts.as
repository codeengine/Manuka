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
		
		public function paramify():Object
		{
			return null;
		}
	}
}