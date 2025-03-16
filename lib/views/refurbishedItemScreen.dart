import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RefurbishedItemScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const RefurbishedItemScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(item["name"], style: TextStyle(color: Colors.white)),
        backgroundColor: (Theme.of(context).brightness == Brightness.dark)
            ? AppColors.textPrimary
            : AppColors.electricBlue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Image with 360° View Option
            Stack(
              children: [
                Image.asset(item["image"],
                    width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      // Handle 360° view action
                    },
                    icon: Icon(Icons.threed_rotation, color: Colors.black),
                    label: Text("360° View",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name & Price
                  Text(item["name"],
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                  SizedBox(height: 4),
                  Text(
                    "XYZ Electricals, Matiyari Tiraha, Lucknow",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 169, 169, 169)),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "₹${item["price"]}",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 10),

                  // Condition, Warranty & Return Policy
                  _buildInfoRow(
                      context, "Condition", item["condition"], Icons.info),
                  _buildInfoRow(context, "Warranty", "6 Months Seller Warranty",
                      Icons.verified),
                  _buildInfoRow(context, "Return Policy", "7 Days Replacement",
                      Icons.repeat),

                  SizedBox(height: 20),

                  // Customer Assurance Section
                  _buildSectionTitle("Why Buy This Refurbished?"),
                  SizedBox(height: 6),
                  _buildBulletPoint(
                      "Thoroughly tested and certified by professionals."),
                  _buildBulletPoint(
                      "Comes with a 6-month warranty for peace of mind."),
                  _buildBulletPoint("7-day easy replacement policy available."),
                  _buildBulletPoint("Save up to 50% compared to new products!"),

                  SizedBox(height: 20),

                  // Comparison Section
                  _buildSectionTitle("Refurbished vs. New"),
                  SizedBox(height: 6),
                  _buildComparisonTable(context),

                  SizedBox(height: 20),

                  // Customer Reviews
                  _buildSectionTitle("Vendor Suggestions"),
                  _buildReview(context, "Amit Sharma", 5,
                      "Great condition! Works like new."),
                  _buildReview(context, "Neha Verma", 4,
                      "Slight scratches, but excellent performance."),
                  TextButton(
                    onPressed: () {
                      // Show all reviews
                    },
                    child: Text("See all reviews",
                        style: TextStyle(color: Colors.blue)),
                  ),

                  SizedBox(height: 20),

                  // Buy Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        // Handle buy action
                      },
                      child: Text("Buy Now",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
    );
  }

  // Information Row Widget
  Widget _buildInfoRow(
      BuildContext context, String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          SizedBox(width: 8),
          Text("$title: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Text(value,
              style: TextStyle(
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? Colors.white70
                      : Colors.black)),
        ],
      ),
    );
  }

  // Bullet Point Widget
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 25),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  // Review Widget
  Widget _buildReview(
      BuildContext context, String name, int stars, String review) {
    return Card(
      color: (Theme.of(context).brightness == Brightness.dark)
          ? Colors.grey[900]
          : AppColors.electricBlue,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 5),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < stars ? Colors.amber : Colors.grey,
                  size: 16,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(review, style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  // Comparison Table Widget
  Widget _buildComparisonTable(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: (Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Colors.black,
      ),
      children: [
        _buildTableRow("Feature", "Refurbished", "New"),
        _buildTableRow("Price", "Up to 50% cheaper", "Full Price"),
        _buildTableRow("Warranty", "6 Months", "1 Year"),
        _buildTableRow("Performance", "Tested, Like New", "Brand New"),
        _buildTableRow("Eco-Friendly", "Yes, reduces waste", "No"),
      ],
    );
  }

  // Table Row Widget
  TableRow _buildTableRow(String feature, String refurbished, String newItem) {
    return TableRow(
      children: [
        _buildTableCell(feature, FontWeight.bold),
        _buildTableCell(refurbished, FontWeight.normal),
        _buildTableCell(newItem, FontWeight.normal),
      ],
    );
  }

  // Table Cell Widget
  Widget _buildTableCell(String text, FontWeight fontWeight) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(fontWeight: fontWeight),
        textAlign: TextAlign.center,
      ),
    );
  }
}
