import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Restaurant Menu",
      home: MenuPage(),
    );
  }
}

List<ItemModel> items = [
  ItemModel(
    title: "Pizza",
    ingredients: ["Tomato"],
    price: 10,
    image:
        "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
  ),
  ItemModel(
    title: "Tomato Soup",
    price: 8,
    image:
        "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
  ),
  ItemModel(
    title: "Pizza",
    ingredients: ["Tomato"],
    price: 10,
    image:
        "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
  ),
  ItemModel(
    title: "Tomato Soup",
    price: 8,
    image:
        "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
  ),
  ItemModel(
    title: "Pizza",
    ingredients: ["Tomato"],
    price: 10,
    image:
        "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
  ),
  ItemModel(
    title: "Tomato Soup",
    price: 8,
    image:
        "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
  ),
  ItemModel(
    title: "Pizza",
    ingredients: ["Tomato"],
    price: 10,
    image:
        "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
  ),
  ItemModel(
    title: "Tomato Soup",
    price: 8,
    image:
        "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
  ),
];

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: Text("Restaurant Menu"),
            ),
      body: ResponsiveBuilder(
        builder: (context, sizeInfo) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (kIsWeb) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 20),
                  child: Text(
                    "Restaurant Menu",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
              Expanded(
                              child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: sizeInfo.isDesktop
                        ? sizeInfo.screenSize.width > 1400
                            ? 4
                            : sizeInfo.screenSize.width > 1200 ? 3 : 2
                        : 1,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 4.0,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    ItemModel item = items[index];
                    return MenuItem(
                      item: item,
                    );
                  },
                ),
              ),
            ],
          );
          
        },
      ),
    );
  }
}

class ItemModel {
  final String title;
  final List<String> ingredients;
  final double price;
  final String image;

  ItemModel({
    this.title,
    this.ingredients,
    this.price,
    this.image,
  });
}

class MenuItem extends StatelessWidget {
  final ItemModel item;
  const MenuItem({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  item.image != null ? NetworkImage(item.image) : null,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  if (item.ingredients != null) ...[
                    const SizedBox(height: 5.0),
                    Text(item.ingredients.join("/")),
                  ],
                ],
              ),
            ),
            Container(
              width: 40.0,
              child: Text(
                "\$${item.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
