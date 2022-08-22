part of 'ads_and_rate_bloc.dart';

abstract class AdsAndRateState extends Equatable {
  const AdsAndRateState();
  @override
  List<Object> get props => [];
}

class AdsAndRateInitial extends AdsAndRateState {
  @override
  List<Object> get props => [];
}

class RateState extends AdsAndRateState{}
class InitializeAdsState extends AdsAndRateState{}
class ShowAdsState extends AdsAndRateState{}

