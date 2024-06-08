import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_bloc/bloc/weather_bloc_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

Widget getWeatherIcon(int code) {
  switch (code) {
    case >= 200 && <300:
      return Image.asset(
        'assets/1.png',
      );
    case>=300&&<400:
     return Image.asset(
        'assets/2.png',
      );
      case>=500&&<600:
     return Image.asset(
        'assets/3.png',
      );
      case>=600&&<700:
     return Image.asset(
        'assets/4.png',
      );
        case>=700&&<800:
     return Image.asset(
        'assets/5.png',
      );
          case==800:
     return Image.asset(
        'assets/6.png',
      );
           case>=800&&<=804:
     return Image.asset(
        'assets/7.png',
      );
      default:
      return Image.asset(
        'assets/8.png',
      );
      
  }
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.2),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100,
                  sigmaY: 100,
                ),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            '📍 ${state.weather.areaName}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Good Morning',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                         getWeatherIcon(state.weather.weatherConditionCode!),
                           Center(
                            child: Text(
                            "${state.weather.temperature!.celsius!.round()}°C" ,
                              style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                           Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                           Center(
                          
                            child: Text(
                                 DateFormat('EEEE dd •').add_jm(). format(state.weather.date!),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/11.png',
                                    scale: 8,
                                  ),
                                   Column(
                                    children: [
                                      const Text(
                                        'Sunrise',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        DateFormat('').add_jm(). format(state.weather.sunrise!),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/12.png',
                                    scale: 8,
                                  ),
                                   Column(
                                    children: [
                                      const Text(
                                        'Sunset',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                         DateFormat('').add_jm(). format(state.weather.sunset!),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(
                              color: Colors.grey,
                              thickness: 0.3,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/13.png',
                                    scale: 8,
                                  ),
                                   Column(
                                    children: [
                                      const Text(
                                        'Max Tem',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '${state.weather.tempMax!.celsius!.round()}°C',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/14.png',
                                    scale: 8,
                                  ),
                                   Column(
                                    children: [
                                      const Text(
                                        'Min Temp',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '${state.weather.tempMin!.celsius!.round()}°C',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return  SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Center(child:Lottie.asset('assets/Animation - 1717825138466.json') ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
