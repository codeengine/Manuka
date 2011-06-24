package nz.co.codeengine.forrstconnector.vo
{
	public interface IPhotos
	{	
		function get largeURL():String;
		function get mediumURL():String;
		function get smallURL():String;
		function get thumbURL():String;
		function get xlURL():String;
		
		function set largeURL(value:String):void;
		function set mediumURL(value:String):void;
		function set smallURL(value:String):void;
		function set thumbURL(value:String):void;
		function set xlURL(value:String):void;
	}
}