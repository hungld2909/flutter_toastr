library flutter_toastr;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// the package library class for calling from client end.
class FlutterToastr {
  static final int lengthShort = 1; /// a fixed length to show toast message
  static final int lengthLong = 2; /// a fixed length to show toast message
  static final int bottom = 0; /// a fixed value for toast message position
  static final int center = 1; /// a fixed value for toast message position
  static final int top = 2; /// a fixed value for toast message position

  /// method to show the toast message
  static void show(String msg, BuildContext context,
      {int? duration = 1, /// duration : how long do you want to show the message
      int? position = 0, /// position : where do you want to show the toast message, you can pass bottom, center, top or any defined value
      Color backgroundColor = const Color(0xAA000000), /// defines the background color of toast message
      textStyle = const TextStyle(fontSize: 15, color: Colors.white), /// for toast message styling
      double backgroundRadius = 20, /// you can apply toast message background radius
      bool? rootNavigator,
      Border? border, /// you can specify background border
      }
      ) {
    FlutterToastrView.dismiss();
    FlutterToastrView.createView(msg, context, duration, position,
        backgroundColor, textStyle, backgroundRadius, border, rootNavigator);
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
      String msg, /// the message you want to show as toast
      BuildContext context,
      int? duration, /// duration : how long do you want to show the message
      int? position, /// position : where do you want to show the toast message, you can pass bottom, center, top or any defined value
      Color background, /// defines the background color of toast message
      TextStyle textStyle, /// for toast message styling
      double backgroundRadius, /// you can apply toast message background radius
      Border? border, /// you can specify background border
      bool? rootNavigator) async {
    overlayState = Overlay.of(context, rootOverlay: rootNavigator ?? false);

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
          position: position),
    );
    _isVisible = true;
    overlayState!.insert(_overlayEntry!);
    await new Future.delayed(Duration(
        seconds: duration == null ? FlutterToastr.lengthShort : duration));
    dismiss();
  }

  /// dismisses the toast message after the duration provided
  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

/// the widget to implement the toastr message
class FlutterToastrWidget extends StatelessWidget {
  FlutterToastrWidget({
    Key? key,
    required this.widget,
    required this.position,
  }) : super(key: key);

  final Widget widget;
  final int? position;

  @override
  Widget build(BuildContext context) {

    /// showing the toastr message
    return new Positioned(
        top: position == 2 ? MediaQuery.of(context).viewInsets.top + 50 : null,
        bottom:
            position == 0 ? MediaQuery.of(context).viewInsets.bottom + 50 : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}
