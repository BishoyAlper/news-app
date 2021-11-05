import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit.dart';
import 'package:news_app/layout/state.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget{
  var searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
              children: [
          Padding(
          padding: const EdgeInsets.all(20.0),
          child: defaultFormField(
            controller: searchControler,
            type: TextInputType.text,
            onChange: (String value) {
              NewsCubit.get(context).getSearch(value);
            },
            validator: (String value) {
              if (value.isEmpty) {
                return "search must be not empty";
              }
            },
            label: 'Search',
            prefix: Icons.search,
          ),
        ),
        ConditionalBuilder(
          condition: list.length>0,
           builder:(context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index)=> buildArticleItem(list[index], context),
              separatorBuilder: (context, index)=>Container(
               width: double.infinity,
               height: 1.0,
               color: Colors.grey[300],
                ),
               itemCount: list.length,
              )
        ),
            ],
          ),
        );
      },
    );
  }

}