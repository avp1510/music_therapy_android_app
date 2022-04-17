import 'package:flutter/material.dart';

Widget customListTile({String? title, String? singer, String? cover, onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              image: DecorationImage(
                image: NetworkImage(cover!),
                fit: BoxFit.cover,
              )
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5,),
              Text(
                singer!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),
              )
  
            ],
          )
        ],
      ),
    ),
  );
}
