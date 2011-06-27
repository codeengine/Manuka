package nz.co.codeengine.forrstconnector.vo
{
	public class Payload implements IPayLoad
	{
		private var _posts:Vector.<IPost>;
		private var _callsMade:int;
		private var _rateLimit:int;
	
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
				}else if (value.hasOwnProperty("calls_made")){
					//Stats
					this._callsMade = value.calls_made;
					this._rateLimit = value.rate_limit;
				}
			}catch (e:Error){
				trace ("Payload::Payload says: " + e);
				trace (e.getStackTrace());
			}
		}
		
		public function get callsMade():int
		{
			return _callsMade;
		}
		
		public function set callsMade(value:int):void
		{
			this._callsMade = value;
			
		}
		
		public function get rateLimit():int
		{
			return this._rateLimit;
		}
		
		public function set rateLimit(value:int):void
		{
			this._rateLimit = value;
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