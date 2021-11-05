import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view_screen.dart';

//https://newsapi.org/v2/everything?q=tesla&apiKey=964a320e003946dd889621510b996d1e

Widget buildArticleItem(article, context) =>
  InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewScreen(article['url'])));
    },
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article["urlToImage"]}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article['title']}",
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${article['publishedAt']}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );


Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  @required Function validator,
  @required String label,
  @required IconData prefix,
  IconData sufix,
  bool isClicked = true,

})=> TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted:onSubmit,
  onChanged: onChange,
  validator: validator,
  onTap: onTap,
  enabled: isClicked,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon: sufix != null ? Icon(sufix) : null,
    border: OutlineInputBorder(),
  ),

);
