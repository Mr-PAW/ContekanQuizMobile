import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie List")),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: movie),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Gambar di kiri
                    Image.network(
                      movie.imgUrl,
                      width: 80,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 15),
                    // Info di kanan
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${movie.year} | ${movie.genre}"),
                          Text("Rating: ⭐ ${movie.rating}"),
                          const SizedBox(height: 10),
                          const AddToListButton(), // Widget tombol custom
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Widget khusus tombol Add to List biar warnanya bisa berubah pas diklik
class AddToListButton extends StatefulWidget {
  const AddToListButton({super.key});

  @override
  State<AddToListButton> createState() => _AddToListButtonState();
}

class _AddToListButtonState extends State<AddToListButton> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isAdded ? Colors.blue : Colors.white,
        side: BorderSide(color: isAdded ? Colors.blue : Colors.black),
      ),
      onPressed: () {
        setState(() {
          isAdded = !isAdded;
        });
      },
      child: Text(
        isAdded ? "Added" : "Add to List",
        style: TextStyle(color: isAdded ? Colors.white : Colors.black),
      ),
    );
  }
}
