import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';

class PDFViewerController extends GetxController {
  final String docUrl;
  final String docName;

  PDFViewerController({required this.docUrl, required this.docName});

  var localPath = ''.obs;
  var isLoading = true.obs;
  var pages = 0.obs;
  var currentPage = 0.obs;
  PDFViewController? pdfViewController;

  @override
  void onInit() {
    super.onInit();
    downloadAndSavePdf();
  }

  Future<void> downloadAndSavePdf() async {
    try {
      final response = await http.get(Uri.parse(docUrl));
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$docName');
      await file.writeAsBytes(response.bodyBytes, flush: true);
      localPath.value = file.path;
    } catch (e) {
      print('Error downloading PDF: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
