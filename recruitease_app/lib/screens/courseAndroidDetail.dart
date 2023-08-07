import 'package:recruitease_app/widgets/app_export.dart';
import 'package:flutter/material.dart';
import 'package:recruitease_app/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class CourseAndroidScreen extends StatelessWidget {
  CourseAndroidScreen({Key? key}) : super(key: key);

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
                        imagePath: ImageConstant.image1,
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
                            // CustomImageView(
                            //   svgPath: ImageConstant.imgArrowleft,
                            //   height: getSize(24),
                            //   width: getSize(24),
                            //   alignment: Alignment.topLeft,
                            //   onTap: () {
                            //     onTapImgArrowleft(context);
                            //   },
                            // ),
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
                  "Web Development",
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
                    "This course is designed to start you on a path toward future studies in web development and design, no matter how little experience or technical knowledge you currently have. The web is a very big place, and if you are the typical internet user, you probably visit several websites every day, whether for business, entertainment or education. But have you ever wondered how these websites actually work? How are they built? How do browsers, computers, and mobile devices interact with the web? What skills are necessary to build a website? With almost 1 billion websites now on the internet, the answers to these questions could be your first step toward a better understanding of the internet and developing a new set of internet skills.  ",
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPlusJakartaSansRomanRegular13,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Displayed fields in text format with prefix icons
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
