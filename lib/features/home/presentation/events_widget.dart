import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventsListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      "image": 'assets/images/recommended_adventure.png',
      "label": "Hiking",
      "title": "Bukhansan Hiking Adventure",
      "location": "Seoul Mapo",
      "date": "August 8 (Wed)",
      "price": "₩ 3,000",
      "participants": "3/4",
    },
    {
      "image": 'assets/images/recommended_adventure.png',
      "label": "Hiking",
      "title": "Bukhansan Hiking Adventure",
      "location": "Seoul Mapo",
      "date": "August 8 (Wed)",
      "price": "₩ 3,000",
      "participants": "3/4",
    },
    {
      "image": 'assets/images/recommended_adventure.png',
      "label": "Hiking",
      "title": "Bukhansan Hiking Adventure",
      "location": "Seoul Mapo",
      "date": "August 8 (Wed)",
      "price": "₩ 3,000",
      "participants": "3/4",
    },
    {
      "image": 'assets/images/recommended_adventure.png',
      "label": "Hiking",
      "title": "Bukhansan Hiking Adventure",
      "location": "Seoul Mapo",
      "date": "August 8 (Wed)",
      "price": "₩ 3,000",
      "participants": "3/4",
    },
        {
      "image": 'assets/images/recommended_adventure.png',
      "label": "Hiking",
      "title": "Bukhansan Hiking Adventure",
      "location": "Seoul Mapo",
      "date": "August 8 (Wed)",
      "price": "₩ 3,000",
      "participants": "3/4",
    },
    {
      "image": 'assets/images/recommended_adventure.png',
      "label": "Hiking",
      "title": "Bukhansan Hiking Adventure",
      "location": "Seoul Mapo",
      "date": "August 8 (Wed)",
      "price": "₩ 3,000",
      "participants": "3/4",
    },
  ];

  EventsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Events",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: events.length,
          itemBuilder: (context, index) {
            return _buildEventCard(events[index]);
          },
        ),
      ],
    );
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage(event["image"]),
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    event["label"],
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  event["title"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  "${event["location"]} • ${event["date"]}",
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      event["price"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    SvgPicture.asset(
                      'assets/icons/user_small.svg',
                      height: 16,
                    ),
                    const SizedBox(width: 2.0),
                    Text(
                      event["participants"],
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
