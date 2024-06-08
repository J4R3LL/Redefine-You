import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PhysicalTab extends StatefulWidget {
  const PhysicalTab({super.key});
  @override
  _PhysicalTabState createState() => _PhysicalTabState();
}

class Event {
  final String title;
  final String? description;
  final DateTime? date;

  const Event({
    required this.title,
    this.description,
    this.date,
  });

  @override
  String toString() => title;
}

class _PhysicalTabState extends State<PhysicalTab> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<Event>> _events = {
    DateTime.utc(2023, 6, 19): [Event(title: 'Event A6'), Event(title: 'Event B6')],
    DateTime.utc(2023, 6, 21): [Event(title: 'Event C6')],
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          TableCalendar<Event>(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents.value = _getEventsForDay(selectedDay);
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        title: Text(value[index].toString()),
                      ),
                    );
                    },
                    );
                  },
                )
              ),


            //   Container(
            //     color: Colors.blue,
            //     child: Center(child: Text('Item 2')),
            //   ),
            //   Container(
            //     color: Colors.green,
            //     child: Center(child: Text('Item 3')),
            //   ),
            //   Container(
            //     color: Colors.orange,
            //     child: Center(child: Text('Item 4')),
            //   ),
            ]
          );
  }


}
