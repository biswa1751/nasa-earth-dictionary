import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ViewPhoto extends StatefulWidget {
  final String text;

  const ViewPhoto({Key? key, required this.text}) : super(key: key);
  @override
  _ViewPhotoState createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto> {
  List<List> photos = [];
  List? photo;
  @override
  void initState() {
    super.initState();
    fetchStates();
    setState(() {});
  }

  void fetchStates() async {
    var res = await Dio().get(
        'https://images-api.nasa.gov/search?q=${widget.text}&media_type=image');
    // var decodedRes = jsonDecode(res.data);
    var photores = res.data['collection']['items'][1]['href'];
    // List photores = decodedRes['collection'];
    print("photores is $photores");
    for (int i = 0; i < 1; i++) {
      fetchPhoto(photores);
      //  print("photores :${photores[1]['href']}");
      //print("photo=>${photo}");
//photos.add(photo);
    }
  }

  int j = 0;
  void fetchPhoto(String url) async {
    var finalres = await Dio().get(url);
    photo = finalres.data;
    print("photo=$photo");
    // photos[j++]=photo;
    // print(photo);
    setState(() {});
    // return finaldecodedRes.toList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: photo?.first != null
          ? /*GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemCount: photo.length,
    padding: EdgeInsets.all(10.0),
    itemBuilder: (context,int index)=>Card(child: Image.network(photo[index])),
    
  )*/
          Center(
              child: Image.network(
                photo?.first,
                fit: BoxFit.fill,
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
