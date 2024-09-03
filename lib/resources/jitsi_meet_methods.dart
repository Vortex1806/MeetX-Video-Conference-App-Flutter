import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:meetx/resources/auth_methods.dart';
import 'package:meetx/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting({
    required String roomName,
    required bool isAudioMute,
    required bool isVideoMute,
    String name = '',
  }) async {
    try {
      var jitsiMeet = JitsiMeet();
      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.jit.si",
        room: roomName,
        configOverrides: {
          "subject": "Meeting Subject",
        },
        featureFlags: {"unsaferoomwarning.enabled": false},
        userInfo: JitsiMeetUserInfo(
            displayName: name.isEmpty ? _authMethods.user!.displayName : name,
            email: _authMethods.user!.email,
            avatar: _authMethods.user!.photoURL),
      );
      _firestoreMethods.addMeetingHistory(roomName);
      jitsiMeet.join(options);
      jitsiMeet.setAudioMuted(isAudioMute);
      jitsiMeet.setVideoMuted(isVideoMute);
    } catch (e) {
      print(e.toString());
    }
  }

  void toggleAudioMute(bool muted) async {
    try {
      var jitsiMeet = JitsiMeet();
      await jitsiMeet.setAudioMuted(muted);
    } catch (e) {
      print("Error toggling audio mute: $e");
    }
  }

  // Method to toggle video mute state
  void toggleVideoMute(bool muted) async {
    try {
      var jitsiMeet = JitsiMeet();
      await jitsiMeet.setVideoMuted(muted);
    } catch (e) {
      print("Error toggling video mute: $e");
    }
  }
}
