# flutter_toastr

Flutter Toastr is a Flutter package for non-blocking notifications. You can show toast message at any position of your app and at any duration length.

## Installation

``` flutter pub add flutter_toastr ```

or


```
dependencies:
  flutter_toastr: ^1.0.3

```

```
import 'package:flutter_toastr/flutter_toastr.dart';

  FlutterToastr.show("Flutter Toastr is a Flutter package for non-blocking notifications", context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.bottom);
```
