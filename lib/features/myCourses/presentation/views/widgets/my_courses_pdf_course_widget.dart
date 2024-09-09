import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_manasa/core/widgets/toast_m.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/myCourses/data/models/pdf_model.dart';
import 'package:intl/intl.dart';

class MyCoursesPdfCourseWidget extends StatelessWidget {
  const MyCoursesPdfCourseWidget({super.key, required this.pdf});
  final PdfModel pdf;

  Future<void> _downloadPdf(BuildContext context) async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      final directory = await getExternalStorageDirectory();

      if (directory != null) {
        final taskId = await FlutterDownloader.enqueue(
          url: 'https://beta.aminyoussef.com/upload/pdf/${pdf.url}',
          savedDir: directory.path,
          fileName: pdf.url,
          showNotification: true,
          openFileFromNotification: true,
        );

        if (taskId != null) {
          // Show success toast
          ToastM.show('تم تنزيل ${pdf.name} بنجاح!');
        }
      } else {
        // Show error toast
        ToastM.show('لم يتم العثور على الدليل للتخزين.');
      }
    } else {
      // Show error toast for permission denied
      ToastM.show('تم رفض إذن الوصول إلى التخزين.');
    }
  }

  String _formatDate(String date) {
    try {
      final dateTime = DateTime.parse(date);
      return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    } catch (e) {
      return date;
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
                  _formatDate(pdf.date),
                  style: Styles.semiBold10,
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () => _downloadPdf(context),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
