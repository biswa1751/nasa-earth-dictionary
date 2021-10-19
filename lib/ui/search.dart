import 'package:flutter/material.dart';
// import 'package:material_search/material_search.dart'; 
import 'package:nasa/data/data.dart';
import 'package:nasa/ui/meaning.dart';

buildMaterialSearchPage(BuildContext context, List list) {
  void submit(String text) {
    text = text.toUpperCase();
    Navigator.of(context).push(
      findMeaning(text, list, wordData,context),
    );
  }

  return MaterialPageRoute<String>(
    settings: RouteSettings(
      name: 'material_search',
    ),
    builder: (BuildContext context) {
      return Material(
        // child: new MaterialSearch<String>(
        //   placeholder: 'Search',
        //   results: list
        //       .map((v) => new MaterialSearchResult<String>(
              
        //             value: v,
        //             text: "$v",
        //             icon: Icons.search,
        //           ))
        //       .toList(),
        //   filter: (dynamic value, String criteria) {
        //     return value.toLowerCase().trim().contains(
        //           new RegExp(r'' + criteria.toLowerCase().trim() + ''),
        //         );
        //   },
        //   onSelect: (dynamic value) => submit(value.toString()),
        //   onSubmit: (String value) => submit(value),
        // ),
      );
    },
  );
}
