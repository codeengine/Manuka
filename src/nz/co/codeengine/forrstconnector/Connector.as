package nz.co.codeengine.forrstconnector
{
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONDecoder;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import nz.co.codeengine.forrstconnector.vo.IWorker;
	

	public class Connector extends EventDispatcher implements IConnector, IEventDispatcher
	{
		private var username:String = "kit.venter@me.com";
		private var password:String = "";
		private var token:String = "";
		private var endpoint:String = "http://forrst.com/api/v2/";
		private var response:String = "";
		private var securityToken:String = "";
		public static var COMMUNICATION_PROTOCOL_JSON:String = "text";
		
		private var worker:IWorker;
		private var workerFunction:String;
		
		public function execute(worker:IWorker):void{
			try{
				this.worker = worker;
				var service:HTTPService = this.create_service(worker);
				this.executeService(service, worker.paramify());
			}catch(e:ReferenceError){
				var event:ConnectorEvent = new ConnectorEvent(ConnectorEvent.ON_CONNECTOR_FAULT);
				event.response = "Connector::Connector says: no such worker - " + worker;
				dispatchEvent(event);
			}
		}
		
		private function create_service(worker:IWorker):HTTPService{
			
			var service:HTTPService = new HTTPService();
			service.method="POST";
			service.url = endpoint + worker.workerId;
			service.resultFormat=Connector.COMMUNICATION_PROTOCOL_JSON;
			service.addEventListener(ResultEvent.RESULT, function(event:ResultEvent):void{
					response = String(event.result);
					var ce:ConnectorEvent = new ConnectorEvent(worker.workerId);
					ce.response = response;
					ce.object = mapJSON2Object(response);
					ce.endpoint = event.currentTarget.url;
					ce.worker = worker;
					dispatchEvent(ce);
			}); 
			service.addEventListener(FaultEvent.FAULT, function(event:FaultEvent):void{
				response = String(event.message.body);
				var ce:ConnectorEvent = new ConnectorEvent(ConnectorEvent.ON_CONNECTOR_FAULT);
				ce.response = response;
				ce.endpoint = event.currentTarget.url;
				dispatchEvent(ce);
			});
			return service;
		}
		
		
		private function mapJSON2Object(json:String):Object{
			return JSON.decode(json);			
		}
		
		private function executeService(service:HTTPService, params:Object):void{
			service.send(params);
		}
		
	}
}