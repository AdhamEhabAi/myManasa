import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/core/managers/pdf_cubit/pdf_cubit.dart';
import 'package:my_manasa/features/myCourses/presentation/views/widgets/my_courses_pdf_course_widget.dart';

class MyCoursesPdfView extends StatelessWidget {
  const MyCoursesPdfView({super.key, required this.courseId});
  final String courseId;
  @override
  Widget build(BuildContext context) {
    // Fetch PDFs using PdfCubit for a specific courseId (1538)
    BlocProvider.of<PdfCubit>(context).fetchPDFS(courseId: courseId);

    return BlocBuilder<PdfCubit, PdfState>(
      builder: (context, state) {
        if (state is PdfLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PdfFail) {
          return Center(child: Text(state.errMessage));
        } else if (state is PdfSuccess) {
          final pdfs = state.pdfs;
          return ListView.separated(
            itemBuilder: (context, index) {
              final pdf = pdfs[index];
              return MyCoursesPdfCourseWidget(pdf: pdf);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: pdfs.length,
          );
        } else if (state is PdfEmpty) {
          return const Center(child: Text('لا توجد ملفات PDF متاحة.'));
        } else {
          return const Center(child: Text('حدث خطأ غير متوقع.'));
        }
      },
    );
  }
}
