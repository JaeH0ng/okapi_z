import 'package:flutter/material.dart';
import 'package:okapi_z/features/auth/presentation/widgets/adventure_type_filter.dart';
import 'package:okapi_z/features/auth/presentation/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchField(
            controller: searchController,
            icon: Icons.calendar_month_rounded,
            hintText: 'Search',
          ),
          AdventureTypeSelector(onSelected: (index) {
            print('Selected index: $index');
          }),
        ],
      ),
    );
  }
}
