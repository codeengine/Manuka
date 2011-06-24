package nz.co.codeengine.forrstconnector.vo
{
	public class Response implements IResponse
	{
		
		private var _isAuthenticated:Boolean;
		private var _isAuthenticatedAs:Boolean;
		private var _apiEnvironment:String;
		private var _executionTime:Number;
		private var _status:String;
		private var _payLoad:IPayLoad;
		
		public function get isAthenticated():Boolean
		{
			return _isAuthenticated;
		}
		
		public function get isAuthenticatedAs():Boolean
		{
			return _isAuthenticatedAs;
		}
		
		public function set apiEnvironment(value:String):void
		{
			this._apiEnvironment = value;
			
		}
		
		public function set executionTime(value:Number):void
		{
			this._executionTime = value;
			
		}
		
		public function set isAthenticated(value:Boolean):void
		{
			this._isAuthenticated = true;
			
		}
		
		public function set isAuthenticatedAs(value:Boolean):void
		{
			this._isAuthenticatedAs = value;
			
		}
		
		public function set payload(value:IPayLoad):void
		{
			this._payLoad = value;
			
		}
		
		public function set status(value:String):void
		{
			this._status = value;
			
		}
		
		
		public function get apiEnvironment():String
		{
			return _apiEnvironment;
		}
		
		public function get executionTime():Number
		{
			return _executionTime;
		}
		
		public function get status():String
		{
			return _status;
		}
		
		public function get payload():IPayLoad
		{
			return _payLoad;
		}
	}
}