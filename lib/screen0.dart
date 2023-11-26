import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  const Screen0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 0'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
              child: Text('Go To Screen 1'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Background color
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Go To Screen 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class NetworkImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urlImage = 'https://wallpapercave.com/wp/MWlNRPT.jpg';
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Image.network(
          urlImage,
          width: 200,
          height: 200,
        )
      ],
    );
  }
}
