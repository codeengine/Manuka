package nz.co.codeengine.forrstconnector
{
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONDecoder;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.Capabilities;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import nz.co.codeengine.forrstconnector.vo.IWorker;
	
	public class /*<<SINGLETON>>*/ Connector extends EventDispatcher implements IConnector, IEventDispatcher
	{
		//MANUKA STATIC CONSTANTS
		private static const APP_NAME:String = "ManukaForrst";
		private static const APP_VERSION:String = "0.8";
		public static const RESULT_FORMAT:String = "text";
		private static var _instance:Connector = new Connector();
		public static const INITIALIZE_ERROR:String = "Connector is a Singleton Class and its instance is only accessable via Connector.instance";
		public static var USER_AGENT:String = "";
		
		//FORRST CONSTANTS
		private const apiTransportProtocol:String = "http";
		private const apiVersion:String = "v2";
		private const apiProviderPath:String = "forrst.com/api";
		
		
		//MANUKA VARS
		private var response:String = "";
		private var worker:IWorker;
		private var workerFunction:String;
		
		public function Connector(){
			if (_instance){
				throw Error(INITIALIZE_ERROR);
			}else{
				init();
			}
		}
		
		private function init():void{
			var systemType:String = "";
			if (Capabilities.supports32BitProcesses){
				systemType = "32-bit";
			}
			if (Capabilities.supports64BitProcesses) {
				systemType = "64-bit";
			}
			
			var playerType:String = Capabilities.playerType;
			var playerVersion:String = Capabilities.version;
			USER_AGENT += APP_NAME + " " + APP_VERSION + " " + systemType + " " + playerType + " " + playerVersion;
			trace(USER_AGENT);
		}
		
		public static function get instance():Connector{
			return _instance;
		}
		
		private function get endpoint():String{
			return apiTransportProtocol + "://" + apiProviderPath + "/" + apiVersion + "/";
		}
		
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
			service.headers["User-Agent"] = USER_AGENT;
			service.method="POST";
			service.url = endpoint + worker.workerId;
			service.resultFormat=Connector.RESULT_FORMAT;
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
				ce.worker = worker;
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