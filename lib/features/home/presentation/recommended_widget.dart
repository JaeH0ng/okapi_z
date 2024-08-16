import 'package:flutter/material.dart';

class RecommendedWidget extends StatelessWidget {
  final List<Map<String, dynamic>> recommendations = [
    {
      "image":
          'assets/images/recommended_adventure.png', // Replace with actual image URL or asset
      "label": "Hiking",
      "title": "Bukhansan Hiking Adventure",
      "location": "Seoul Mapo",
      "date": "August 8 (Wed)",
    },
    {
      "image":
          'assets/images/recommended_adventure.png', // Replace with actual image URL or asset
      "label": "Hiking",
      "title": "Bukhansan Hiking Adventure",
      "location": "Seoul Mapo",
      "date": "August 8",
    },
    {
      "image":
          'assets/images/recommended_adventure.png', // Replace with actual image URL or asset
      "label": "Hiking",
      "title": "Bukhansan Hiking Adventure",
      "location": "Seoul Mapo",
      "date": "August 8",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Recommended",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 280, // Adjust height based on your design
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              return _buildRecommendationCard(recommendations[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendationCard(Map<String, dynamic> recommendation) {
    return Container(
      width: 200, // Adjust the width based on your design
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image(
              image: AssetImage(recommendation["image"]),
              height: 120, // Adjust based on your design
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    recommendation["label"],
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  recommendation["title"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),
                Text(
                  recommendation["location"],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                SizedBox(height: 2.0),
                Text(
                  recommendation["date"],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
