import 'package:flutter/material.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';

class Technician {
  final String name;
  final String profileImage;
  final double rating;
  final int experience; // in years
  final List<String> specializations;
  final String availability;
  final String phoneNumber;
  final String location;
  final String bio;

  Technician({
    required this.name,
    required this.profileImage,
    required this.rating,
    required this.experience,
    required this.specializations,
    required this.availability,
    required this.phoneNumber,
    required this.location,
    required this.bio,
  });
}

class TechnicianDialog extends StatelessWidget {
  final Technician technician;

  TechnicianDialog({required this.technician});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.backgroundDark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Technician Details",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Technician Image
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(technician.profileImage),
              ),
            ),
            SizedBox(height: 12),

            // Technician Name & Rating
            Center(
              child: Column(
                children: [
                  Text(
                    technician.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      SizedBox(width: 5),
                      Text(
                        "${technician.rating} ⭐",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Technician Details List
            Flexible(
              child: ListView(
                children: [
                  _buildDetailRow(Icons.work, "Experience",
                      "${technician.experience} years"),
                  _buildDetailRow(Icons.build, "Specializations",
                      technician.specializations.join(", ")),
                  _buildDetailRow(
                      Icons.schedule, "Availability", technician.availability),
                  _buildDetailRow(
                      Icons.location_on, "Location", technician.location),
                  _buildDetailRow(Icons.info_outline, "About", technician.bio),
                  _buildDetailRow(
                      Icons.phone, "Contact", technician.phoneNumber),
                ],
              ),
            ),
            SizedBox(height: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "$title: $value",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
