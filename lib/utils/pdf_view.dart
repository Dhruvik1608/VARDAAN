import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:vardaan/utils/controller/pdf_view_controller.dart';

class PDFViewerPage extends StatelessWidget {
  final String docUrl;
  final String docName;

  PDFViewerPage({required this.docUrl, required this.docName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      PDFViewerController(docUrl: docUrl, docName: docName),
    );

    return Scaffold(
      appBar: AppBar(title: Text(docName)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.localPath.isEmpty) {
          return const Center(child: Text('Failed to load PDF'));
        } else {
          return PDFView(
            filePath: controller.localPath.value,
            autoSpacing: true,
            enableSwipe: true,
            swipeHorizontal: false,
            onRender: (pages) {
              controller.pages.value = pages ?? 0;
            },
            onViewCreated: (vc) {
              controller.pdfViewController = vc;
            },
            onPageChanged: (page, total) {
              controller.currentPage.value = page ?? 0;
            },
          );
        }
      }),
    );
  }
}
