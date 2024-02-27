import 'dart:async';

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}
