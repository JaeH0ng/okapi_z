import 'package:flutter/material.dart';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final PageController _pageController = PageController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  int minParticipants = 1;
  int maxParticipants = 1;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),
        
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // Prevents manual swiping
        children: [
          _buildFirstPage(),
          _buildSecondPage(),
        ],
      ),
    );
  }

  Widget _buildFirstPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageUploadSection(),
          SizedBox(height: 16.0),
          _buildTextField("Title", "Enter event title", titleController),
          SizedBox(height: 16.0),
          _buildTextField("Description", "Enter description of event here",
              descriptionController,
              maxLines: 5),
          SizedBox(height: 16.0),
          _buildTagSection(),
          SizedBox(height: 32.0),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildSecondPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildParticipantsSection(),
          Divider(height: 32.0, thickness: 1.0),
          _buildDateSection(),
          Divider(height: 32.0, thickness: 1.0),
          _buildLocationSection(),
          SizedBox(height: 32.0),
          _buildPostButton(),
        ],
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      children: [
        Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IconButton(
            icon: Icon(Icons.camera_alt, size: 30),
            onPressed: () {
              // Implement image upload functionality
            },
          ),
        ),
        SizedBox(height: 8.0),
        Text("0/10", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildTextField(
      String label, String hintText, TextEditingController controller,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }

  Widget _buildTagSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tag",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),
        TextField(
          controller: tagController,
          decoration: InputDecoration(
            hintText: "#Tag",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          children: [
            Chip(
              label: Text("Hiking"),
              onDeleted: () {
                // Implement tag delete functionality
              },
            ),
            // Add more tags as necessary
          ],
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          // primary: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          _pageController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        },
        child: Text("Next", style: TextStyle(fontSize: 16.0)),
      ),
    );
  }

  Widget _buildParticipantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Participants",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 16.0),
        _buildParticipantRow("Minimum Number", minParticipants, (newValue) {
          setState(() {
            minParticipants = newValue;
          });
        }),
        SizedBox(height: 16.0),
        _buildParticipantRow("Maximum Number", maxParticipants, (newValue) {
          setState(() {
            maxParticipants = newValue;
          });
        }),
      ],
    );
  }

  Widget _buildParticipantRow(
      String label, int value, ValueChanged<int> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                if (value > 1) {
                  onChanged(value - 1);
                }
              },
            ),
            Text(value.toString(), style: TextStyle(fontSize: 16.0)),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                onChanged(value + 1);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 16.0),
        _buildDateRow(),
        SizedBox(height: 16.0),
        _buildTimeRow(),
      ],
    );
  }

  Widget _buildDateRow() {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null && pickedDate != selectedDate) {
          setState(() {
            selectedDate = pickedDate;
          });
        }
      },
      child: Row(
        children: [
          Icon(Icons.calendar_today, color: Colors.grey),
          SizedBox(width: 8.0),
          Text("${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }

  Widget _buildTimeRow() {
    return InkWell(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        );
        if (pickedTime != null && pickedTime != selectedTime) {
          setState(() {
            selectedTime = pickedTime;
          });
        }
      },
      child: Row(
        children: [
          Icon(Icons.access_time, color: Colors.grey),
          SizedBox(width: 8.0),
          Text("${selectedTime.format(context)}",
              style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Location",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 16.0),
        TextField(
          controller: locationController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  Widget _buildPostButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          // primary: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // Implement post functionality
        },
        child: Text("Post", style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
