import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rating_tool/Components/movieDetails.dart';
import 'package:rating_tool/Components/searchBar.dart';

import 'Components/moviePoster.dart';
import 'Data_Classes/movie.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

//declare theme colors
  static const MaterialColor customColor = MaterialColor(
    0xFF573A60,
    <int, Color>{
      50: Color.fromRGBO(87, 58, 96, .1),
      100: Color.fromRGBO(87, 58, 96, .2),
      200: Color.fromRGBO(87, 58, 96, .3),
      300: Color.fromRGBO(87, 58, 96, .4),
      400: Color.fromRGBO(87, 58, 96, .5),
      500: Color.fromRGBO(87, 58, 96, .6),
      600: Color.fromRGBO(87, 58, 96, .7),
      700: Color.fromRGBO(87, 58, 96, .8),
      800: Color.fromRGBO(87, 58, 96, .9),
      900: Color.fromRGBO(87, 58, 96, 1),
    },
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Rating Tool',
      theme: ThemeData(
        primarySwatch: customColor,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(
              title: "Movie Rating Tool",
            ),
        "/details": (context) => MovieDetails(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> apiResponse;
  List<dynamic> results;
  List<MoviePoster> posters = new List<MoviePoster>();
  int page = 1;
  ScrollController _controller;
  String searchQuery = "";
  bool loading = false;

  void initState() {
    super.initState();
    _controller = new ScrollController();
    //reset("");
    _controller.addListener(() {
      //TODO Fix double loading of pages due to maxScrollExtend not being updated fast enough
      //debugPrint(_controller.position.pixels.toString() + " -- " +  _controller.position.maxScrollExtent.toString());
      //debugPrint((_controller.position.pixels >= _controller.position.maxScrollExtent - 100).toString());
      //if ((_controller.position.atEdge) ) {
      if (!loading &&
          _controller.position.pixels >=
              _controller.position.maxScrollExtent - 400) {
        loading = true;
        page++;
        getMovies();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void reset(String query) {
    posters.clear();
    searchQuery = query;
    _controller.jumpTo(0);
    page = 1;
  }

  /// Adds to the posters list.
  /// Makes a HTTP GET request to get all movies matching the query.

  void getMovies() async {
    debugPrint(searchQuery);
    debugPrint("Getting Movies...");
    String url =
        "https://api.themoviedb.org/3/search/movie?api_key=2a5e9e9ffe88a72d360c94f040190e21&query=$searchQuery&page=$page";
    debugPrint(url);
    final response = await http.get(url);
    debugPrint("Fetch ok");
    if (response.statusCode == 200) {
      debugPrint("status ok");
      apiResponse = json.decode(response.body);
      if (apiResponse["total_pages"] >= page) {
        results = apiResponse["results"];
        //debugPrint(results.toString());
        setState(() {
          results.forEach((m) => {
                //debugPrint(m["release_date"].toString()),
                posters.add(new MoviePoster(Movie(
                  title: m["title"],
                  posterUrl: m["poster_path"],
                  id: m["id"],
                  description: m["overview"],
                  releaseDate: DateTime.parse((m["release_date"] != ""
                          ? m["release_date"]
                          : "1200-01-01")
                      .replaceAll(RegExp('-'), '')),
                )))
              });
        });
      }
      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchBar(
              onSubmit: (text) => {reset(text), getMovies()},
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: <Widget>[
                      Wrap(
                        children: <Widget>[
                          ...posters,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
