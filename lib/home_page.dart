import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  final bool? initialGridView;

  const HomePage({super.key, this.initialGridView});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isGridView = widget.initialGridView ??
      (Uri.base.queryParameters['grid'] == 'true');
  String _searchQuery = '';
  int _discount = 20;

  void _updateDiscount() {
    setState(() {
      if (_discount > 1) {
        _discount--;
      } else {
        _discount = 20;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) {
      final query = _searchQuery.toLowerCase().trim();
      if (query.isEmpty) return true;
      final matchesTitle = movie.title.toLowerCase().contains(query);
      final matchesGenre = movie.genre.toLowerCase().contains(query);
      return matchesTitle || matchesGenre;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Library',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list_rounded : Icons.grid_view_rounded,
            ),
            tooltip: _isGridView ? 'Switch to List View' : 'Switch to Grid View',
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search TextField without TextEditingController
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withValues(alpha: 0.35),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Movie list or grid view
          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'No movies found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : _isGridView
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.68,
                        ),
                        itemCount: filteredMovies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: filteredMovies[index],
                            isGrid: true,
                            discount: _discount,
                            onDiscountTap: _updateDiscount,
                          );
                        },
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: filteredMovies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: MovieCard(
                              movie: filteredMovies[index],
                              isGrid: false,
                              discount: _discount,
                              onDiscountTap: _updateDiscount,
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
