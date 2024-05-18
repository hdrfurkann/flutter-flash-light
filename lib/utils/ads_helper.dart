import 'dart:io';

class AdsHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8775541859303859/2916287541';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8775541859303859/2916287541';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8775541859303859/2901932956';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8775541859303859/2901932956';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}