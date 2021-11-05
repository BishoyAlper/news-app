import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/state.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/settings.dart';
import 'package:news_app/modules/sport.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) =>BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: "Business"
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: "Sports"
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: "Science"
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.settings
      ),
      label: "settings",
    ),
    ];

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsLoadingBusinessState());

    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '964a320e003946dd889621510b996d1e'
      },
    ).then((value){
      business = value.data["articles"];
      emit(NewsGetBusinesSucessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinesErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsLoadingSportsState());

      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '964a320e003946dd889621510b996d1e'
        },
      ).then((value){
        //print(value.data["articles"][0]['publishedAt']);
        sports = value.data["articles"];
        emit(NewsGetSportsSucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
  }

  List<dynamic>science=[];

  void getScience()
  {
    emit(NewsLoadingScienceState());

      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '964a320e003946dd889621510b996d1e'
        },
      ).then((value){
        science = value.data["articles"];
        print(science[0]['title']);

        emit(NewsGetScienceSucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });

  }

  List<dynamic> search=[];

  void getSearch(String value)
  {
    emit(NewsLoadingSearchState());
    search = [];

    DioHelper.getData(
      url: "v2/everything",
      query: {
        'q': '$value',
        'apiKey': '964a320e003946dd889621510b996d1e'
      },
    ).then((value){
      search = value.data["articles"];
      print(search[0]['title']);

      emit(NewsGetSearchSucessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }

  void changeCurrentIndex(int index)
  {
    currentIndex = index;
    //
    // if(index == 1){
    //   getSports();
    // } else if (index == 2) {
    //   getScience();
    // }
    emit(NewsBottomNavState());
  }

  bool isDark = false;

  void changeAppMode({bool isDark2}){
    if(isDark2 != null){
      isDark = isDark2;
      emit(NewsChangeThemeMode());
    } else {
      isDark = !isDark;
      CachHelper.setData(key: "isDark", value: isDark)
          .then((value) {
        emit(NewsChangeThemeMode());
      }
      );
    }
  }
}