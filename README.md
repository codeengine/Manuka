## Manuka Forrst

Manuka is a forrst library written to allow applications easy access to forrsts exposed services.

Manuka is currently a work in progress, and while most of the library is up and running, expect at least a couple of glitches while it's solidified.

The driver behind manuka is to create a forrst library that is simple to use and returns fully typed, interfaced objects in a smart, consistent and uniform way.

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


## Dependencies

Forrst API uses JSON as the communication protocol, and as such Manuka requires the use of as3corelib.swc library in order to provide the required JSON decoding facilities.

## Posts

Posts, when available, are loaded onto the ConnectorEvent's worker object, and may accessed via worker.response.payload.posts.
A Post object implements the IPost Interface.

An example of working with a post:

	for each (var post:IPost in v){
		trace(post.title);							
	}

## Authentication

Although authentication is not currently enabled by the forrst api, below is further information of how this would theoretically be done using manuka.

Some requests require parameters to be set, and in this case you simply set the properties on the worker before you send the worker off for execution:

	var worker:IWorker = WorkerFactory.instance.createWorker(Constants.API_AUTHORIZE);
	(worker as IUsersAuth).username = txtUsername.text;
	(worker as IUsersAuth).password = txtPassword.text;
			
	var connector:Connector = new Connector();
			
	connector.addEventListener(ConnectorEvent.ON_USERS_AUTH, function(event:ConnectorEvent):void{
		event.worker.transformResponseObject(event.object);
	});
			
	connector.addEventListener(ConnectorEvent.ON_CONNECTOR_FAULT, function(event:ConnectorEvent):void{
		trace(event.response);
	});
				
	connector.execute(worker);