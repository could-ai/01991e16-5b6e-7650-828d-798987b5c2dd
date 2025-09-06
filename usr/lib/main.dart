import 'package:couldai_user_app/models/post_model.dart';
import 'package:couldai_user_app/models/story_model.dart';
import 'package:couldai_user_app/widgets/post_widget.dart';
import 'package:couldai_user_app/widgets/story_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Story> _stories = [
    Story(
        username: 'Your Story',
        avatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704d'),
    Story(
        username: 'user1',
        avatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704e'),
    Story(
        username: 'user2',
        avatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704f'),
    Story(
        username: 'user3',
        avatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704a'),
    Story(
        username: 'user4',
        avatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704b'),
    Story(
        username: 'user5',
        avatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704c'),
  ];

  final List<Post> _posts = [
    Post(
      username: 'user1',
      userAvatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704e',
      postUrl: 'https://picsum.photos/seed/picsum/400/400',
      caption: 'This is a beautiful landscape!',
      likes: 1023,
    ),
    Post(
      username: 'user2',
      userAvatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704f',
      postUrl: 'https://picsum.photos/seed/picsum2/400/400',
      caption: 'Having fun with friends.',
      likes: 542,
    ),
    Post(
      username: 'user3',
      userAvatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704a',
      postUrl: 'https://picsum.photos/seed/picsum3/400/400',
      caption: 'My new puppy!',
      likes: 2312,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32.0,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _stories.length,
                itemBuilder: (context, index) {
                  return StoryWidget(story: _stories[index]);
                },
              ),
            ),
            const Divider(),
            // Posts
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostWidget(post: _posts[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined), label: 'Reels'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
