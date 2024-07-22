import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';


class MasterProfileWidget extends StatelessWidget {
  const MasterProfileWidget({
    required this.icon,
    required this.title,
    this.subTitle,
    this.onTap,
    super.key,
  });

  final String? subTitle;
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          alignment: Alignment.center, // Center the child within the container
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 5,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.secondaryColor,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            title: Text(
              title,
              style: Styles.regular20,
            ),
            subtitle: Text(
              subTitle!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
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
