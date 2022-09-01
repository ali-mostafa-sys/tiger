import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_review/in_app_review.dart';

part 'ads_and_rate_event.dart';
part 'ads_and_rate_state.dart';

class AdsAndRateBloc extends Bloc<AdsAndRateEvent, AdsAndRateState> {
  static AdsAndRateBloc get(context)=>BlocProvider.of(context);
   int maxFailedLoadAttempts = 3;
  InterstitialAd? _interstitialAd;
  int _interstitialLoadAttempts = 0;


  // here for initialize ads
  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AddHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),

    );
  }

  // here for run ads
 Future <void> _showInterstitialAd()async {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },

      );
      _interstitialAd!.show();
    }
  }


 // here for rate
  void _openAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {

      /// NOTE: use this SPARINGLY -> restricted by quota
      /// triggers the In-App Review prompt
      //inAppReview.requestReview();

      /// NOTE: NOT restricted by quota
      ///
      /// opens:
      /// - Google Play Store on Android,
      /// - App Store with a review screen on IOS & MacOS
      /// - Microsoft Store on Windows.
      ///
      /// Use this if you want to permanently provide a button or other
      /// call-to-action to let users leave a review
      ///
      /// appStoreId is only required on IOS and MacOS and can be found in
      /// App Store Connect under General > App Information > Apple ID.
      ///   exp: https://apps.apple.com/app/app-name/id1111111111
      ///     -> id: id1111111111
      ///
      /// microsoftStoreId is only required on Windows:
      ///   exp: https://www.microsoft.com/store/apps/<microsoftStoreId>
      inAppReview.openStoreListing(
        appStoreId: '...',
        microsoftStoreId: '...',
      );
    }
  }
  AdsAndRateBloc() : super(AdsAndRateInitial()) {



    on<AdsAndRateEvent>((event, emit) {
     if(event is RateEvent){
       emit(RateState());
       _openAppReview();

     }
     if(event is InitializeAdsEvent){
       emit(InitializeAdsState());
       _createInterstitialAd();
     }
     if(event is ShowAdsEvent){
       emit(ShowAdsState());
       _showInterstitialAd().then((value) {
         _interstitialAd!.dispose();
       });
     }
    });
  }
}

class AddHelper{
  static String get interstitialAdUnitId {
    if(Platform.isAndroid){
      return "ca-app-pub-3940256099942544/8691691433";
    } else {
      throw UnsupportedError('Un Supported Platform');
    }
  }
}
