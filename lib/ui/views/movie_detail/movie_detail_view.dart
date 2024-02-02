import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tentweny_demo/models/movie_details.dart';
import 'package:tentweny_demo/models/movie_models.dart';
import 'package:tentweny_demo/ui/error_widget/custom_error_widget.dart';

import '../../common/app_colors.dart';
import 'movie_detail_viewmodel.dart';

class MovieDetailView extends StackedView<MovieDetailViewModel> {
  final Movie movie;

  const MovieDetailView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  Widget imageLayout(MovieDetails movieDetails) {
    final url = 'http://image.tmdb.org/t/p/w500/${movieDetails.posterPath}';

    return Builder(
      builder: (context) {
        final mq = MediaQuery.of(context);

        return SizedBox(
          height: mq.size.height / 1.75,
          child: CachedNetworkImage(
            imageUrl: url,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        );
      },
    );
  }

  Widget bottomPanel(MovieDetailViewModel viewModel) {
    return Builder(builder: (context) {
      final mq = MediaQuery.of(context).size;
      final logo = viewModel.logo!;
      final logoPath = 'http://image.tmdb.org/t/p/w500/${logo.filePath}';

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: logoPath,
            // height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: mq.width * 0.65,
            child: Text(
              viewModel.details!.tagline,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: Size(mq.width * 0.65, 50),
              maximumSize: Size(mq.width * 0.65, 50),
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF61C3F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Get Tickets',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              maximumSize: Size(mq.width * 0.65, 50),
              minimumSize: Size(mq.width * 0.65, 50),
              foregroundColor: Colors.white,
              side: const BorderSide(
                color: Color(0xFF61C3F2),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: viewModel.viewTrailer,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Watch Trailer',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget topHalf(MovieDetailViewModel movieDetailViewModel) {
    return Stack(
      children: [
        imageLayout(movieDetailViewModel.details!),
        Positioned.fill(
          bottom: 50,
          child: bottomPanel(movieDetailViewModel),
        )
      ],
    );
  }

  Widget bottomHalf(MovieDetailViewModel movieDetailViewModel) {
    final genres = movieDetailViewModel.details!.genres;
    final overview = movieDetailViewModel.details!.overview;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Genres',
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            child: ListView.builder(
              itemBuilder: (context, index) {
                if(index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(genres[index].name),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(genres[index].name),
                  );
                }
              },
              itemCount: genres.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Overview',
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(overview)
        ],
      ),
    );
  }

  Widget buildLayout(MovieDetailViewModel viewModel) {
    if (viewModel.busy('fetch-details')) {
      return const Center(
        child: CircularProgressIndicator(
          color: color1,
        ),
      );
    } else if (viewModel.error('fetch-details') != null) {
      return Center(
        child: CustomErrorWidget(
          onRetry: viewModel.fetchMovieDetails,
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            topHalf(viewModel),
            bottomHalf(viewModel),
          ],
        ),
      );
    }
  }

  @override
  Widget builder(
    BuildContext context,
    MovieDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildLayout(viewModel),
    );
  }

  @override
  MovieDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MovieDetailViewModel(movie: movie);

  @override
  void onViewModelReady(MovieDetailViewModel viewModel) {
    viewModel.fetchMovieDetails();
  }
}
