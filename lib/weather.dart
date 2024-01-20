import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  TextEditingController city = TextEditingController();
  bool isCity = false;


  List<dynamic> responseData = [];

  Future<void> getData(String cityName) async {
    String yourapikey = dotenv.env['API_KEY'].toString();
    try {
      if(isCity == false)
      {
        cityName = 'Kanpur';
      }
      final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$yourapikey',
      ));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          responseData = [data];
        });
      } else {
        print('Failed to fetch weather data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during weather data fetching: $error');
    }
  }

  String capitalize(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}


  @override
  void initState() {
    super.initState();
    getData('Kanpur');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 35, 34, 34),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF7C7C7C),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C7C7C),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: IconButton(
                      onPressed: () {
                        getData(city.text);
                        setState(() {
                          isCity = true;
                        });
                      },
                      icon: const Icon(
                        Icons.search_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Weather in ${isCity ? capitalize(city.text): 'Kanpur'}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              responseData.isNotEmpty ? '${responseData[0]['main']['temp'].toString()}°C' : '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5.0),
            responseData.isNotEmpty
              ? Image.network(
                  'https://openweathermap.org/img/w/${responseData[0]['weather'][0]['icon']}.png',
                )
              : const CircularProgressIndicator(),
            Text(
              responseData.isNotEmpty ? capitalize(responseData[0]['weather'][0]['description'].toString()) : '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              responseData.isNotEmpty ? 'Humidity: ${responseData[0]['main']['humidity'].toString()}%' : '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              responseData.isNotEmpty ? 'Wind: ${responseData[0]['wind']['speed'].toString()}km/h' : '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
