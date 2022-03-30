import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends StatefulWidget {
  const WebSocket({Key? key}) : super(key: key);

  @override
  _WebSocketState createState() => _WebSocketState();
}

class _WebSocketState extends State<WebSocket> {

  TextEditingController textEditingController = TextEditingController();
  var channel = WebSocketChannel.connect(Uri.parse('wss://demo.jarvis.live/ws/feed/9695039218/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2 '));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Socket'),
      ),
      body: StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot){
            print(snapshot.hasData? snapshot.data: 'received data');
            return ListTile(
              leading: Icon(Icons.beach_access_sharp),
              title: Text(snapshot.hasData?'${snapshot.data}': 'No data'),
            );
          }
      ),
    );
  }
}