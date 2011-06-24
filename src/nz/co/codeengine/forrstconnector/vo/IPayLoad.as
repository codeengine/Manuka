package nz.co.codeengine.forrstconnector.vo
{
	public interface IPayLoad
	{
		function get posts():Vector.<IPost>;
		function set posts(value:Vector.<IPost>):void;
	}
}