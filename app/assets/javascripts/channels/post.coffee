App.post = App.cable.subscriptions.create "PostChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
	console.log('connection  made');
    
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data);
    location.reload();
