import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';
import '../widgets/infinitescroll.dart';
import '../screens/friendlist.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({Key? key}) : super(key: key);

  @override
  _SocialScreenState createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Post> _posts = [];
  bool _isLoading = false;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _fetchPosts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchPosts();
      }
    });
  }

  Future<void> _fetchPosts() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    List<Post> newPosts = await fetchPosts(_currentPage, 10);
    setState(() {
      _currentPage++;
      _isLoading = false;
      _posts.addAll(newPosts);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social'),
        actions: [
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendsListPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _posts.length + 1,
        itemBuilder: (context, index) {
          if (index == _posts.length) {
            return _isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink();
          }

          final post = _posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      ),
      bottomNavigationBar:bottomNavigationBar()
    );
  }
}