import 'package:save_knee_23/screens/08_time_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    final bodyHeight=screenHeight-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: const Color(0xffDBF3FF),
      body: ListView(
          shrinkWrap: true,
          children: [
      Row(children: [
      Padding(
      padding: EdgeInsets.only(left: 15.r),
    ),
    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12).w,
    ),
    child: IconButton(
    icon: const Icon(
    Icons.arrow_back_ios_new_outlined,
    color: Colors.black,
    ),
    onPressed: () => Navigator.of(context).pop(),
    ),
    ),
     Padding(
    padding: EdgeInsets.only(left: 50.r),
    child: Text(
    "My Doctors",
    style: TextStyle(
    color: Colors.black,
    fontSize: 25.sp,
    ),
    ),
    ),
    ]),
    Padding(
    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
    child: TextField(
    decoration: InputDecoration(
    hintText: "Search...",
    hintStyle: TextStyle(color: Colors.grey.shade600),
    prefixIcon: Icon(
    Icons.search,
    color: Colors.grey.shade600,
    size: 20,
    ),
    filled: true,
    fillColor: Colors.grey.shade100,
    contentPadding: const EdgeInsets.all(8).w,
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20).w,
    borderSide: BorderSide(color: Colors.grey.shade100)),
    ),
    ),
    ),
    const Spacer(
    flex: 2,
    ),
    MyWidget(),
    const Spacer(
    flex: 2,
    ),
    Padding(
    padding: EdgeInsets.only(left: 3.r),
    child: Container(
    height: bodyHeight*.3,
    width: screenWidth*.8,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10).w,
    ),
    child: Row(
    children: [
    Padding(
    padding: EdgeInsets.only(left: 4.r),
    child: Column(
    children: [
    Container(
    height: bodyHeight*.28,
    width: screenWidth*.15,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10).w,
    image: const DecorationImage(
    image: NetworkImage('assets/images/doctor4.png'),
    ),
    ),
    ),
    Text(
    "Next Availabilty",
    style: TextStyle(
    color: Colors.blue,
    fontSize: 20.sp,
    ),
    ),
    Row(
    children: [
     Text(
    "10:00",
    style: TextStyle(
    color: Colors.grey,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    ),
    ),
    Text("AM tomorrow",
    style: TextStyle(
    color: Colors.grey.withOpacity(0.90),
    fontSize: 16.sp,
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Dr.Mina",
    style: TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    ),
    ),
     Text(
    "Orthopedist",
    style: TextStyle(
    fontSize: 20.sp,
    color: Colors.blue,
    ),
    ),
    Text(
    "8 Years experience",
    style: TextStyle(
    fontSize: 18.sp,
    color: Colors.grey.withOpacity(0.90),
    ),
    ),
    ],
    ),
    const Spacer(
    flex: 1,
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Padding(
    padding: EdgeInsets.only(right: 16.r),
    child: Icon(
    Icons.favorite,
    color: Colors.red,
    size: 24.0,
    ),
    ),
    Padding(
    padding:  EdgeInsets.only(right: 16.r),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xff2545F9),
    minimumSize: const Size(50, 40),
    ),
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) {
    return TimeTable();
    }));
    },
    child: Text(
    "Book now",
    style: TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
    ),
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    const Spacer(
    flex: 2,
    ),
    Padding(
    padding: EdgeInsets.only(left: 3.r),
    child: Container(
    height: bodyHeight*.3,
    width: screenWidth*.8,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10).w,
    ),
    child: Row(
    children: [
    Padding(
    padding: EdgeInsets.only(left: 4.r),
    child: Column(
    children: [
    Container(
    height: bodyHeight*.28,
    width: screenWidth*.15,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10).w,
    image: const DecorationImage(
    image: NetworkImage('assets/images/doctor3.png'),
    ),
    ),
    ),
    Text(
    "Next Availabilty",style: TextStyle(
      color: Colors.blue,
      fontSize: 20.sp,
    ),
    ),
      Row(
        children: [
           Text(
            "10:00",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "AM tomorrow",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.90),
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    ],
    ),
    ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Dr.Aya",
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Orthopedist",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.blue,
            ),
          ),
          Text(
            "7 Years experience",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey.withOpacity(0.90),
            ),
          ),
        ],
      ),
      const Spacer(
        flex: 1,
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.r),
              child: Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 24.0,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: 16.r),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2545F9),
                  minimumSize: const Size(50, 40),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return TimeTable();
                      }));
                },
                child:  Text(
                  "Book now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ]),
    ],
    ),
    ),
    ),
            const Spacer(
              flex: 3,
            ),
          ],
      ),
    );
  }
}
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    final bodyHeight=screenHeight-MediaQuery.of(context).padding.top;

    return Padding(
        padding: const EdgeInsets.all(20).w,
    child: Container(
    height: bodyHeight*.3,
    width: screenWidth*.8,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15).w,
    ),
    child: Padding(
    padding: const EdgeInsets.all(20).w,
    child: Row(
    children: [
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Container(
    height: bodyHeight*.15,
    width: screenWidth*.15,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10).w,
    image: const DecorationImage(
    image: NetworkImage('assets/images/doctor2.png'),
    fit: BoxFit.fill),
    ),
    ),
     Text(
    "Next Availabilty",
    style: TextStyle(
    color: Colors.blue,
    fontSize: 20.sp,
    ),
    ),
    Row(
    children: [
     Text(
    "10:00",
    style: TextStyle(
    color: Colors.grey,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    ),
    ),
    Text(
    "AM tomorrow",
    style: TextStyle(
    color: Colors.grey.withOpacity(0.90),
    fontSize: 16.sp,
    ),
    ),
    ],
    ),
    ],
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     Text(
    "Dr.Mona",
    style: TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    ),
    ),
     Text(
    "Orthopedist",
    style: TextStyle(
    fontSize: 20.sp,
    color: Colors.blue,
    ),
    ),
    Text(
    "6 Years experience",
    style: TextStyle(
    fontSize: 18.sp,
    color: Colors.grey.withOpacity(0.90),
    ),
    ),
    ],
    ),
    const Spacer(
    flex: 1,
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
     Padding(
    padding: EdgeInsets.only(right: 16.r),
    child: Icon(
    Icons.favorite,
    color: Colors.grey,
    size: 24.0,
    ),
    ),
    Padding(
    padding:  EdgeInsets.only(right: 16.r),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xff2545F9),
    minimumSize: const Size(50, 40),
    ),
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) {
    return TimeTable();
    }));
    },
    child:  Text(
    "Book now",
    style: TextStyle(
    color: Colors.white,fontSize: 18.sp,
    ),
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    );
  }
}