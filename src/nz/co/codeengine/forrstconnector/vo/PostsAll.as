package nz.co.codeengine.forrstconnector.vo
{
	public class PostsAll extends AbstractWorker implements IWorker, IPostsAll
	{
		public var after:int;
		
		public function paramify():Object{
			var params:Object = new Object();
			params.after = this.after;
			return params;
		}
	}
}