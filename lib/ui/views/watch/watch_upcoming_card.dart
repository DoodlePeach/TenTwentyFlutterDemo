import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tentweny_demo/models/movie_models.dart';
import 'package:tentweny_demo/ui/error_widgets/custom_image_error_widget.dart';

class WatchUpcomingCard extends StatelessWidget {
  final Movie movie;
  final Function() onTap;

  const WatchUpcomingCard({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'http://image.tmdb.org/t/p/w500/${movie.backdropPath}';

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (_, __, ___) => const CustomImageErrorWidget(),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Text(
                  movie.title ?? "Movie title not present.",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
