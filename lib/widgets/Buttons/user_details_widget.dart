import 'package:app_template/data/constants.dart';
import 'package:flutter/material.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
    this.onTap,
  });

  final String firstName;
  final String lastName;
  final String email;
  final ImageProvider<Object>? avatar;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => print("Test"),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: avatar,
              ),
              SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$firstName $lastName", style: MainTextStyle.titleText),
                  Text(email, style: MainTextStyle.descriptionText),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
