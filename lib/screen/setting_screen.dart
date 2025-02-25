import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Settings",
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          children: [
            _buildProfileSection(),
            const SizedBox(height: 20),
            _buildSettingsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/df/f7/48/dff748e4bd6b8282339b739113f61326.jpg'),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ajay Devmurari",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "Flutter Developer",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.edit, color: Colors.blueAccent, size: 28),
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return Column(
      children: [
        _buildSettingsOption(Icons.person, "Account", "Manage account"),
        _buildDivider(),
        _buildSettingsOption(
            Icons.notifications, "Notifications", "Customize alerts"),
        _buildDivider(),
        _buildSettingsOption(Icons.lock, "Privacy", "Manage security settings"),
        _buildDivider(),
        _buildSettingsOption(Icons.language, "Language", "Change app language"),
        _buildDivider(),
        _buildSettingsOption(Icons.info, "About App", "Tv Show App"),
      ],
    );
  }

  Widget _buildSettingsOption(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent, size: 32),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 20),
      onTap: () {
        // Implement navigation or actions
      },
    );
  }

  Widget _buildDivider() {
    return const Divider(
        color: Colors.white24, thickness: 1, indent: 60, endIndent: 10);
  }
}
