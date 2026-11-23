import 'dart:math';
import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/dashboard_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Initial three tasks

  // Initial tasks that should remain after Pull to Refresh.
  final List<TaskModel> initialTasks = [
    TaskModel(
      title: "System Performance",
      subtitle: "Real-time optimization task",
      status: "Active",
    ),
    TaskModel(
      title: "Weekly Review",
      subtitle: "Waiting for approval",
      status: "Pending",
    ),
    TaskModel(
      title: "Database Backup",
      subtitle: "Completed 2 hours ago",
      status: "Done",
    ),
  ];

  // Current list of tasks displayed on the dashboard.
  late List<TaskModel> tasks = List.from(initialTasks);

  // Available task statuses and filter options.
  final List<String> availableStatuses = [
    "Active",
    "Pending",
    "Done",
  ];

  final List<String> availableFilters = [
    "All",
    "Active",
    "Pending",
    "Done",
  ];

  String selectedFilter = "All";
  int selectedNavigationIndex = 0;
  int nextTaskNumber = 4;

  // Add a new task with a randomly selected status.
  void _addNewTask() {
    final String randomStatus =
        availableStatuses[Random().nextInt(availableStatuses.length)];

    setState(() {
      tasks.add(
        TaskModel(
          title: "Task $nextTaskNumber",
          subtitle: "Subtitle $nextTaskNumber",
          status: randomStatus,
        ),
      );

      nextTaskNumber++;
      selectedFilter = "All";
    });
  }

  // Restore the initial three tasks.
  Future<void> _resetTasks() async {
    setState(() {
      tasks = List.from(initialTasks);
      nextTaskNumber = 4;
      selectedFilter = "All";
    });
  }

  // Return tasks matching the selected status filter.
  List<TaskModel> get filteredTasks {
    if (selectedFilter == "All") {
      return tasks;
    }

    return tasks.where((task) => task.status == selectedFilter).toList();
  }

  Widget _buildStatusFilterChip(String filter) {
    final bool isSelected = selectedFilter == filter;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6200EA) : const Color(0xFFE9E9ED),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          filter,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF555560),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    final List<Map<String, dynamic>> items = [
      {
        "icon": Icons.grid_view_rounded,
        "label": "HOME",
      },
      {
        "icon": Icons.analytics_outlined,
        "label": "INSIGHTS",
      },
      {
        "icon": Icons.inventory_2_outlined,
        "label": "PROJECTS",
      },
      {
        "icon": Icons.person_outline_rounded,
        "label": "ACCOUNT",
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAF9FF),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: List.generate(items.length, (index) {
              final bool isSelected = selectedNavigationIndex == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedNavigationIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        items[index]["icon"],
                        size: 20,
                        color: isSelected
                            ? const Color(0xFF6200EA)
                            : const Color(0xFF9AA0B0),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        items[index]["label"],
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? const Color(0xFF6200EA)
                              : const Color(0xFF9AA0B0),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FC),

      // TOP APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Color(0xFF6200EA),
            size: 22,
          ),
        ),
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Color(0xFF6200EA),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: const Color(0xFFF0D0B8),
              child: const Icon(
                Icons.person,
                color: Color(0xFF9C6D4C),
                size: 21,
              ),
            ),
          ),
        ],
      ),

      // MAIN BODY
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFAF9FF),
              Color(0xFFF0FFF4),
              Color(0xFFF9F7FF),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 22, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GREETING SECTION
              const Text(
                "Hello, User",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF222229),
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Check your recent activity today.",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777781),
                ),
              ),

              const SizedBox(height: 20),

              // FILTER BUTTONS
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: availableFilters.map((filter) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: _buildStatusFilterChip(filter),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 24),

              // TASK LIST

              Expanded(
                child: RefreshIndicator(
                  onRefresh: _resetTasks,
                  color: const Color(0xFF6200EA),
                  backgroundColor: Colors.white,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: filteredTasks.isEmpty ? 1 : filteredTasks.length,
                    itemBuilder: (context, index) {
                      // EMPTY STATE
                      if (filteredTasks.isEmpty) {
                        return SizedBox(
                          height: 250,
                          child: const Center(
                            child: Text(
                              "No tasks available",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF777781),
                              ),
                            ),
                          ),
                        );
                      }

                      // TASK CARDS
                      return DashboardCard(
                        task: filteredTasks[index],
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // REFRESH BUTTON
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF5420C9),
                      Color(0xFF6900EA),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6200EA).withOpacity(0.20),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: _addNewTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 7),
                      Text(
                        "Refresh",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }
}
