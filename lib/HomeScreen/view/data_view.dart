import 'package:flutter/material.dart';

class DataView extends StatelessWidget {
  const DataView({
    Key? key,
    required this.icon,
    required this.cityName,
    required this.mainValue,
    required this.temp,
  }) : super(key: key);

 final String cityName;
 final String mainValue;
 final String temp;
 final String? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityName,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          mainValue,
          style: const TextStyle(color: Colors.white, fontSize: 32.0),
        ),
        Text(
          temp,
          style: const TextStyle(color: Colors.white),
        ),icon!=null?
             Image.network(
                "http://openweathermap.org/img/w/" +
                    icon! +
                    ".png",
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              )
            : const SizedBox(),
      ],
    );
  }
}
