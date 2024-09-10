import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/core/managers/pdf_cubit/pdf_cubit.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/pdf_course_widget.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';

class PdfView extends StatelessWidget {
  const PdfView({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PdfCubit>(context).fetchPDFS(courseId: courseModel.id);

    return BlocBuilder<PdfCubit, PdfState>(
      builder: (context, state) {
        if (state is PdfLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PdfFail) {
          return Center(child: Text(state.errMessage,style: Styles.semiBold20,));
        } else if (state is PdfSuccess) {
          final pdfs = state.pdfs;
          return ListView.separated(
            itemBuilder: (context, index) {
              final pdf = pdfs[index];
              return PdfCourseWidget(pdfModel: pdf);
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: pdfs.length,
          );
        } else if (state is PdfEmpty) {  // Handle the PdfEmpty state
          return Center(child: Text('لا توجد ملفات PDF متاحة.', style: Styles.semiBold20,) );
        } else {
          return const Center(child: Text('حدث خطأ غير متوقع.'));
        }
      },
    );
  }
}
