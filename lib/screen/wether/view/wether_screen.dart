import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether1_api/screen/wether/modal/wether_modal.dart';
import 'package:wether1_api/screen/wether/provider/wether_provider.dart';
import 'package:lottie/lottie.dart';

class WetherScreen extends StatefulWidget {
  const WetherScreen({Key? key}) : super(key: key);

  @override
  State<WetherScreen> createState() => _WetherScreenState();
}

class _WetherScreenState extends State<WetherScreen> {
  WetherProvider? wetherProviderfalse;
  WetherProvider? wetherProvidertrue;

  @override
  Widget build(BuildContext context) {
    wetherProviderfalse = Provider.of<WetherProvider>(context, listen: false);
    wetherProvidertrue = Provider.of<WetherProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white12,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Lottie.asset('assets/json/weather.json', fit: BoxFit.cover),
          ),
          Column(
            children: [
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    print(snapshot.data!.name);
                    Wether? wether = snapshot.data;
                    return Container(
                      // height: 750,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              controller: wetherProviderfalse!.txtcity,
                              decoration: InputDecoration(
                                  hintText: "Enter the city name",
                                  helperStyle: TextStyle(color: Colors.white54),
                                  hintStyle: TextStyle(
                                      color: Colors.white54, fontSize: 14),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white54),
                                  ),
                                  prefixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        wetherProvidertrue!.getApi();
                                      });
                                    },
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white54,
                                    ),
                                  )),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('${wether!.name}',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 25)),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                                '${((wether!.main!.temp)! - 273).toString().substring(0,5)} °c',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 45)),
                            SizedBox(height: 250,),
                            Container(
                              padding: EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white30)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Lottie.asset("assets/json/1.json",height: 45),
                                    SizedBox(width: 10,),
                                    Text("Weather Status",style: TextStyle(color: Colors.white)),
                                  ],),
                                  Text("Status :${wether!.weather![0].main}",style: TextStyle(color: Colors.white54),),
                                  Text("Status :${wether!.weather![0].description}",style: TextStyle(color: Colors.white54),),
                                  SizedBox(height: 10,),
                                  Row(children: [
                                    Lottie.asset("assets/json/3.json",height: 35),
                                    SizedBox(width: 10,),
                                    Text("Temp ",style: TextStyle(color: Colors.white)),
                                  ],),
                                  SizedBox(height: 5,),
                                  Text("Min Temp :${wether!.main!.tempMin} k",style: TextStyle(color: Colors.white54),),
                                  Text("Max Temp :${wether!.main!.tempMax} k",style: TextStyle(color: Colors.white54),),
                                  SizedBox(height: 10,),
                                  Row(children: [
                                    Lottie.asset("assets/json/4.json",height: 35,),

                                    SizedBox(width: 10,),
                                    Text("Wind",style: TextStyle(color: Colors.white)),
                                  ],),
                                  Text("Wind Speed :${wether!.wind!.speed} k",style: TextStyle(color: Colors.white54),),
                                  Text("Wind Degree :${wether!.wind!.deg} k",style: TextStyle(color: Colors.white54),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
                future: wetherProviderfalse!.getApi(),
              )
            ],
          )
        ],
      ),
    ));
  }
}
