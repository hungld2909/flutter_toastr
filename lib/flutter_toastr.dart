library flutter_toastr;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlutterToastr {
  static final int lengthShort = 1;
  static final int lengthLong = 2;
  static final int bottom = 0;
  static final int center = 1;
  static final int top = 2;

  static void show(String msg, BuildContext context,
      {int? duration = 1,
        int? gravity = 0,
        Color backgroundColor = const Color(0xAA000000),
        textStyle = const TextStyle(fontSize: 15, color: Colors.white),
        double backgroundRadius = 20,
        bool? rootNavigator,
        Border? border}) {
    FlutterToastrView.dismiss();
    FlutterToastrView.createView(msg, context, duration, gravity, backgroundColor,
        textStyle, backgroundRadius, border, rootNavigator);
  }
}

class FlutterToastrView {
  static final FlutterToastrView _singleton = new FlutterToastrView._internal();

  factory FlutterToastrView() {
    return _singleton;
  }

  FlutterToastrView._internal();

  static OverlayState? overlayState;
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void createView(
      String msg,
      BuildContext context,
      int? duration,
      int? gravity,
      Color background,
      TextStyle textStyle,
      double backgroundRadius,
      Border? border,
      bool? rootNavigator) async {
    overlayState = Overlay.of(context, rootOverlay: rootNavigator??false);

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => FlutterToastrWidget(
          widget: Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(backgroundRadius),
                    border: border,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: Text(msg, softWrap: true, style: textStyle),
                )),
          ),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState!.insert(_overlayEntry!);
    await new Future.delayed(
        Duration(seconds: duration == null ? FlutterToastr.lengthShort : duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class FlutterToastrWidget extends StatelessWidget {
  FlutterToastrWidget({
    Key? key,
    required this.widget,
    required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int? gravity;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: gravity == 2 ? MediaQuery.of(context).viewInsets.top + 50 : null,
        bottom: gravity == 0 ? MediaQuery.of(context).viewInsets.bottom + 50 : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}
