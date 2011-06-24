package nz.co.codeengine.forrstconnector.vo
{
	public interface IUsersAuth
	{
		function get username():String;
		function get password():String;
		function get securityToken():String;
		
		function set username(value:String):void;
		function set password(value:String):void;
		function set securityToken(value:String):void;
	}
}