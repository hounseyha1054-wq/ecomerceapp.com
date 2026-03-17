import 'package:flutter/material.dart';
import 'SettingDetail.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Prevents overflow errors
        child: Column(
          children: [
            const SizedBox(height: 80),
            // Header Section
            const Center(
              child: CircleAvatar(
                radius: 50, // Slightly larger
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?semt=ais_hybrid&w=740&q=80",
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Mark Adam",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const Text(
              "Sunny_Koelpin45@hotmail.com",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 40),

            // Settings List
            _buildProfileTile(
              icon: Icons.person_outline,
              title: "Profile",
              onTap: () {},
            ),
            _buildProfileTile(
              icon: Icons.settings_outlined,
              title: "Settings",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profiledetails(),
                  ),
                );
              },
            ),
            _buildProfileTile(
              icon: Icons.mail_outline,
              title: "Contact",
              onTap: () {},
            ),
            _buildProfileTile(
              icon: Icons.share_outlined,
              title: "Share App",
              onTap: () {},
            ),
            _buildProfileTile(
              icon: Icons.help_outline,
              title: "Help",
              onTap: () {},
            ),

            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Sign Out", // Fixed spelling
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 40), // Bottom padding
          ],
        ),
      ),
    );
  }

  // Reusable Tile Widget to keep code clean and "Perfect"
  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.blueAccent, size: 28),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: Colors.grey,
          ),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
        ),
      ),
    );
  }
}
