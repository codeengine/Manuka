package nz.co.codeengine.forrstconnector
{
	import nz.co.codeengine.forrstconnector.vo.IWorker;

	public interface IConnector
	{
		function execute(worker:IWorker):void;
	}
}