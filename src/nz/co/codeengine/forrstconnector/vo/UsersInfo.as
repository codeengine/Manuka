package nz.co.codeengine.forrstconnector.vo
{
	public class UsersInfo extends AbstractWorker implements IWorker
	{
		public var id:String;
		public var username:String;
		public function UsersInfo()
		{
			super();
		}
		
		public function init():void{
			trace("UsersInfo::init says: NOT IMPLEMENTED");
		}
		
		public function paramify():Object
		{
			var o:Object = new Object();
			o.id = id;
			o.username = username;
			return o;
		}
	}
}