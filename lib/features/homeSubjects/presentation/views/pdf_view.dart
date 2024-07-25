import 'package:flutter/material.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/pdf_course_widget.dart';

class PdfView extends StatelessWidget {
  const PdfView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const PdfCourseWidget();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 4);
  }
}
