import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdventureTypeSelector extends StatefulWidget {
  final ValueChanged<int> onSelected;

  const AdventureTypeSelector({required this.onSelected});

  @override
  _AdventureTypeSelectorState createState() => _AdventureTypeSelectorState();
}

class _AdventureTypeSelectorState extends State<AdventureTypeSelector> {
  int _selectedType = 0;

  final List<Map<String, dynamic>> _adventureTypes = [
    {
      "icon": SvgPicture.asset(
        'assets/icons/all_adventures.svg',
      ),
      "label": "All"
    },
    {
      "icon": SvgPicture.asset(
        'assets/icons/hiking_adventure.svg',
      ),
      "label": "Hiking"
    },
    {
      "icon": SvgPicture.asset(
        'assets/icons/cycling_adventure.svg',
      ),
      "label": "Cycling"
    },
    {
      "icon": SvgPicture.asset(
        'assets/icons/board_game_adventure.svg',
      ),
      "label": "Board game"
    },
    {
      "icon": SvgPicture.asset(
        'assets/icons/culture_adventure.svg',
      ),
      "label": "Culture"
    },
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _adventureTypes[index]["icon"],
                    const SizedBox(height: 4.0),
                    Text(
                      _adventureTypes[index]["label"],
                      style: TextStyle(
                        color:
                            _selectedType == index ? Colors.black : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
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
