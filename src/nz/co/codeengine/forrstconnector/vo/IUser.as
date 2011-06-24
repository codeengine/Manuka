package nz.co.codeengine.forrstconnector.vo
{
	public interface IUser
	{
		function get id():String;
		function get username():String;
		function get name():String;
		function get url():String;
		function get postCount():String;
		function get commentCount():String;
		function get likeCount():String;
		function get followerCount():String;
		function get followingCount():String;
		function get photos():IPhotos;
		function get bio():String;
		function get classification():String;
		function get homepageURL():String;
		function get twitter():String;
		function get isInDirectory():Boolean;
		function get tagString():String;
		
		function set id(value:String):void;
		function set username(value:String):void;
		function set name(value:String):void;
		function set url(value:String):void;
		function set postCount(value:String):void;
		function set commentCount(value:String):void;
		function set likeCount(value:String):void;
		function set followerCount(value:String):void;
		function set followingCount(value:String):void;
		function set photos(value:IPhotos):void;
		function set bio(value:String):void;
		function set classification(value:String):void;
		function set homepageURL(value:String):void;
		function set twitter(value:String):void;
		function set isInDirectory(value:Boolean):void;
		function set tagString(value:String):void;
		
		
	}
}