package nz.co.codeengine.forrstconnector.vo
{
	import mx.graphics.shaderClasses.ExclusionShader;

	public class PostsList extends AbstractWorker implements IWorker
	{
		public var postType:String = "";
		public var sort:String = "recent";
		public var page:String = "1";
		public function PostsList()
		{
			super();
		}
		
		public function init():void{
			trace("PostsList::init says: NOT IMPLEMENTED");
		}
		
		public function paramify():Object
		{
			var object:Object = new Object();
			object.post_type = postType;
			object.sort = sort;
			object.page = page;
			return object;
		}
	}
}