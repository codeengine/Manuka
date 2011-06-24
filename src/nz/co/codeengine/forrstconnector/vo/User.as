package nz.co.codeengine.forrstconnector.vo
{
	public class User implements IUser
	{
		private var _id:String;
		private var _username:String;
		private var _name:String;
		private var _url:String;
		private var _postCount:String;
		private var _commentCount:String;
		private var _likeCount:String;
		private var _followerCount:String;
		private var _followingCount:String;
		private var _photos:IPhotos;
		private var _bio:String;
		private var _classification:String;
		private var _homepageURL:String;
		private var _twitter:String;
		private var _isInDirectory:Boolean;
		private var _tagString:String;
		
		
		
		public function User(u:Object)
		{
			trace("User::User says: Initializing User from UserObject");
			try{
				this.id = u.id;
				this.username = u.username;
				this.name = u.name;
				this.url = u.url;
				this.postCount = u.posts;
				this.commentCount = u.comments;
				this.likeCount = u.likes;
				this.followerCount = u.followers;
				this.followingCount = u.following;
				this.photos = new Photos(u.photos);
				this.bio = u.bio;
				this.classification = u.is_a;
				this.homepageURL = u.homepage_url;
				this.twitter = u.twitter;
				this.isInDirectory = u.in_directory;
				this.tagString = u.tag_string;
			}catch(e:*){
				trace ("User::User says: " + e);
			}
		}
		
		public function get id():String
		{
			return _id;
		}
		
		public function get username():String
		{
			return _username;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get url():String
		{
			return _url;
		}
		
		public function get postCount():String
		{
			return _postCount;
		}
		
		public function get commentCount():String
		{
			return _commentCount;
		}
		
		public function get likeCount():String
		{
			return _likeCount;
		}
		
		public function get followerCount():String
		{
			return _followerCount;
		}
		
		public function get followingCount():String
		{
			return _followingCount;
		}
		
		public function get photos():IPhotos
		{
			return _photos;
		}
		
		public function get bio():String
		{
			return _bio;
		}
		
		public function get classification():String
		{
			return _classification;
		}
		
		public function get homepageURL():String
		{
			return _homepageURL;
		}
		
		public function get twitter():String
		{
			return _twitter;
		}
		
		public function get isInDirectory():Boolean
		{
			return _isInDirectory;
		}
		
		public function get tagString():String
		{
			return _tagString;
		}
		
		public function set id(value:String):void
		{
			_id = value;
		}
		
		public function set username(value:String):void
		{
			_username = value;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function set url(value:String):void
		{
			_url = value;
		}
		
		public function set postCount(value:String):void
		{
			_postCount = value;
		}
		
		public function set commentCount(value:String):void
		{
			_commentCount = value;
		}
		
		public function set likeCount(value:String):void
		{
			_likeCount = value;
		}
		
		public function set followerCount(value:String):void
		{
			_followerCount = value;
		}
		
		public function set followingCount(value:String):void
		{
			_followingCount = value;
		}
		
		public function set photos(value:IPhotos):void
		{
			_photos = value;
		}
		
		public function set bio(value:String):void
		{
			_bio = value;
		}
		
		public function set classification(value:String):void
		{
			_classification = value;
		}
		
		public function set homepageURL(value:String):void
		{
			_homepageURL = value;
		}
		
		public function set twitter(value:String):void
		{
			_twitter = value;
		}
		
		public function set isInDirectory(value:Boolean):void
		{
			_isInDirectory = value;
		}
		
		public function set tagString(value:String):void
		{
			_tagString = value;
		}
	}
}