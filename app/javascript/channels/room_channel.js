import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("I'm live!!!!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#messages").append('<div class="message">'+ data.name + ': ' + data.content +'</div>')
  }
});
