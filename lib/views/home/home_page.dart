import 'package:flutter/material.dart';
import 'package:linkedin_clone/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../widgets/post_card.dart';
import '../../utils/text_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final homeViewModel = Provider.of<HomeViewmodel>(context, listen: false);
    // homeViewModel.fetchPosts();
    // homeViewModel.fetchStories();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey,
            child: Text('U'), // Placeholder for profile image
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        title: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png',
          width: 30,
          height: 30,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {}, // Placeholder for notifications
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const TextField(
                        enabled: false, // Placeholder for search
                        decoration: InputDecoration(
                          hintText: "Try 'Android Dev'",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.qr_code_scanner, color: Colors.grey),
                    onPressed: () {}, // Placeholder for QR scanner
                  ),
                ],
              ),
            ),
            // Stories Section

            // Posts Section
          ],
        ),
      ),
    );
  }
}