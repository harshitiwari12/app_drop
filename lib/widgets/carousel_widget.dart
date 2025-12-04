import 'package:app_drop/model/component_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselComponent extends StatelessWidget{
  final ComponentModel model;
  const CarouselComponent({super.key,required this.model});

  @override
  Widget build(BuildContext context){
    final images = model.getStringList('images');
    final height = model.getDouble('height', 200);
    final autoPlay = model.getBool('autoPlay', false);
    final spacing = model.getInt('spacing', 8).toDouble();

    if (images.isEmpty){
      return Container(
        height: height,
        color: Colors.grey[100],
        child: const Center(child: Text('No images')),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: autoPlay,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        padEnds: true,
      ),
      items: images.map((url){
        return Builder(builder: (context){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: spacing / 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(url, fit: BoxFit.cover, width: double.infinity, errorBuilder: (c, e, s) => _placeholder()),
            ),
          );
        });
      }).toList(),
    );
  }

  Widget _placeholder() => Container(
    color: Colors.grey[300],
    child: const Center(child: Icon(Icons.broken_image)),
  );
}