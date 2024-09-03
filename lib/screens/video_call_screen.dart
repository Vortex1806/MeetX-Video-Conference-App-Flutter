import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:meetx/resources/auth_methods.dart';
import 'package:meetx/resources/firestore_methods.dart';
import 'package:meetx/resources/jitsi_meet_methods.dart';
import 'package:meetx/utils/colors.dart';
import 'package:meetx/widgets/custom_button.dart';
import 'package:meetx/widgets/meeting_options.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  bool isAudioMute = true;
  bool isVideoMute = true;
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  @override
  void initState() {
    // TODO: implement initState
    meetingIdController = TextEditingController();
    nameController =
        TextEditingController(text: _authMethods.user!.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
        roomName: meetingIdController.text,
        isAudioMute: isAudioMute,
        isVideoMute: isVideoMute,
        name: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Join a Meeting",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: TextField(
                controller: meetingIdController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Room Id",
                  // contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: TextField(
                controller: nameController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Name",
                  // contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(onPressed: _joinMeeting, text: "Join"),
            const SizedBox(
              height: 20,
            ),
            MeetingOptions(
              text: "Mute Audio",
              isMute: isAudioMute,
              onChanged: onAudioMuted,
            ),
            MeetingOptions(
              text: "Mute Video",
              isMute: isVideoMute,
              onChanged: onVideoMuted,
            ),
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool p1) {
    setState(() {
      isAudioMute = p1;
    });
  }

  onVideoMuted(bool p1) {
    setState(() {
      isVideoMute = p1;
    });
  }
}
