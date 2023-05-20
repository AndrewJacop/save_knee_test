import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  DateTime today = DateTime.now();
  List<Widget>myList=[
    CustomCircle("10:00", "AM"),
    CustomCircle("12:00", "AM"),
    CustomCircle("2:00", "pM"),
    CustomCircle("3:00", "pM"),
    CustomCircle("4:00", "pM"),
  ];
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                    Color(0xFFc5cae9),
                    Color(0xffD4CFC8),
                    // Color(0xFF7986cb),
                    Color(0xFFdcf4ff),
                    Color(0xffced5e8),
                    Color(0xFFc5cae9),
                    Color(0xFFc5cae9),
                  ])),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.grey,
                      size: 30,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Appointment",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
              /*top:MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width*0.3,*/

              child: Column(
                children: [
                  Container(
                    //color: Colors.white,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: TableCalendar(
                      headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            //(0xff0E0074),
                            // Color(0xFF0e0074),
                            //Colors.cyan.shade900,
                            //Color(0xFF00174d),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          //leftChevronPadding: EdgeInsets.only(left: 50),
                          titleTextStyle: TextStyle(
                            color: Colors.white,
                          )),
                      calendarStyle: CalendarStyle(),
                      focusedDay: today,
                      firstDay: DateTime.utc(2023),
                      lastDay: DateTime.utc(2030),
                      onDaySelected: _onDaySelected,
                      selectedDayPredicate: (day) => isSameDay(day, today),
                    ),
                  ),
                  Positioned(
                    bottom: 0,


                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Avalable Time",
                                style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                              ),
                            ),
                            Container(
                              //height: 200,
                              height: MediaQuery.of(context).size.height*0.2,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: myList.length,
                                  itemBuilder: (context, index) {
                                return myList[index];
                                  //CustomCircle("10:00", "AM"),
                              }),
                            ),
                            ElevatedButton(onPressed: (){},

                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff3E1E82),
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    minimumSize: Size(100, 60)
                                ),
                                child: Text("Login")
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget CustomCircle(String text1, String text2) {
  return Padding(
    padding: const EdgeInsets.all(6),
    child: CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xffEAEAEA),
      //Color(0xffcccccc),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                  color: Color(0xff7DBC20),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),

            ),
            Text(
              text2,
              style: TextStyle(
                  color: Color(0xff0cd6e5),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),

            )
          ],
        ),
      ),
    ),
  );
}
