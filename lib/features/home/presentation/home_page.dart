import 'package:flutter/material.dart';
import 'package:okapi_z/features/auth/presentation/widgets/adventure_type_filter.dart';
import 'package:okapi_z/features/auth/presentation/widgets/search_field.dart';
import 'package:okapi_z/features/home/presentation/events_widget.dart';
import 'package:okapi_z/features/home/presentation/recommended_widget.dart';

class HomePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Okapi-Z'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchField(
                controller: searchController,
                icon: Icons.calendar_month_rounded,
                hintText: 'Search',
              ),
              AdventureTypeSelector(
                onSelected: (index) {
                  print('Selected index: $index');
                },
              ),
              RecommendedWidget(),
              EventsListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
