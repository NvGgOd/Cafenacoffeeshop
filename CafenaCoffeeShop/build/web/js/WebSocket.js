/* 
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */

var wsURI = "ws://" + document.location.host + "/CafenaCoffeeShop/chat";

var websocket = new WebSocket(wsURI);

websocket.onmessage = function (event) {
    onMessage(event);
};

websocket.onopen = function () {
    onOpen();
};

function onOpen() {
    console.log("Opened connection: " + wsURI);
}

function onClose() {
    console.log("Closed connection: " + wsURI);
}
function onMessage(event) {
    console.log(event);
    display(event.data);
}

function display(message) {
    var data = JSON.parse(message);
    var content = "<p>" + data.email + ": " + data.content + "</p>";
    document.getElementById("output").innerHTML += content + "<br>";
    var output = document.getElementById("output");
    output.scrollTop = output.scrollHeight;
}

function send() {
    var email = document.getElementById("email").value;
    var message = document.getElementById("message").value;
    var json = {
        "email": email,
        "content": message
    };
    console.log("Sending: " + message);
    websocket.send(JSON.stringify(json));
}