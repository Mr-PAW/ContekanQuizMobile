import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final TextEditingController _seatController = TextEditingController();
  int _totalPrice = 0;

  void _calculateTotal() {
    setState(() {
      int seats = int.tryParse(_seatController.text) ?? 0;
      _totalPrice = seats * widget.movie.harga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Gambar Poster
            Image.network(
              widget.movie.imgUrl,
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Judul & Info Dasar (Rating, Year, Genre)
                  Text(
                    widget.movie.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "⭐ ${widget.movie.rating} | ${widget.movie.year} | ${widget.movie.genre}",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),

                  // 3. Harga per Tiket
                  Text(
                    "Harga Tiket: Rp ${widget.movie.harga}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(height: 30),

                  // 4. Detail Produksi (Director & Cast)
                  const Text(
                    "Director:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.movie.director),
                  const SizedBox(height: 10),
                  const Text(
                    "Cast:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.movie.casts.join(", ")),

                  const SizedBox(height: 20),

                  // 5. Sinopsis
                  const Text(
                    "Synopsis:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.movie.synopsis,
                    style: const TextStyle(height: 1.5),
                  ),

                  const Divider(height: 40),

                  // 6. Form Pemesanan (Input Kursi)
                  const Text(
                    "Pesan Tiket",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _seatController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Jumlah Kursi",
                      hintText: "Contoh: 2",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.chair_alt),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 7. Tampilan Perkiraan Harga (Muncul kalau sudah dihitung)
                  if (_totalPrice > 0)
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Bayar:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Rp $_totalPrice",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // 8. Tombol Cek
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: _calculateTotal,
                      icon: const Icon(Icons.calculate),
                      label: const Text("CEK TOTAL HARGA"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
