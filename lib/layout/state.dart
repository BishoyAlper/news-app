abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsLoadingBusinessState extends NewsStates{}

class NewsGetBusinesSucessState extends NewsStates{}

class NewsGetBusinesErrorState extends NewsStates{
  final String error;

  NewsGetBusinesErrorState(this.error);
}

class NewsLoadingSportsState extends NewsStates{}

class NewsGetSportsSucessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsLoadingScienceState extends NewsStates{}

class NewsGetScienceSucessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsLoadingSearchState extends NewsStates{}

class NewsGetSearchSucessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;

  NewsGetSearchErrorState(this.error);
}


class NewsChangeThemeMode extends NewsStates{}

