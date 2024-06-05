import 'package:flutter/material.dart';
import './add_page.dart' as MyAddPage;
import './edit_page.dart' as MyEditPage;
import './save_page.dart' as MySavePage;
import './delete_page.dart' as MyDeletePage;
import './share_page.dart' as MySharePage;


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to My Flutter App!',
            ),
            SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text('This is the second screen.'),
      ),
    );
  }
}
void main() => runApp(const ScaffoldExampleApp());

class ScaffoldExampleApp extends StatelessWidget {
  const ScaffoldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScaffoldExample(),
    );
  }
}

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({super.key});

  @override
  State<ScaffoldExample> createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(
        child: Text('Bottom App Bar with Multiple Buttons'),
      ),
      bottomNavigationBar: BottomAppBar(
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAddPage.AddPage()),
                );
              },
            ),
             IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MySavePage.SavePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyEditPage.EditPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDeletePage.DeletePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MySharePage.SharePage()),
                );
               },
            ),
          ],
        ),
      ),
    );
  }
}