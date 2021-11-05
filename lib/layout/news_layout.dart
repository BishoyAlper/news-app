import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit.dart';
import 'package:news_app/layout/state.dart';
import 'package:news_app/modules/search_screen.dart';

class NewsLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("news app"),
              actions: [
                IconButton(icon: Icon(Icons.brightness_4_outlined),
                    onPressed: () {
                  NewsCubit.get(context).changeAppMode();
                }),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeCurrentIndex(index);
              },
              items: cubit.bottomItems
            ),
          );
        },
    );
  }

}