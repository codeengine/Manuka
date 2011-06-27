## Manuka Forrst
Manuka is a forrst library written to allow applications easy access to forrsts exposed services.

The driver behind manuka is to create a forrst library that is simple to use and returns fully typed, interfaced objects in a smart, consistent and uniform way.

Manuka seeks to employ good coding practices, object oriented design and software design patterns to ensure that the application remains simple to maintain and easy to extend, securing its future as the apis exposed by forrst continue to change.


Example usage:

	var worker:IWorker = WorkerFactory.instance.createWorker(Constants.API_GET_STATS);
	var connector:Connector = new Connector();
	connector.addEventListener(ConnectorEvent.ON_STATS, function(event:ConnectorEvent):void{
		event.worker.transformResponseObject(event.object);
		trace("Calls Made: " + event.worker.response.payload.callsMade + "\n" + "Rate Limit: " + event.worker.response.payload.rateLimit);
	});
	connector.addEventListener(ConnectorEvent.ON_CONNECTOR_FAULT, function(event:ConnectorEvent):void{
		trace(event.response);
	});
	connector.execute(worker);
