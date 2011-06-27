package nz.co.codeengine.forrstconnector.vo
{
	import flash.utils.describeType;
	
	import mx.collections.ItemResponder;
	import mx.graphics.shaderClasses.ExclusionShader;

	public class AbstractWorker
	{
		private var _workerId:String;
		private var _response:IResponse;
		
		
		public function set workerId(value:String):void
		{
			this._workerId = value;
		}
		
		public function get workerId():String
		{
			return this._workerId;
		}
		
		
		public function get response():IResponse{
			return this._response;
		}
		
		public function set response(value:IResponse):void{
			this._response = value;
		}
		
		
		public function stringify():String{
			
			var s:String = "?";
			//Get an XML description of this class 
			//and return the variable types as XMLList with e4x 
			var varList:XMLList = flash.utils.describeType(this)..variable;
			
			for(var i:int; i < varList.length(); i++){
				//Show the name and the value 
				trace(varList[i].@name+':'+ this[varList[i].@name]);
				s+=varList[i].@name + '=' +this[varList[i].@name]+ "&"
			}
				
			
			return s;
			
		}
		
		public function transformResponseObject(responseObject:Object):void{
			try{
				this.response = new Response();
				this.response.apiEnvironment = responseObject.env;
				this.response.executionTime = responseObject["in"];
				this.response.isAthenticated = responseObject.authed;
				this.response.isAuthenticatedAs = responseObject.authed_as;
				this.response.payload = this.transformPayloadObject(responseObject.resp);			
				this.response.status = responseObject.stat;
			}catch (e:*){
				trace(e);
			}
			
		}
		
		public function transformPayloadObject(payloadObject:Object):IPayLoad{
			return new Payload(payloadObject);
		}
	}
}