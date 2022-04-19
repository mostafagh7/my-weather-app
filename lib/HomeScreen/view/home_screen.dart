import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled/HomeScreen/Controller/weather_controller.dart';


import 'button.dart';
import 'data_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Flutter Weather App'),
      ),
      body: Center(
        child: controller.isLoading
            ? const SpinKitWave(
                color: Colors.amber,
                size: 100,
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 8, 8, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      child: TextFormField(
                                        initialValue: controller.cityName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                        onChanged: controller.updateCityName,
                                        decoration: const InputDecoration(
                                          errorBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          hintText: "Enter city name",
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      width: 200,
                                    ),
                                    MyButton(onTap: () async {
                                      controller.updateIsLoading();
                                      setState(() {});
                                      await controller.getWeather();
                                      controller.updateIsLoading();
                                      setState(() {});
                                    })
                                  ],
                                ),
                              ),
                              DataView(
                                icon: controller.model!=null?controller.model!.weather![0].icon!:null,
                                cityName: controller.model != null
                                    ? controller.model!.name!
                                    : "",
                                mainValue: controller.model != null
                                    ? controller.model!.weather![0].main!
                                    : '',
                                temp: controller.model != null
                                    ? (controller.model!.main!.temp! - 273)
                                        .toString()
                                    : '',
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
