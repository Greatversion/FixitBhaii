import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:fixitbhai/utils/themes/app.theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme),
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // Dark theme like Zomato
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        "assets/images/profile_pic.png"), // Replace with actual profile pic
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "+91 9876543210",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        "johndoe@gmail.com",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontSize: 15,
                                color: (Theme.of(context).brightness ==
                                        Brightness.dark)
                                    ? Colors.white70
                                    : Colors.black54),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blueAccent),
                    onPressed: () {
                      // Navigate to Edit Profile
                    },
                  )
                ],
              ),
              Divider(
                color: (Theme.of(context).brightness == Brightness.dark)
                    ? Colors.white24
                    : Colors.black54,
                height: 30,
              ),

              // Wallet & Payments
              _buildListTile(
                context,
                icon: Icons.account_balance_wallet,
                title: "Wallet Balance",
                subtitle: "₹1,250",
                onTap: () {
                  // Navigate to Wallet
                },
              ),
              _buildListTile(
                context,
                icon: Icons.payment,
                title: "Payment Methods",
                subtitle: "UPI, Cards, Net Banking",
                onTap: () {
                  // Navigate to Payment Methods
                },
              ),

              Divider(
                color: (Theme.of(context).brightness == Brightness.dark)
                    ? Colors.white24
                    : Colors.black54,
                height: 30,
              ),

              // Saved Addresses
              _buildListTile(
                context,
                icon: Icons.location_on,
                title: "Saved Addresses",
                subtitle: "Home, Work, Others",
                onTap: () {
                  // Navigate to Addresses
                },
              ),

              // Settings & Preferences
              _buildListTile(
                context,
                icon: Icons.settings,
                title: "Settings & Preferences",
                subtitle: "App settings, notifications",
                onTap: () {
                  // Navigate to Settings
                },
              ),
              _buildListTile(
                context,
                icon: Icons.dark_mode,
                title: "Dark Mode",
                subtitle: "Enabled",
                trailing: Switch(
                  value: true,
                  onChanged: (bool value) {
                    // Toggle Dark Mode
                  },
                ),
                onTap: () {},
              ),

              Divider(
                color: (Theme.of(context).brightness == Brightness.dark)
                    ? Colors.white24
                    : Colors.black54,
                height: 30,
              ),
              // Customer Support & Help
              _buildListTile(
                context,
                icon: Icons.support_agent,
                title: "Customer Support",
                subtitle: "Chat with us",
                onTap: () {
                  // Open Support
                },
              ),
              _buildListTile(
                context,
                icon: Icons.privacy_tip,
                title: "Privacy Policy",
                subtitle: "Read our policies",
                onTap: () {
                  // Navigate to Privacy Policy
                },
              ),

              Divider(
                color: (Theme.of(context).brightness == Brightness.dark)
                    ? Colors.white24
                    : Colors.black54,
                height: 30,
              ),

              // Logout
              _buildListTile(
                context,
                icon: Icons.logout,
                title: "Logout",
                subtitle: "Sign out from your account",
                onTap: () {
                  // Logout Function
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Common ListTile Widget
Widget _buildListTile(
  context, {
  required IconData icon,
  required String title,
  required String subtitle,
  Widget? trailing,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: Colors.blueAccent),
    title: Text(
      title,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
    ),
    subtitle: Text(
      subtitle,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
          color: (Theme.of(context).brightness == Brightness.dark)
              ? Colors.white70
              : Colors.black54,
          fontSize: 13),
    ),
    trailing: trailing ??
        Icon(Icons.arrow_forward_ios,
            color: (Theme.of(context).brightness == Brightness.dark)
                ? Colors.white70
                : Colors.black54,
            size: 16),
    onTap: onTap,
  );
}
