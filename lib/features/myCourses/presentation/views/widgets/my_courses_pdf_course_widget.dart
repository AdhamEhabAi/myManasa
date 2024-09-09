import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:my_manasa/core/widgets/toast_m.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/myCourses/data/models/pdf_model.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:intl/intl.dart';  // Import to format the date

class MyCoursesPdfCourseWidget extends StatelessWidget {
  const MyCoursesPdfCourseWidget({super.key, required this.pdf});
  final PdfModel pdf;

  Future<void> _downloadPdf(BuildContext context) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${pdf.url}';

      final pdfUrl = '${APIEndpoints.pdfPath}${pdf.url}';

      // Download the PDF using Dio
      Dio dio = Dio();
      await dio.download(pdfUrl, filePath);

      // Show success toast
      ToastM.show('تم تنزيل ${pdf.name} بنجاح!');
    } catch (e) {
      // Show error toast
      ToastM.show('حدث خطأ أثناء تنزيل ${pdf.name}: $e');
    }
  }

  String _formatDate(String date) {
    // Convert string to DateTime and format it
    try {
      final dateTime = DateTime.parse(date);
      return DateFormat('yyyy-MM-dd HH:mm').format(dateTime); // Change format as needed
    } catch (e) {
      return date; // Return the original string if parsing fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 4.5,
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Image.asset(
                'assets/images/Pdf.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pdf.name,
                  style: Styles.bold16,
                ),
                Text(
                  _formatDate(pdf.date),  // Display formatted date
                  style: Styles.semiBold10,
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.download),  // Use download icon
              onPressed: () => _downloadPdf(context),  // Trigger download on tap
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
