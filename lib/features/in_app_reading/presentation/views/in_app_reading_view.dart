import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/features/in_app_reading/presentation/views/widgets/in_app_reading_settings_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/themes/custom_colors.dart';

class InAppReadingView extends StatefulHookWidget {
  const InAppReadingView({super.key});

  @override
  State<InAppReadingView> createState() => _InAppReadingViewState();
}

class _InAppReadingViewState extends State<InAppReadingView> {
  late PdfViewerController _pdfViewerController;
  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    // ]);
  }

  @override
  void dispose() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    _pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPdfLoaded = useState(false);
    final isPdfLoadFailed = useState(false);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            if (isPdfLoadFailed.value) ...[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      size: context.setHeight(200),
                      color:
                          CustomColors.textColorAlmostBlack.withOpacity(0.25),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.setWidth(30),
                      ),
                      child: Text(
                        "Error loading this book",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: CustomColors.textColorAlmostBlack
                                  .withOpacity(0.25),
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (!isPdfLoaded.value && !isPdfLoadFailed.value) ...[
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
            Opacity(
              opacity: isPdfLoaded.value ? 1 : 0,
              child: Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: TextSelectionThemeData(
                    selectionColor: const Color(0xFF00FF81).withOpacity(0.5),
                  ),
                ),
                child: SfPdfViewer.network(
                  'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                  controller: _pdfViewerController,
                  pageSpacing: 0,
                  canShowPaginationDialog: false,
                  onDocumentLoadFailed: (_) {
                    isPdfLoadFailed.value = true;
                  },
                  onDocumentLoaded: (_) {
                    isPdfLoaded.value = true;
                  },
                  onTextSelectionChanged: (details) {
                    if (details.selectedText == null && _overlayEntry != null) {
                      _overlayEntry!.remove();
                      _overlayEntry = null;
                    } else if (details.selectedText != null &&
                        _overlayEntry == null) {
                      _showContextMenu(context, details);
                    }
                  },
                ),
              ),
            ),
            Opacity(
              opacity: isPdfLoaded.value ? 1 : 0,
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: CustomColors.textColorAlmostBlack,
                    ),
                    onPressed: () {
                      _pdfViewerController.clearSelection();
                      showInAppReadingSettingsModalBottomSheet(
                        context: context,
                        onClick: (value) {
                          print(value);
                          
                          setState(() {
                            _pdfViewerController.zoomLevel = value;
                          });
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - context.setHeight(60),
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(context.setHeight(50), context.setHeight(38)),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF303030),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  context.setRadius(10),
                ),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'Copy',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: details.selectedText!));
            _pdfViewerController.clearSelection();
          },
        ),
      ),
    );
    overlayState.insert(_overlayEntry!);
  }
}
