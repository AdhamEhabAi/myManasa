import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget(
      {required this.title, this.ontap, required this.icon, super.key});

  final String? title;
  final IconData? icon;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          alignment: Alignment.centerRight,
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 7,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.secondaryColor.withOpacity(.9),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            title: Text(title!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                )),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
