import 'package:flutter/material.dart';
import '../models/food.dart';
//import 'package:latihan_kuis_a/models/movie_model.dart'; //kalo mau path absolute

class FoodMenuDetailPage extends StatelessWidget {
  final Food foodMenu;

  const FoodMenuDetailPage({super.key, required this.foodMenu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              foodMenu.image,
              width: double.infinity,
              height: 450,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodMenu.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    foodMenu.category,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Rp ${foodMenu.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(foodMenu.description),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      //onPressed: _foodList,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.orange,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.shop, color: Colors.white, size: 16),
                          Text(
                            'Pesan Sekarang',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
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
