package nz.co.codeengine.forrstconnector.vo
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	
	public /*<<SINGLETON>>*/ class WorkerPool
	{
		private var pool:ArrayCollection = new ArrayCollection();
		private static var _instance:WorkerPool = new WorkerPool();
		
		public function WorkerPool(){
			if (_instance){
				if (_instance){
					throw Error("Please use instance");
				}
			}
		}
		
		public static function get instance():WorkerPool{
			return _instance;
		}
		
		
		/**----------------------------------------------------------
		 * This allows a worker to be added to the pool and used again
		 * at a later time.
		 * 
		 * @param worker The worker that the system needs to store
		 * ---------------------------------------------------------- */
		public function addWorker(worker:IWorker):void{
			this.pool.addItem(worker);
		}
		
		/**----------------------------------------------------------
		 * Return a worker of the specified type.
		 * 
		 * The function has the added responsibility of ensuring and
		 * guaranteeing that returned workers are clean.
		 * 
		 * @param worker The type of worker that the system needs returned
		 * ---------------------------------------------------------- */
		public function getWorker(workerId:String):IWorker{
			//Search through the pool and find a matching worker
			var worker:IWorker;
			for each (worker in pool){
				if (worker.workerId == workerId){
					//Break!
					trace("WorkerPool::getWorker says: worker " + workerId + " already exists in pool and is available for reuse.");
					break;
				}
			}
			if (worker != null){
				worker.init();
			}
			//Remove the worker from the pool as it is no longer available
			var index:int = pool.getItemIndex(worker);
			pool.removeItemAt(index);
			return worker;
		}
		
		/**----------------------------------------------------------
		 * Returns true if a worker of the specified type is available
		 * for reuse.
		 * 
		 * Ideally, this function should be called first before trying
		 * to call getWorker, as getWorker has the potential to return a
		 * null.
		 * 
		 * @param worker The type of worker that the system needs returned
		 * ---------------------------------------------------------- */
		public function isWorkerAvailable(workerId:String):Boolean{
			//Search through the pool and find a matching worker
			var isWorkerAvailable:Boolean = false;
			var worker:IWorker;
			for each (worker in pool){
				if (worker.workerId == workerId){
					isWorkerAvailable = true;
					trace("WorkerPool::getWorker says: worker " + workerId + " already exists in pool and is available for reuse.");
					break;
				}
			}
			return isWorkerAvailable;
		}
	}
}