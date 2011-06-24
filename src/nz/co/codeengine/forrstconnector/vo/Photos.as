package nz.co.codeengine.forrstconnector.vo
{
	public class Photos implements IPhotos
	{
		
		private var _largeURL:String;
		private var _mediumURL:String;
		private var _smallURL:String;
		private var _thumbURL:String;
		private var _xlURL:String;
		
		
		public function Photos(p:Object)
		{
			trace("Photos::Photos says: Initializing Photos from PhotoObject");
			try{
				this.largeURL = p.large_url;
				this.mediumURL = p.medium_url;
				this.smallURL = p.small_url;
				this.thumbURL = p.thumb_url;
				this.xlURL = p.xl_url;
			}catch(e:*){
				trace ("Photos::Photos says: " + e);
			}
		}
		
		public function get largeURL():String
		{
			return _largeURL;
		}
		
		public function get mediumURL():String
		{
			return _mediumURL;
		}
		
		public function get smallURL():String
		{
			return _smallURL;
		}
		
		public function get thumbURL():String
		{
			return _thumbURL;
		}
		
		public function get xlURL():String
		{
			return _xlURL;
		}
		
		public function set largeURL(value:String):void
		{
			_largeURL = value;
		}
		
		public function set mediumURL(value:String):void
		{
			_mediumURL = value;
		}
		
		public function set smallURL(value:String):void
		{
			_smallURL = value;
		}
		
		public function set thumbURL(value:String):void
		{
			_thumbURL = value;
		}
		
		public function set xlURL(value:String):void
		{
			_xlURL = value;
		}
	}
}