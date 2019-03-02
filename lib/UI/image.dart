import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewPhoto extends StatefulWidget {
  final String text ;
  ViewPhoto({this.text});
  @override
  _ViewPhotoState createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto> {
  
   List<List> photos;
   List photo;
   @override
   void initState(){
     super.initState();
     fetchStates();
     setState(() {
            
          });
   }
  void fetchStates() async {
    var res = await http.get("https://images-api.nasa.gov/search?q=${widget.text}&media_type=image");
    var decodedRes = jsonDecode(res.body);
    var photores = decodedRes['collection']['items'][1]['href'];
   // List photores = decodedRes['collection'];
      print("photores is $photores");
  for(int i=0;i<1;i++)
  {
    fetchPhoto(photores);
  //  print("photores :${photores[1]['href']}");
    //print("photo=>${photo}");
//photos.add(photo);
  }
    
  }
  int j=0;
   void fetchPhoto(String url) async{
       var finalres = await http.get(url);
    var finaldecodedRes = jsonDecode(finalres.body);
     photo = finaldecodedRes;
      print("photo=$photo");
     // photos[j++]=photo;
     // print(photo);
    setState(() {
      
    });
   // return finaldecodedRes.toList;
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.text),
      ),
      body: photo!=null?/*GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemCount: photo.length,
    padding: EdgeInsets.all(10.0),
    itemBuilder: (context,int index)=>Card(child: Image.network(photo[index])),
    
  )*/Center(
      child: new Image.network(photo[3],
    fit: BoxFit.fill,),
  ):Center(child: CircularProgressIndicator()),
    );
  }
}
