import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/constants.dart';
import 'package:linkedin_clone/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../widgets/post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch posts and stories when the widget is initialized usse asynchronous method
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeViewModel = Provider.of<HomeViewmodel>(context, listen: false);
      homeViewModel.fetchPosts();
      homeViewModel.fetchStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            foregroundImage: AssetImage(Constants.profileImage1),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),

        title: Image.asset(Constants.logoImage, height: 25),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Constants.secondaryLight,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<HomeViewmodel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                // Search Bar Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: const TextField(
                              enabled: false, // Placeholder for search
                              decoration: InputDecoration(
                                hintText: "Try 'Android Dev'",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Constants.secondaryLight,
                                  size: 30,
                                ),
                                suffixIcon: Icon(
                                  Icons.qr_code_scanner,
                                  color: Constants.secondaryLight,
                                  size: 30,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Stories Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: SizedBox(
                    height: 100,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 10);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.stories.length,
                      itemBuilder: (context, index) {
                        final story = viewModel.stories[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Constants.secondary,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Constants.secondaryLight,
                                  foregroundImage: AssetImage(
                                    story.imageUrl,
                                  ), // Use image from StoryModel
                                ),
                              ),
                              if (story.isUser)
                                Positioned(
                                  bottom: 8,
                                  right: -2,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Constants.secondary,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Posts Section
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.posts.length,
                  itemBuilder: (context, index) {
                    final post = viewModel.posts[index];
                    return PostCard(post: post);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
