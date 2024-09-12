import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeSubjects/data/models/SubjectModel.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';

class HomeSingleSubjectWidget extends StatelessWidget {
  const HomeSingleSubjectWidget({
    super.key,
    required this.onTap,
    required this.subject,
  });

  final VoidCallback onTap;
  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 10.h,
        bottom: 10.h,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 4.r,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(17.r),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17.r),
                  topRight: Radius.circular(17.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: APIEndpoints.imgPathForSubjects + subject.logo,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) => Image.asset(
                    'assets/images/logo.png', // Placeholder image
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/logo.png', // Error image
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
