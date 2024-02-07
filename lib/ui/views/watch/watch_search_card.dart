import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tentweny_demo/models/movie_models.dart';

import '../../common/app_colors.dart';
import '../../error_widgets/custom_image_error_widget.dart';

class WatchSearchCard extends StatelessWidget {
  final Movie movie;
  final Function() onTap;

  const WatchSearchCard({
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 100,
                  width: 130,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    errorWidget: (_, __, ___) => const CustomImageErrorWidget(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title ?? "Movie title not present.",
                      style: const TextStyle(
                        color: color1,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      movie.overview ?? "",
                      style: const TextStyle(
                        color: color5,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.more_horiz,
            ),
          ],
        ),
      ),
    );
  }
}
