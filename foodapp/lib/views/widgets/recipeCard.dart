import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailURL;
  final String description;

  RecipeCard({
    required this.title,
    required this.rating,
    required this.cookTime,
    required this.thumbnailURL,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(thumbnailURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black,),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  child: Text(description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  Container(

                    child: Text(rating,style: TextStyle(color: Colors.black),),
                  ),
                  SizedBox(width: 180,),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        Text(
                          cookTime,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
