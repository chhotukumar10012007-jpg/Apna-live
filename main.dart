import 'package:flutter/material.dart';

void main() {
  // Firebase initialization is added after creating a Firebase project
  // and running FlutterFire configuration. Until then, this UI preview runs
  // without a backend.
  runApp(const ApnaLiveApp());
}

class ApnaLiveApp extends StatelessWidget {
  const ApnaLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFE62117);
    return MaterialApp(
      title: 'Apna Live',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: red,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF111111),
        useMaterial3: true,
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
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const VideoFeedScreen(),
      const LiveScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.live_tv, color: Color(0xFFE62117)),
            SizedBox(width: 8),
            Text('Apna Live', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Search',
            onPressed: () => _message('Search will be added in the next step.'),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            tooltip: 'Security',
            onPressed: () => _message(
              'Secure login and account recovery are added after Firebase setup.',
            ),
            icon: const Icon(Icons.shield_outlined),
          ),
        ],
      ),
      body: pages[_tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (value) => setState(() => _tab = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.radio_button_checked), label: 'Go Live'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  void _message(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class VideoFeedScreen extends StatelessWidget {
  const VideoFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final samples = [
      ('Welcome to Apna Live', 'Your video community starts here'),
      ('Live creators', 'Live streaming without subscriber or watch-time thresholds'),
      ('Stay safe', 'Report abuse and protect your account'),
    ];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF292020),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Watch. Create. Go Live.', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Apna Live — a safer place to share videos.'),
            ],
          ),
        ),
        const SizedBox(height: 18),
        for (final item in samples)
          Card(
            margin: const EdgeInsets.only(bottom: 14),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 165,
                  color: const Color(0xFF333333),
                  alignment: Alignment.center,
                  child: const Icon(Icons.play_circle_outline, size: 64),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.$1, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(item.$2, style: const TextStyle(color: Colors.white70)),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined, size: 18),
                          SizedBox(width: 6),
                          Text('Like'),
                          SizedBox(width: 20),
                          Icon(Icons.chat_bubble_outline, size: 18),
                          SizedBox(width: 6),
                          Text('Comment'),
                          SizedBox(width: 20),
                          Icon(Icons.share_outlined, size: 18),
                          SizedBox(width: 6),
                          Text('Share'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Demo screen only: videos, accounts, uploads, and live broadcasting are not connected yet.',
            style: TextStyle(color: Colors.orangeAccent),
          ),
        ),
      ],
    );
  }
}

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.radio_button_checked, size: 72, color: Color(0xFFE62117)),
            const SizedBox(height: 16),
            const Text('Go Live on Apna Live', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'No minimum subscribers or watch time. Secure login and the real streaming service must be configured before broadcasting works.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Live is not connected yet. Next: configure Firebase and a streaming provider.')),
              ),
              icon: const Icon(Icons.videocam),
              label: const Text('Start Live (setup required)'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const CircleAvatar(radius: 42, child: Icon(Icons.person, size: 42)),
        const SizedBox(height: 12),
        const Center(child: Text('Your Apna Live Channel', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        const SizedBox(height: 6),
        const Center(child: Text('Sign-in setup required', style: TextStyle(color: Colors.white70))),
        const SizedBox(height: 22),
        const ListTile(leading: Icon(Icons.lock_outline), title: Text('Account security'), subtitle: Text('Login alerts and recovery will be configured with Firebase.')),
        const ListTile(leading: Icon(Icons.history), title: Text('Your videos'), subtitle: Text('Video library is not connected yet.')),
        const ListTile(leading: Icon(Icons.flag_outlined), title: Text('Report a problem'), subtitle: Text('Reporting backend must be added before launch.')),
      ],
    );
  }
}
