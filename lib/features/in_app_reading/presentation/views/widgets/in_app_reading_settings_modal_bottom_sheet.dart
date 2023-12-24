import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/assets_constants.dart';
import '../../../../../core/themes/custom_colors.dart';

showInAppReadingSettingsModalBottomSheet({
  required BuildContext context,
  required double pdfZoomLevel,
  required Function(double newZoomLevel) onZoomLevelChanged,
  required DeviceOrientation deviceOrientation,
  required Function(DeviceOrientation newOrientation) onOrientationChanged,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white.withOpacity(0),
    isScrollControlled: true,
    elevation: 0,
    builder: (_) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            color: Colors.white.withOpacity(0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.setRadius(24)),
                  topRight: Radius.circular(context.setRadius(24)),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.setHeight(8)),
                  Container(
                    height: context.setHeight(8),
                    width: context.setWidth(63),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        context.setRadius(4),
                      ),
                      color: CustomColors.textColorAlmostBlack.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(height: context.setHeight(30)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Slider(
                      value: pdfZoomLevel,
                      min: 1.0,
                      max: 3.0,
                      onChanged: (double newZoomLevel) {
                        setState(() {
                          pdfZoomLevel = newZoomLevel;
                        });
                        onZoomLevelChanged(pdfZoomLevel);
                      },
                    ),
                  ),
                  SizedBox(height: context.setHeight(30)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Slider(
                      value: pdfZoomLevel,
                      min: 1.0,
                      max: 3.0,
                      onChanged: (double newZoomLevel) {
                        setState(() {
                          pdfZoomLevel = newZoomLevel;
                        });
                        onZoomLevelChanged(pdfZoomLevel);
                      },
                    ),
                  ),
                  SizedBox(height: context.setHeight(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onOrientationChanged(
                            DeviceOrientation.portraitUp,
                          );
                          setState(() {
                            deviceOrientation = DeviceOrientation.portraitUp;
                          });
                        },
                        child: Container(
                          height: context.setHeight(70),
                          width: context.setHeight(70),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: deviceOrientation ==
                                    DeviceOrientation.portraitUp
                                ? CustomColors
                                    .inAppReadingSettingsModalBottomSheetPhoneBackgroundColor
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AssetsConstants.phoneVerticalImage,
                              height: context.setHeight(50),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      GestureDetector(
                        onTap: () {
                          onOrientationChanged(
                            DeviceOrientation.landscapeRight,
                          );
                          setState(() {
                            deviceOrientation =
                                DeviceOrientation.landscapeRight;
                          });
                        },
                        child: Container(
                          height: context.setHeight(70),
                          width: context.setHeight(70),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: deviceOrientation ==
                                    DeviceOrientation.landscapeRight
                                ? CustomColors
                                    .inAppReadingSettingsModalBottomSheetPhoneBackgroundColor
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AssetsConstants.phoneHorizontalImage,
                              width: context.setHeight(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.setHeight(30)),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
