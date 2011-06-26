package nz.co.codeengine.forrstconnector.vo
{
	public class PostsShow extends AbstractWorker implements IWorker
	{
		public var id:String = "";
		public var tinyId:String = "";
		public function PostsShow()
		{
			super();
		}
		
		public function paramify():Object
		{
			var o:Object = new Object();
			o.id = id;
			o.tiny_id = tinyId;
			return o;
		}
	}
}