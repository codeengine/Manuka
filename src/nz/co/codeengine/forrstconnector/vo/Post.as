package nz.co.codeengine.forrstconnector.vo
{
	public class Post implements IPost
	{
		private var _id:Number;
		private var _tinyId:String;
		private var _postType:String;
		private var _postURL:String;
		private var _createdAt:String;
		private var _updatedAt:String;
		private var _user:IUser;
		private var _isPublished:Boolean;
		private var _isPublic:Boolean;
		private var _title:String;
		private var _url:String;
		private var _content:String;
		private var _description:String;
		private var _formattedContent:String;
		private var _formattedDescription:String;
		private var _likeCount:int;
		private var _commentCount:int;
		private var _tagString:String;
		private var _tags:Array;
		private var _snaps:Object;
		
		
		
		public function Post(p:Object)
		{
			trace("Post::Post says: Initializing Post from PostObject");
			try{
				this.id = p.id;
				this.tinyId = p.tiny_id;
				this.postType = p.post_type;
				this.postURL = p.post_url;
				this.createdAt = p.created_at;
				this.updatedAt = p.updated_at;
				this.user = new User(p.user);
				this.isPublished = Boolean(p.published);
				this.isPublic = Boolean(p["public"]);
				this.title = p.title;
				this.url = p.url;
				this.content = p.content;
				this.description = p.description;
				this.formattedContent = p.formatted_content;
				this.formattedDescription = p.formatted_description;
				this.likeCount = p.like_count;
				this.commentCount = p.comment_count;
				this.tagString = p.tag_string;
				this.tags = p.tags;
				this.snaps = p.snaps;
			}catch (e:*){
				trace ("Post::Post says: " + e);
			}
		}
		
		public function get postURL():String{
			return _postURL;
		}
		
		public function get description():String{
			return _description;
		}
		
		public function get commentCount():int
		{
			return _commentCount;
		}
		
		public function get content():String
		{
			return _content;
		}
		
		public function get createdAt():String
		{
			return _createdAt;
		}
		
		public function get updatedAt():String
		{
			return _updatedAt;
		}
		
		public function get formattedContent():String
		{
			return _formattedContent;
		}
		
		public function get formattedDescription():String
		{
			return _formattedDescription;
		}
		
		public function get id():Number
		{
			return _id;
		}
		
		public function get likeCount():int
		{
			return _likeCount;
		}
		
		public function get postType():String
		{
			return _postType;
		}
		
		public function get isPublic():Boolean
		{
			return _isPublic;
		}
		
		public function get isPublished():Boolean
		{
			return _isPublished;
		}
		
		public function get snaps():Object
		{
			return _snaps;
		}
		
		public function get tags():Array
		{
			return _tags;
		}
		
		public function get tagString():String
		{
			return _tagString;
		}
		
		public function get tinyId():String
		{
			return _tinyId;
		}
		
		public function get title():String
		{
			return _title;
		}
		
		public function get url():String
		{
			return _url;
		}
		
		public function get user():IUser
		{
			return _user;
		}
		
		public function set postURL(value:String):void{
			_postURL = value;
		}
		
		public function set commentCount(value:int):void
		{
			_commentCount = value;
		}
		
		public function set content(value:String):void
		{
			_content = value;
		}
		
		public function set createdAt(value:String):void
		{
			_createdAt = value;
		}
		public function set updatedAt(value:String):void
		{
			_updatedAt = value;
		}
		
		public function set description(value:String):void
		{
			_description = value;
		}
		
		public function set formattedContent(value:String):void
		{
			_formattedContent = value;
		}
		
		public function set formattedDescription(value:String):void
		{
			_formattedDescription = value;
		}
		
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		public function set likeCount(value:int):void
		{
			_likeCount = value;
		}
		
		public function set postType(value:String):void
		{
			_postType = value;
		}
		
		public function set isPublic(value:Boolean):void
		{
			_isPublic = value;
		}
		
		public function set isPublished(value:Boolean):void
		{
			_isPublished = value;
		}
		
		public function set snaps(value:Object):void
		{
			_snaps = value;
		}
		
		public function set tags(value:Array):void
		{
			_tags = value;
		}
		
		public function set tagString(value:String):void
		{
			_tagString = value;
		}
		
		public function set tinyId(value:String):void
		{
			_tinyId = value;
		}
		
		public function set title(value:String):void
		{
			_title = value;
		}
		
		
		public function set url(value:String):void
		{
			_url = value;
		}
		
		public function set user(value:IUser):void
		{
			_user = value;
		}
	}
}