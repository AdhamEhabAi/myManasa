part of 'pdf_cubit.dart';

@immutable
sealed class PdfState {}

final class PdfInitial extends PdfState {}
final class PdfLoading extends PdfState {}
final class PdfFail extends PdfState {
  final String errMessage;

  PdfFail(this.errMessage);
}
final class PdfSuccess extends PdfState {
  final List<PdfModel> pdfs;

  PdfSuccess(this.pdfs);
}
final class PdfEmpty extends PdfState {}
