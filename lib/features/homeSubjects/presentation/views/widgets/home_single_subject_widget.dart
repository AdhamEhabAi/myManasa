import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_manasa/constants.dart';
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
        left: AppPadding.padding.w, // Match the left padding
        top: 10.h, // Match the top padding
        bottom: 10.h, // Match the bottom padding
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 4.r, // Increased blurRadius
                spreadRadius: 0, // Increased spreadRadius
              ),
            ],
            borderRadius: BorderRadius.circular(17.r),
            color: Colors.grey,
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17.r),
                    topRight: Radius.circular(17.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: APIEndpoints.imgPath + subject.logo,
                    fit: BoxFit.cover,
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
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0, // Increased spreadRadius
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(17.r),
                          bottomLeft: Radius.circular(17.r),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15.h,
                      right: 15.w,
                      child: Text(
                        subject.name,
                        style: Styles.bold20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
