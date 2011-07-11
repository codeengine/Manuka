package nz.co.codeengine.forrstconnector.vo
{
	import flash.geom.Vector3D;
	import flash.utils.getDefinitionByName;

	public class WorkerFactory
	{
		private static var _instance:WorkerFactory = null;
		private var pool:WorkerPool = WorkerPool.instance;
		
		public static function get instance():WorkerFactory{
			if (_instance == null){
				_instance = new WorkerFactory();
			}
			return _instance;
		}
		
		
		/**----------------------------------------------------------
		 * Whenever the system requires a new worker, the factory
		 * is used to create the new worker, based on the worker id
		 * that is passed to the factory.
		 * 
		 * The factory will first check to see if the worker object is available
		 * in the pool before it constructs a new worker object.
		 * 
		 * @param workerId The id represents the type of worker required to be created
		 * ---------------------------------------------------------- */
		public function createWorker(workerId:String):IWorker{
			var worker:IWorker;
			if (pool.isWorkerAvailable(workerId)){
				worker = pool.getWorker(workerId);
			}else{
				switch (workerId){
					case "stats":
						worker = new Stats();
						break;
					case "posts/all":
						worker = new PostsAll();
						break;
					case "posts/list":
						worker = new PostsList();
						break;
					case "posts/show":
						worker = new PostsShow();
						break;
					case "post/comments":
						worker = new PostComments();
						break;
					case "users/auth":
						worker = new UsersAuth();
						break;
					case "user/info":
						worker = new UsersInfo();
						break;
					case "user/posts":
						worker = new UserPosts();
						break;
				}
			}
			worker.workerId = workerId;
			worker.factory = this;
			return worker;
		}
		
		/**----------------------------------------------------------
		 * When the system is done with a worker, the worker should
		 * be destroyed the same way it was created - via the worker
		 * factory. This ensures that all workers are tracked, and
		 * the factory is able to pool workers and reduced the object
		 * count and avoid excessive garbage collection.
		 * 
		 * @param worker The worker that is no longer required by the system
		 * ---------------------------------------------------------- */
		public function destroyWorker(worker:IWorker):void{
			/* We will add the worker to our pool.
			 * When we destroy the worker, it is not our responisibility
			 * to reset the state.
			 */
			pool.addWorker(worker);
			trace("WorkerFactory::destroyWorker says: pooling worker " + worker.workerId);
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