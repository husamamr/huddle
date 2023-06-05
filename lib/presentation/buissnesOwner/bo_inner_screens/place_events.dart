import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late double screenHeight;
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        itemCount:5,
        itemBuilder: (context, index) {
          return Container(
            width: screenWidth * 0.7,
            margin: const EdgeInsets.only(
                top: 10.0, bottom: 10, left: 20, right: 20),
            child: createEventCard(
              eventName: 'Flutter Meetup',
              startTime: DateTime.now(),
              endTime: DateTime.now().add(const Duration(hours: 2)),
              about:
              'This is a Flutter meetup where developers gather to discuss Flutter and share their experiences. It is open to all Flutter enthusiasts.',
            ),
          );
        },
      ),
    );
  }


  Widget createEventCard({
    required String eventName,
    required DateTime startTime,
    required DateTime endTime,
    required String about
  }){
    return Container(
      constraints: const BoxConstraints.expand(height: 200),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                          onTap: (){},
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: const Offset(-0.5, 2),
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 16,
                              backgroundColor: Color(0xffC72239),
                              child: Center(
                                child: Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${_formatTime(startTime)} - ${_formatTime(endTime)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${_formatDate(startTime)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff900C3F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        about,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

}
