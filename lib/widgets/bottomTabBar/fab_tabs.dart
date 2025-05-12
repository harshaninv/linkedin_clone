import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/constants.dart';
import 'package:linkedin_clone/views/home/home_page.dart';
import 'package:linkedin_clone/views/jobs/jobs_page.dart';
import 'package:linkedin_clone/views/myConnection/connections_page.dart';
import 'package:linkedin_clone/views/notification/notifications_page.dart';

class FabTabs extends StatefulWidget {
  const FabTabs({super.key});

  @override
  State<FabTabs> createState() => _FabTabsState();
}

class _FabTabsState extends State<FabTabs> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ConnectionsPage(),
    NotificationsPage(),
    JobsPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: _pages[currentIndex]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.secondary,
        onPressed: () {
          // Handle FAB action here
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color:
                            currentIndex == 0
                                ? Constants.secondary
                                : Constants.secondaryLight,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.group_rounded,
                        color:
                            currentIndex == 1
                                ? Constants.secondary
                                : Constants.secondaryLight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.messenger_rounded,
                        color:
                            currentIndex == 2
                                ? Constants.secondary
                                : Constants.secondaryLight,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.work,
                        color:
                            currentIndex == 3
                                ? Constants.secondary
                                : Constants.secondaryLight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
