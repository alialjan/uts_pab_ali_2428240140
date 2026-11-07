import 'package:flutter/material.dart';
import 'package:utspab_ali_2428240140/models/culinary.dart';

class DetailScreen extends StatefulWidget {
  final Culinary tinutuan;

  const DetailScreen({super.key, required this.tinutuan});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final dish = widget.tinutuan;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  dish.imageAsset,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      dish.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E2A1A),
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: _isFavorite
                        ? 'Hapus dari favorit'
                        : 'Tambahkan ke favorit',
                    onPressed: () {
                      setState(() => _isFavorite = !_isFavorite);
                    },
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 28,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _infoRow(Icons.location_on, 'Asal', dish.origin),
              _infoRow(
                Icons.shopping_basket,
                'Bahan Utama',
                dish.mainIngredients,
              ),
              _infoRow(Icons.restaurant, 'Disajikan', dish.servingSuggestion),
              const SizedBox(height: 20),
              const Text(
                'Deskripsi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E2A1A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                dish.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Color(0xFF4E4035),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Galeri',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E2A1A),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: dish.galleryImages.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        dish.galleryImages[index],
                        width: 170,
                        height: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 170,
                            height: 150,
                            color: const Color(0xFFFFE2B8),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.restaurant,
                              color: Color(0xFFB75B00),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE2B8),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nama',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7D4C1D),
                      ),
                    ),
                    Text(
                      dish.studentName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E2A1A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'NPM',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7D4C1D),
                      ),
                    ),
                    Text(
                      dish.studentNpm,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E2A1A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD9A8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFFB75B00)),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 15, color: Color(0xFF4E4035)),
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
