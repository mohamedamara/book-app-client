import 'package:books_app_client/core/constants/assets_constants.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:lottie/lottie.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../core/themes/custom_colors.dart';

class InAppReadingView extends StatefulWidget {
  const InAppReadingView({super.key});

  @override
  State<InAppReadingView> createState() => _InAppReadingViewState();
}

class _InAppReadingViewState extends State<InAppReadingView> {
  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: TextSelectionThemeData(
              selectionColor:
                  CustomColors.pdfTextSelectionColor.withOpacity(0.5),
            ),
          ),
          child: SafeArea(
            child: const PDF(
              swipeHorizontal: false,
              pageFling: false,
              fitEachPage: false,
              autoSpacing: false,
              pageSnap: false,
              fitPolicy: FitPolicy.WIDTH,
            ).cachedFromUrl(
              'https://beq.ebooksgratuits.com/vents/Hugo-miserables-1.pdf',
              placeholder: (progress) => Center(
                child: Lottie.asset(
                  AssetsConstants.bookLoadingLottieAnimation,
                  width: context.setHeight(200),
                  height: context.setHeight(200),
                  fit: BoxFit.contain,
                ),
              ),
              errorWidget: (_) => Center(
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
            ),
          ),
        ),
      ),
    );
  }
}
