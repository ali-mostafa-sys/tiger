part of 'ads_and_rate_bloc.dart';

abstract class AdsAndRateEvent extends Equatable {
  const AdsAndRateEvent();
  @override
  List<Object> get props => [];
}

class RateEvent extends AdsAndRateEvent{
}

class InitializeAdsEvent extends AdsAndRateEvent{
}
class ShowAdsEvent extends AdsAndRateEvent{
}
