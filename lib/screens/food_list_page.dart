import 'package:flutter/material.dart';
import '../models/food.dart';
import './food_detail_page.dart';
import './login_page.dart';

class FoodListPage extends StatelessWidget {
  final String username;
  const FoodListPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, $username!',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyFoods.length,
        itemBuilder: (context, index) {
          return FoodMenuListItem(foodMenu: dummyFoods[index]);
        },
      ),
    );
  }
}

class FoodMenuListItem extends StatefulWidget {
  final Food foodMenu;
  const FoodMenuListItem({super.key, required this.foodMenu});

  @override
  State<FoodMenuListItem> createState() => _FoodMenuListItemState();
}

class _FoodMenuListItemState extends State<FoodMenuListItem> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FoodMenuDetailPage(foodMenu: widget.foodMenu),
            ),
          );
        },
        child: Stack(
          children: [
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        widget.foodMenu.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Text(
                              widget.foodMenu.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.foodMenu.category,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rp ${widget.foodMenu.price}',
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              right: 50,
              child: IconButton(
                icon: Icon(
                  isBookmarked ? Icons.arrow_forward_ios : Icons.arrow_forward_ios,
                  color: isBookmarked ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
