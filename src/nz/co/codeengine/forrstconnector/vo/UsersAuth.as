package nz.co.codeengine.forrstconnector.vo
{
	public class UsersAuth extends AbstractWorker implements IWorker, IUsersAuth
	{
		private var _username:String;
		private var _password:String;
		private var _securityToken:String;
		
		
		public function init():void{
			trace("UsersAuth::init says: resetting state");
			_username = "";
			_password = "";
			_securityToken = "";
		}
		
		public function get username():String{
			return this._username;
		}
		public function get password():String{
			return this._password;
		}
		public function get securityToken():String{
			return this._securityToken;
		}
		
		public function set username(value:String):void{
			this._username = value;	
		}
		public function set password(value:String):void{
			this._password = value;	
		}
		public function set securityToken(value:String):void{
			this._securityToken = value;	
		}
		
		public function paramify():Object{
			var params:Object = new Object();
			params.email_or_username = this.username;
			params.password = this.password;
			return params;
		}
		
		
	}
}