import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorizedImage extends StatefulWidget {
  const AuthorizedImage({Key? key}) : super(key: key);

  @override
  _AuthorizedImageState createState() => _AuthorizedImageState();
}

class _AuthorizedImageState extends State<AuthorizedImage> {

  var access = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQyOTQ4ODkyLCJqdGkiOiIxOWMwYTQ5NTFiOTM0NTZiODQ4ZjJmOGNiMThiNTg3MyIsInVzZXJfaWQiOjIxMH0.MAoqYoZucHSl-saHtP_Ak9HAKO48esXDxuhwc4to79s";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width/2,
        child: Image.network("https://demo.jarvis.live/consumer/api/v1/thumbnail/864/", headers: { "Authorization":"Bearer " + access},),
      ),
    );
  }
}
