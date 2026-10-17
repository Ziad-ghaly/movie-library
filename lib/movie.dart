class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

const List<Movie> movies = [
  Movie(
    title: 'Inception',
    genre: 'Sci-Fi, Action, Thriller',
    year: 2010,
    rating: 8.8,
    image: 'assets/posters/inception.jpg',
  ),
  Movie(
    title: 'The Dark Knight',
    genre: 'Action, Crime, Drama',
    year: 2008,
    rating: 9.0,
    image: 'assets/posters/dark_knight.jpg',
  ),
  Movie(
    title: 'Interstellar',
    genre: 'Sci-Fi, Adventure, Drama',
    year: 2014,
    rating: 8.7,
    image: 'assets/posters/interstellar.jpg',
  ),
  Movie(
    title: 'Pulp Fiction',
    genre: 'Crime, Drama',
    year: 1994,
    rating: 8.9,
    image: 'assets/posters/pulp_fiction.jpg',
  ),
  Movie(
    title: 'Spirited Away',
    genre: 'Animation, Adventure, Fantasy',
    year: 2001,
    rating: 8.6,
    image: 'assets/posters/spirited_away.jpg',
  ),
  Movie(
    title: 'Parasite',
    genre: 'Drama, Thriller',
    year: 2019,
    rating: 8.5,
    image: 'assets/posters/parasite.jpg',
  ),
  Movie(
    title: 'Gladiator',
    genre: 'Action, Adventure, Drama',
    year: 2000,
    rating: 8.5,
    image: 'assets/posters/gladiator.jpg',
  ),
  Movie(
    title: 'The Matrix',
    genre: 'Sci-Fi, Action',
    year: 1999,
    rating: 8.7,
    image: 'assets/posters/the_matrix.jpg',
  ),
  Movie(
    title: 'Avengers: Endgame',
    genre: 'Action, Adventure, Sci-Fi',
    year: 2019,
    rating: 8.4,
    image: 'assets/posters/avengers_endgame.jpg',
  ),
  Movie(
    title: 'Whiplash',
    genre: 'Drama, Music',
    year: 2014,
    rating: 8.5,
    image: 'assets/posters/whiplash.jpg',
  ),
];
