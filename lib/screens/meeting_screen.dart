import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meetx/resources/jitsi_meet_methods.dart';
import 'package:meetx/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(1000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMute: true, isVideoMute: true);
  }

  void joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: createNewMeeting,
                icon: Icons.videocam,
                text: "New Meet",
              ),
              HomeMeetingButton(
                onPressed: () => joinMeeting(context),
                icon: Icons.add_box_rounded,
                text: "Join Meet",
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: "Schedule",
                icon: Icons.calendar_today,
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: "Share Screen",
                icon: Icons.arrow_upward_rounded,
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Create Or Join Meet",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
