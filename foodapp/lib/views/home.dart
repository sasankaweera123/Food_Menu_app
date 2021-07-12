import 'package:flutter/material.dart';
import 'package:foodapp/models/recipe.api.dart';
import 'package:foodapp/models/recipe.dart';
import 'package:foodapp/views/widgets/recipeCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;
  //
  @override
  void initState() {
    super.initState();
    getRecipes();
  }
  //
  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu_sharp),
            SizedBox(width: 10,),
            Text('Food Menu')
          ],
        ),
      ),
      body:
        // RecipeCard(title: 'aeghadg', rating: 'rgaegadg', cookTime: 'Sgsgasgfas', thumbnailURL: 'https://images.ctfassets.net/hrltx12pl8hq/3MbF54EhWUhsXunc5Keueb/60774fbbff86e6bf6776f1e17a8016b4/04-nature_721703848.jpg?fit=fill&w=480&h=270'),
      _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
              title: _recipes[index].name,
              cookTime: _recipes[index].totalTime,
              rating: _recipes[index].rating.toString(),
              thumbnailURL: _recipes[index].images,
              description: _recipes[index].description,
          );
       },
     )
    );
  }
}
