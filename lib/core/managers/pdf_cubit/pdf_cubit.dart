import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/features/myCourses/data/models/pdf_model.dart';
import 'package:my_manasa/features/myCourses/repo/pdf_repo.dart';

part 'pdf_state.dart';

class PdfCubit extends Cubit<PdfState> {
  PdfCubit(this.pdfRepo) : super(PdfInitial());
  final PdfRepo pdfRepo;

  Future<void> fetchPDFS({required String courseId}) async {
    emit(PdfLoading());

    Either<Failure, List<PdfModel>> result =
    await pdfRepo.getPdfs(courseId: courseId);

    result.fold(
          (failure) => emit(PdfFail(failure.message)),
          (pdfs) {
        if (pdfs.isEmpty) {
          emit(PdfEmpty());  // Emit PdfEmpty if the list is empty
        } else {
          emit(PdfSuccess(pdfs));  // Emit PdfSuccess if there are PDFs
        }
      },
    );
  }
}
