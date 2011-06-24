package nz.co.codeengine.forrstconnector.vo
{
	public class Payload implements IPayLoad
	{
		private var _posts:Vector.<IPost>;
		public function Payload(value:Object)
		{
			try{
				//Check to see what our payload has delivered
				if (value.hasOwnProperty("posts")){
					this.posts = new Vector.<IPost>();
					for each (var p:Object in value.posts){
						var post:IPost = new Post(p);
						this.posts.push(post);
					}
				}		
			}catch (e:Error){
				trace ("Payload::Payload says: " + e);
				trace (e.getStackTrace());
			}
		}
		
		public function get posts():Vector.<IPost>
		{
			return _posts;
		}
		
		public function set posts(value:Vector.<IPost>):void
		{
			_posts = value;
		}
	}
}