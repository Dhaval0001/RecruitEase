import 'package:recruitease_app/widgets/app_export.dart';
import 'package:flutter/material.dart';
import 'package:recruitease_app/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class CourseBlenderScreen extends StatelessWidget {
  CourseBlenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getVerticalSize(348),
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    OverflowBox(
                      maxHeight: getVerticalSize(348),
                      maxWidth: getHorizontalSize(375),
                      child: CustomImageView(
                        imagePath: ImageConstant.image2,
                        height: getVerticalSize(348),
                        width: getHorizontalSize(375),
                        radius: BorderRadius.only(
                          bottomLeft: Radius.circular(getHorizontalSize(8)),
                          bottomRight: Radius.circular(getHorizontalSize(8)),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: getPadding(left: 21, top: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgArrowleft,
                              height: getSize(24),
                              width: getSize(24),
                              alignment: Alignment.topLeft,
                              onTap: () {
                                onTapImgArrowleft(context);
                              },
                            ),
                            /*ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RouteManager.coursevideopage);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: */
                            CustomImageView(
                              imagePath: ImageConstant.imgIconplay,
                              height: getSize(128),
                              width: getSize(128),
                              alignment: Alignment.center,
                              margin: getMargin(top: 74),
                            ),
                            // ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(left: 21, top: 17),
                child: Text(
                  "Managing Innovation",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPlusJakartaSansRomanSemiBold24,
                ),
              ),
              CustomButton(
                height: getVerticalSize(40),
                width: getHorizontalSize(70),
                text: "Overview",
                margin: getMargin(left: 21, top: 10),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: getHorizontalSize(330),
                  margin: getMargin(left: 24, top: 12, right: 20),
                  child: Text(
                    "What differentiates the world's most innovative companies? And how do you execute a cutting-edge innovation initiative? This program takes a deep dive into the latest innovation tools, operating models, and business strategies used by leading companies across the globe. With new insight into innovation processes, you will be ready to take action and lead a highly creative, innovation-focused culture that can consistently deliver results. \n \n As you explore the prototyping and experimentation practices of the world's top product developers, you will lay the foundation for transforming your business and sustaining growth through innovation the moment you return to work.",
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPlusJakartaSansRomanRegular13,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: getPadding(left: 24, top: 4,bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: ColorConstant.lightBlueA400,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "25 Lessons",
                      style: AppStyle.txtPlusJakartaSansRomanRegular14,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(left: 24, top: 4,bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: ColorConstant.lightBlueA400,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "6 Weeks",
                      style: AppStyle.txtPlusJakartaSansRomanRegular14,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(left: 24, top: 4,bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: ColorConstant.lightBlueA400,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "English",
                      style: AppStyle.txtPlusJakartaSansRomanRegular14,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(left: 24, top: 4,bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.share,
                      color: ColorConstant.lightBlueA400,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Sharable Certificate",
                      style: AppStyle.txtPlusJakartaSansRomanRegular14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
