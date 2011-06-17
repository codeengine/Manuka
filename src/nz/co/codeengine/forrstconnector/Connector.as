package nz.co.codeengine.forrstconnector
{
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONDecoder;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	

	public class Connector extends EventDispatcher
	{
		private var username:String = "kit.venter@me.com";
		private var password:String = "";
		private var token:String = "";
		private var endpoint:String = "http://forrst.com/api/v2/";
		private var response:String = "";
		public static var COMMUNICATION_PROTOCOL_JSON:String = "text";
		
		private var worker:String = "";
		private var workerFunction:String;
		public function Connector(worker:String)
		{
			this.worker = worker;
			this.workerFunction = worker.replace("/","_");			
		}
		
		public function execute():void{
			//Magic
			try{
				this[workerFunction]();
			}catch(e:ReferenceError){
				var event:ConnectorEvent = new ConnectorEvent(ConnectorEvent.CONNECTOR_FAULT);
				event.response = "Connector::Connector says: no such worker - " + worker;
				dispatchEvent(event);
			}
		}
		
		private function create_service(worker:String):HTTPService{
			
			var service:HTTPService = new HTTPService();
			service.method="POST";
			service.url = endpoint + worker;
			service.resultFormat=Connector.COMMUNICATION_PROTOCOL_JSON;
			service.addEventListener(ResultEvent.RESULT, function(event:ResultEvent):void{
					response = String(event.result);
					var ce:ConnectorEvent = new ConnectorEvent(worker);
					ce.response = response;
					ce.object = mapJSON2Object(response);
					ce.endpoint = event.currentTarget.url;
					dispatchEvent(ce);
			}); 
			service.addEventListener(FaultEvent.FAULT, function(event:FaultEvent):void{
				response = String(event.message.body);
				var ce:ConnectorEvent = new ConnectorEvent(ConnectorEvent.CONNECTOR_FAULT);
				ce.response = response;
				ce.endpoint = event.currentTarget.url;
				dispatchEvent(ce);
			});
			return service;
		}
		
		public function users_info():void{
			var service:HTTPService = create_service(this.worker);
			var params:Object = new Object();
			params.username = "sabeau";
			params.id = "1";
			this.executeService(service, params);
		}
		
		public function users_auth():void{
			var service:HTTPService = create_service(this.worker);
			var params:Object = new Object();
			params.username="";
			params.password="";
			this.executeService(service, params);
		}
		
		public function posts_all():void{
			var service:HTTPService = create_service(this.worker);
			service.method = "GET";
			
			this.executeService(service, null);
			
		}
		
		private function mapJSON2Object(json:String):Object{
			return JSON.decode(json);			
		}
		
		private function executeService(service:HTTPService, params:Object):void{
			service.send(params);
		}
		
	}
}