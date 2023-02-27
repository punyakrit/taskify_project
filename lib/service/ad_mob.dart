import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1567175925424561/1176193139";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1567175925424561/1069231988";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static final BannerAdListener bannerListner = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad Loaded.'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (ad) => debugPrint('ad opened'),
    onAdClosed: (ad) => debugPrint('ad closed'),
  );
}
