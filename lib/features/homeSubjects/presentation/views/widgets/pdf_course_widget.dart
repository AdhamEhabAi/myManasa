import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/myCourses/data/models/pdf_model.dart';

class PdfCourseWidget extends StatelessWidget {
  const PdfCourseWidget({
    super.key, required this.pdfModel,
  });
  final PdfModel pdfModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              // offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 2,

            )
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: MediaQuery.of(context).size.width/4.5,
                height: 60,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Image.asset(
                  'assets/images/Pdf.png',
                  fit: BoxFit.fill,
                )),
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pdfModel.name,
                  style: Styles.bold16,
                ),
                Text(
                  '35 صفحة',
                  style: Styles.semiBold10,

                ),
              ],
            ),
            CircleAvatar(
              radius: 12,
              child: Image.asset('assets/images/course icon.png',fit: BoxFit.cover,),
            ),
            const SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}
