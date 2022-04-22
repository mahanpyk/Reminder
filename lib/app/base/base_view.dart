import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reminder/app/theme/app_colors.dart';

abstract class BaseView extends GetView {
  BaseView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  PreferredSizeWidget? appBar(BuildContext context) => null;

  bool safeArea() => true;

  bool resizeToAvoidBottomInset() => false;

  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [annotatedRegion(context), Container()],
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: pageBackgroundColor(),
        key: globalKey,
        appBar: appBar(context),
        body: pageContent(context),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      ),
    );
  }

  Widget pageContent(BuildContext context) {
    return Stack(children: [
      safeArea() ? SafeArea(child: body(context)) : body(context),
      Obx(
        () => progressIndicator().value
            ? const Center(child: CircularProgressIndicator())
            : Container(),
      ),
    ]);
  }

  Color pageBackgroundColor() => AppColors.background;

  Color statusBarColor() => Colors.white;

  RxBool progressIndicator() => false.obs;
}
