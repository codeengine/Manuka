package nz.co.codeengine.forrstconnector.vo
{
	public class Stats extends AbstractWorker implements IWorker
	{
		public function Stats()
		{
			super();
		}
		
		
		public function init():void{
			trace("Stats::init says: NOT IMPLEMENTED");
		}
		
		public function paramify():Object
		{
			return new Object();
		}
	}
}