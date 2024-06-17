import 'package:flutter/material.dart';

class Post {
  final String title;
  final String body;

  Post({required this.title, required this.body});
}

Future<List<Post>> fetchPosts(int page, int limit) async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));

  return List.generate(
    limit,
    (index) => Post(
      title: 'Post ${page * limit + index + 1}',
      body: 'This is the body of post ${page * limit + index + 1}',
    ),
  );
}

class InfiniteScrollList extends StatefulWidget {
  @override
  _InfiniteScrollListState createState() => _InfiniteScrollListState();
}

class _InfiniteScrollListState extends State<InfiniteScrollList> {
  final ScrollController _scrollController = ScrollController();
  final List<Post> _posts = [];
  bool _isLoading = false;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _fetchPosts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
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
        title: Text('Infinite Scroll List'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _posts.length + 1,
        itemBuilder: (context, index) {
          if (index == _posts.length) {
            return _isLoading
                ? Center(child: CircularProgressIndicator())
                : SizedBox.shrink();
          }

          final post = _posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      ),
    );
  }
}
