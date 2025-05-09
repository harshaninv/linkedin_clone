import 'package:flutter/material.dart';
import 'package:linkedin_clone/viewmodels/profile_viewmodel.dart';
import 'package:linkedin_clone/widgets/profile/profile_scrollable_cards.dart';
import 'package:provider/provider.dart';
import '../../widgets/profile/profile_header.dart';
import '../../widgets/profile/profile_analytics.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Fetch profile data when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      final profileViewModel = Provider.of<ProfileViewmodel>(
        context,
        listen: false,
      );
      await profileViewModel.fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blueGrey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Image.asset(Constants.logoImage, height: 25),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.blueGrey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.blueGrey),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<ProfileViewmodel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading || viewModel.profile == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(profile: viewModel.profile!),
                ProfileScrollableCards(),
                ProfileAnalytics(profile: viewModel.profile!),
              ],
            ),
          );
        },
      ),
    );
  }
}
