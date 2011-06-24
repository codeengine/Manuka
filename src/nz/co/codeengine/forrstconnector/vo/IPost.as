package nz.co.codeengine.forrstconnector.vo
{
	public interface IPost
	{
		
		function get id():Number;
		function get tinyId():String;
		function get postType():String;
		function get postURL():String;
		function get createdAt():String;		
		function get updatedAt():String;
		function get user():IUser;
		function get isPublished():Boolean;
		function get isPublic():Boolean;
		function get title():String;
		function get url():String;
		function get content():String;
		function get description():String;
		function get formattedContent():String;
		function get formattedDescription():String;
		function get likeCount():int;
		function get commentCount():int;
		function get tagString():String;
		function get tags():Array;
		function get snaps():Object;
				
		function set id(value:Number):void;
		function set tinyId(value:String):void;
		function set postType(value:String):void;
		function set postURL(value:String):void;
		function set createdAt(value:String):void;
		function set updatedAt(value:String):void;
		function set user(value:IUser):void;
		function set isPublished(value:Boolean):void;
		function set isPublic(value:Boolean):void;
		function set title(value:String):void;
		function set url(value:String):void;
		function set content(value:String):void;
		function set description(value:String):void;
		function set formattedContent(value:String):void;
		function set formattedDescription(value:String):void;
		function set likeCount(value:int):void;
		function set commentCount(value:int):void;
		function set tagString(value:String):void;
		function set tags(value:Array):void;
		function set snaps(value:Object):void;
	}
}