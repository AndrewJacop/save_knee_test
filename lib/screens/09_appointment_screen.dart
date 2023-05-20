import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

int timeCounter = 1;
int rmndCounter = 1;

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
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
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      MaterialButton(
                          padding: EdgeInsets.zero,
                          minWidth: 30,
                          height: 30,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Colors.white,
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 15,
                          )),
                      Text(
                        'Appointment',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.indigo, Colors.white],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.18, 0.18])),
                      child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          firstDayOfWeek: 6,
                          selectedDayHighlightColor: Colors.indigo,
                        ),
                        value: [],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.42,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Available Time'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.width * 0.15,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: availableTimes.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          timeCounter = index;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.indigo,
                                        radius: 32,
                                        child: CircleAvatar(
                                          backgroundColor: timeCounter == index
                                              ? Colors.indigo
                                              : Colors.white,
                                          foregroundColor: timeCounter == index
                                              ? Colors.white
                                              : Colors.indigo,
                                          radius: 30,
                                          child: Text(
                                            availableTimes[index],
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text('Remind Me Before'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.width * 0.15,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: remindTimes.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          rmndCounter = index;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.indigo,
                                        radius: 32,
                                        child: CircleAvatar(
                                          backgroundColor: rmndCounter == index
                                              ? Colors.indigo
                                              : Colors.white,
                                          foregroundColor: rmndCounter == index
                                              ? Colors.white
                                              : Colors.indigo,
                                          radius: 30,
                                          child: Text(
                                            remindTimes[index],
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () =>
                                    _onAlertWithCustomImagePressed(context),
                                child: Text('Confirm'))
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

void _onAlertWithCustomImagePressed(context) {
  Alert(
    context: context,
    title: "Thank You!",
    desc:
    "You booked and appointment with Dr Ali, medical, on DATE at ${availableTimes}\n You will be reminded",
    image: Image.asset("assets/images/like.png"),
  ).show();
}
