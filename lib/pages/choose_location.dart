import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

   List<WorldTime> locations = [
    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag: 'abidjan.png'),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: 'accra.png'),
    WorldTime(url: 'Africa/Algiers', location: 'Algiers', flag: 'algiers.png'),
    WorldTime(url: 'Africa/Bissau', location: 'Bissau', flag: 'bissau.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag: 'casablanca.png'),
    WorldTime(url: 'Africa/Ceuta', location: 'Ceuta', flag: 'ceuta.png'),
    WorldTime(url: 'Africa/El_Aaiun', location: 'El_Aaiun', flag: 'El_Aaiun.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'johannesburg.png'),
    WorldTime(url: 'Africa/Juba', location: 'Juba', flag: 'juba.png'),
    WorldTime(url: 'Africa/Khartoum', location: 'Khartoum', flag: 'khartoum.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'lagos.png'),
    WorldTime(url: 'Africa/Maputo', location: 'Maputo', flag: 'maputo.png'),
    WorldTime(url: 'Africa/Monrovia', location: 'Monrovia', flag: 'monrovia.png'),
    //WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: ''),
    WorldTime(url: 'Africa/Ndjamena', location: 'Ndjamena', flag: 'ndjamena.png'),
    WorldTime(url: 'Africa/Sao_Tome', location: 'Sao_Tome', flag: 'sao_tome.png'),
    WorldTime(url: 'Africa/Tripoli', location: 'Tripoli', flag: 'tripoli.png'),
    WorldTime(url: 'Africa/Tunis', location: 'Tunis', flag: 'tunis.png'),
    WorldTime(url: 'Africa/Windhoek', location: 'Windhoek', flag: 'windhoek.jpg'),
    WorldTime(url: 'America/Adak', location: 'Adak', flag: 'adak.png'),
    WorldTime(url: 'America/Anchorage', location: 'Anchorage', flag: 'anchorage.png'),
    WorldTime(url: 'America/Araguaina', location: 'Araguaina', flag: 'araguaina.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Argentina', flag: 'argentina.png'),
    WorldTime(url: 'America/Asuncion', location: 'Asuncion', flag: 'asuncion.png'),
    WorldTime(url: 'America/Atikokan', location: 'Atikokan', flag: 'atikokan.png'),
    WorldTime(url: 'America/Bahia', location: 'Bahia', flag: 'bahia.png'),
    WorldTime(url: 'America/Bahia_Banderas', location: 'Bahia_Banderas', flag: 'bahia_banderas.png'),
    WorldTime(url: 'America/Barbados', location: 'Barbados', flag: 'barbados.png'),
    WorldTime(url: 'America/Belem', location: 'Belem', flag: 'belem.jpg'),
    WorldTime(url: 'America/Belize', location: 'Belize', flag: 'belize.png'),
    WorldTime(url: 'America/Boa_Vista', location: 'Boa_Vista', flag: 'boa_vista.png'),
    WorldTime(url: 'America/Bogota', location: 'Bogota', flag: 'bogota.png'),
    WorldTime(url: 'America/Boise', location: 'Boise', flag: 'boise.png'),
    WorldTime(url: 'America/Campo_Grande', location: 'Campo_Grande', flag: 'campo_grande.png'),
    WorldTime(url: 'America/Cancun', location: 'Cancun', flag: 'cancun.png'),
    WorldTime(url: 'America/Caracas', location: 'Caracas', flag: 'caracas.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: '', location: '', flag: ''),
    WorldTime(url: '', location: '', flag: ''),
    WorldTime(url: '', location: '', flag: ''),
    WorldTime(url: '', location: '', flag: ''),
    WorldTime(url: '', location: '', flag: ''),
    // WorldTime(url: '', location: '', flag: ''),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
  ];
  
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount : locations.length,
        itemBuilder : (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
      
    );
  }
}