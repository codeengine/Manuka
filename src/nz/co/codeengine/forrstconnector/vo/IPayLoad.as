package nz.co.codeengine.forrstconnector.vo
{
	public interface IPayLoad
	{
		function get posts():Vector.<IPost>;
		function set posts(value:Vector.<IPost>):void;
		
		function get callsMade():int;
		function set callsMade(value:int):void;
		
		function get rateLimit():int;
		function set rateLimit(value:int):void;
	}
}