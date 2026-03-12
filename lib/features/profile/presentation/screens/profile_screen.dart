import 'package:bite/features/auth/presentation/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(),
            const SizedBox(height: 30),

            _buildSectionTitle("ACCOUNT"),
            _buildProfileTile(Icons.person_outline, "Edit Profile"),
            _buildProfileTile(Icons.lock_outline, "Change Password"),
            _buildProfileTile(
              Icons.notifications_none,
              "Notification Settings",
            ),

            const SizedBox(height: 20),
            _buildSectionTitle("PREFERENCES"),
            _buildProfileTile(
              Icons.dark_mode_outlined,
              "Dark Mode",
              trailing: Switch(value: false, onChanged: (v) {}),
            ),
            _buildProfileTile(
              Icons.language,
              "Language",
              trailingText: "English",
            ),

            const SizedBox(height: 20),
            // --- Support Section ---
            _buildSectionTitle("SUPPORT"),
            _buildProfileTile(Icons.help_outline, "Help Center"),
            _buildProfileTile(Icons.security_outlined, "Privacy Policy"),
            _buildProfileTile(Icons.description_outlined, "Terms of Service"),

            const SizedBox(height: 30),
            // --- Logout Button ---
            _buildLogoutButton(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade100,
              backgroundImage: const NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/300/300221.png',
              ), 
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFFFF7043),
              child: const Icon(Icons.edit, color: Colors.white, size: 18),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Text(
          "Ahmed Abdelghany",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          "ahmed.j@example.com",
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTile(
    IconData icon,
    String title, {
    Widget? trailing,
    String? trailingText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFFF7043)),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        trailing:
            trailing ??
            (trailingText != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        trailingText,
                        style: const TextStyle(color: Color(0xFFFF7043)),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.grey,
                      ),
                    ],
                  )
                : const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey,
                  )),
        onTap: () {},
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SigninScreen()),
          (route) => false,
        );
      },
      icon: const Icon(Icons.logout, color: Color(0xFFFF7043)),
      label: const Text(
        "Logout",
        style: TextStyle(color: Color(0xFFFF7043), fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFF1EE),
        minimumSize: const Size(double.infinity, 55),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
