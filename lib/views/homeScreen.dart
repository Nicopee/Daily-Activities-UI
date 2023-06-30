import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Good morning \n Nicholas',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: Constants.whiteBg),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 80.h,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.whiteBg,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.w),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.thumb_up_alt_sharp,
                      color: Constants.yellowColor,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'High five!',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          'You can finish over 80% of your \n activities each day.',
                          style: GoogleFonts.montserrat(),
                        )
                      ],
                    ),
                    Container(
                      height: 30.h,
                      width: 30.h,
                      decoration: const BoxDecoration(
                          color: Constants.yellowColor, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          'ok',
                          style:
                              GoogleFonts.montserrat(color: Constants.whiteBg),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Completion\nTracker',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w600,
                            color: Constants.whiteBg),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'You completed 2 of 4 \n activities so far',
                      style: GoogleFonts.montserrat(color: Constants.whiteBg),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      height: 100.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.w,
                          color: Constants.whiteBg,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "50%",
                          style: GoogleFonts.montserrat(
                            color: Constants.whiteBg,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Activities",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w600,
                        color: Constants.whiteBg),
                  ),
                ),
                Container(
                  height: 25.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.sp)),
                      border: Border.all(color: Constants.yellowColor)),
                  child: Center(
                    child: Text(
                      'add',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Constants.yellowColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Theme(
                data: ThemeData(
                  canvasColor: Colors.yellow,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Colors.green,
                        background: Colors.red,
                        secondary: Colors.green,
                      ),
                ),
                child: Stepper(
                  controlsBuilder: (context, controller) {
                    return const SizedBox.shrink();
                  },
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_index <= 0) {
                      setState(() {
                        _index += 1;
                      });
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  steps: <Step>[
                    Step(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '08:00 am',
                            style: GoogleFonts.montserrat(
                                color: Constants.whiteBg),
                          ),
                          const Icon(Icons.more_horiz, color: Constants.whiteBg)
                        ],
                      ),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Medidate for 10mins with the Calm app before breakfast',
                          style:
                              GoogleFonts.montserrat(color: Constants.whiteBg),
                        ),
                      ),
                    ),
                    Step(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '10:15 am',
                            style: GoogleFonts.montserrat(
                                color: Constants.whiteBg),
                          ),
                          const Icon(Icons.more_horiz, color: Constants.whiteBg)
                        ],
                      ),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Team meeting on research deck for the x project due this friday.',
                          style:
                              GoogleFonts.montserrat(color: Constants.whiteBg),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
