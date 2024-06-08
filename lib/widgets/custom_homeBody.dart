import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PhysicalTab extends StatefulWidget {
  const PhysicalTab({super.key});
  @override
  _PhysicalTabState createState() => _PhysicalTabState();
}

class _PhysicalTabState extends State<PhysicalTab> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expanded GridView to fill remaining space
        Expanded(
          child: GridView.count(
            padding: EdgeInsets.all(10.0),
            crossAxisCount: 1,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: <Widget> [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay; // update `_focusedDay` here as well
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              Container(
                color: Colors.blue,
                child: Center(child: Text('Item 2')),
              ),
              Container(
                color: Colors.green,
                child: Center(child: Text('Item 3')),
              ),
              Container(
                color: Colors.orange,
                child: Center(child: Text('Item 4')),
              ),
            ]
          ),
        ),

      ],
    );
  }


}
