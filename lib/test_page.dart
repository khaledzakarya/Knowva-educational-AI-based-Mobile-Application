import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Good morning, Mr. Amr 👋",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ), // صورة بروفايل افتراضية
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Stats
            const Text(
              "Quick Stats",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _statCard("Classes", "5", Icons.class_),
                _statCard("Students", "120", Icons.people),
                _statCard("Materials", "12", Icons.menu_book),
                _statCard("Exams", "4", Icons.assignment),
              ],
            ),

            const SizedBox(height: 20),

            // Quick Actions
            const Text(
              "Quick Actions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _actionButton(Icons.assignment_add, "New Exam"),
                _actionButton(Icons.upload_file, "Upload Material"),
                _actionButton(Icons.people_alt, "Manage Students"),
                _actionButton(Icons.bar_chart, "Analytics"),
              ],
            ),

            const SizedBox(height: 20),

            // Upcoming Tasks
            const Text(
              "Upcoming",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _upcomingCard("Math Exam", "Tomorrow, 10:00 AM"),
            _upcomingCard("Upload Physics Notes", "Due in 2 days"),

            const SizedBox(height: 20),

            // AI Suggestions
            const Text(
              "AI Suggestions 🤖",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.lightbulb, color: Colors.orange),
                title: const Text(
                  "40% of students struggled in Math last week.",
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: const Text(
                  "Would you like to create a practice quiz?",
                ),
                trailing: TextButton(
                  child: const Text("Create"),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Students"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Materials",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Analytics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  // Quick Stats Card
  Widget _statCard(String title, String value, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  // Quick Action Button
  Widget _actionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Upcoming Task Card
  Widget _upcomingCard(String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.calendar_today, color: Colors.redAccent),
        title: Text(title, style: const TextStyle(fontSize: 14)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
