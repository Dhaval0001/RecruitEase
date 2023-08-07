import 'package:recruitease_app/widgets/app_export.dart';
import 'package:recruitease_app/widgets/custom_button.dart';
import 'package:recruitease_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CourseCrpytoScreen extends StatelessWidget {
  CourseCrpytoScreen({Key? key}) : super(key: key);

  TextEditingController weekscounterController = TextEditingController();
  TextEditingController languageController = TextEditingController();

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
                            CustomImageView(
                              svgPath: ImageConstant.imgIconplay,
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
                            // CustomImageView(
                            //   imagePath: ImageConstant.imgIconplay,
                            //   height: getSize(128),
                            //   width: getSize(128),
                            //   alignment: Alignment.center,
                            //   margin: getMargin(top: 74),
                            // ),
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
                  "AI algorithms for Gaming",
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
                    "In 1997, an IBM computer named Deep Blue beat Gerry Kasparov, a world chess champion, after a six-game match. While AI technology has grown in exciting, and often revolutionary, ways since Deep Blue's victory at the chessboard in the late 90s, many of the techniques it implemented are still relevant today. In this course, explore some of these techniques as you learn how to leverage key AI algorithms to create two-player, turn-based games that are challenging enough to keep players guessing. Instructor Eduardo Corpeño covers using the minimax algorithm for decision-making, the iterative deepening algorithm for making the best possible decision by a deadline, and alpha-beta pruning to improve the running time, among other clever approaches. Plus, he gives you a chance to try out these techniques yourself as he steps through the development of a cat trap game using Python.",
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPlusJakartaSansRomanRegular13,
                  ),
                ),
              ),
              /*Container(
                margin: getMargin(left: 24, top: 4),
                padding: getPadding(left: 15, top: 10, right: 19, bottom: 10),
                decoration: AppDecoration.fillWhiteA700,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgClock,
                      height: getSize(20),
                      width: getSize(20),
                      margin: getMargin(top: 2, bottom: 2),
                    ),
                    Padding(
                      padding: getPadding(left: 20, top: 13, right: 28),
                      child: Text(
                        "25 Lessons",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansRomanRegular14,
                      ),
                    ),
                  ],
                ),
              ), */
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