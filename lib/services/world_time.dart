import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location;
  String time;
  String flag; 
  String url;
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});


  Future<void> getTime() async{

    try{
    
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
  
    String datetime = data['datetime'];
    print(datetime);
    String localDatetime = datetime.substring(0, datetime.length-6); 
    //int offset = int.parse(data['utc_offset'].substring(0,3));
    //print(datetime);
    //print(offset);
    
    DateTime now = DateTime.parse(localDatetime);
    print(now);
    //now = now.add(Duration(hours: offset));
    //print(now);

    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
    }

    catch(e){
      print('caught errors: $e');
      time = 'could not get time data';
    }



    
  }

  
}

