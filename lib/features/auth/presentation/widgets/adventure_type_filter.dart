import 'package:flutter/material.dart';

class AdventureTypeSelector extends StatefulWidget {
  final ValueChanged<int> onSelected;

  const AdventureTypeSelector({required this.onSelected});

  @override
  _AdventureTypeSelectorState createState() => _AdventureTypeSelectorState();
}

class _AdventureTypeSelectorState extends State<AdventureTypeSelector> {
  int _selectedType = 0;

  final List<Map<String, dynamic>> _adventureTypes = [
    {"icon": Icons.apps, "label": "All"},
    {"icon": Icons.terrain, "label": "Hiking"},
    {"icon": Icons.directions_bike, "label": "Cycling"},
    {"icon": Icons.gamepad, "label": "Board game"},
    {"icon": Icons.theater_comedy, "label": "Culture"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // SizedBox를 사용해 크기 제한
        height: 100, // 높이를 명시적으로 설정 (필요에 따라 조정 가능)
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _adventureTypes.length,
          shrinkWrap: true, // shrinkWrap을 true로 설정하여 필요 이상으로 확장되지 않도록 함
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedType = index;
                  widget.onSelected(_selectedType);
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color:
                      _selectedType == index ? Colors.grey[300] : Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    if (_selectedType == index)
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _adventureTypes[index]["icon"],
                      size: 40.0,
                      color:
                          _selectedType == index ? Colors.black : Colors.grey,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      _adventureTypes[index]["label"],
                      style: TextStyle(
                        color:
                            _selectedType == index ? Colors.black : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
