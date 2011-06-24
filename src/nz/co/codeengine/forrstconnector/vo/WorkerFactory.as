package nz.co.codeengine.forrstconnector.vo
{
	import flash.utils.getDefinitionByName;

	public class WorkerFactory
	{
		private static var _instance:WorkerFactory = null;
		public static var packageName:String = "nz.co.codeengine.forrstconnector.vo";
		public static function get instance():WorkerFactory{
			if (_instance == null){
				_instance = new WorkerFactory();
			}
			return _instance;
		}
		
		public function createWorker(workerId:String):IWorker{
			var worker:IWorker;
			switch (workerId){
				case "posts/all":
					worker = new PostsAll();
					worker.workerId = workerId;
					break;
			}
			return worker;
		}
		
		private function figureOutClassName(worker:String):String{
			var parts:Array = worker.split("/");
			var className:String = "";
			for each (var word:String in parts){
				var capitalizedWord:String = word.substr(0, 1).toUpperCase() + word.substring(1, word.length);
				className += capitalizedWord;
			}
			return className;
		}
	}
}