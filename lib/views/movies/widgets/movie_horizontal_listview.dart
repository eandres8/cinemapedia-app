import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

import 'package:cinemapedia/data/facades/human_formats.dart';
import 'package:cinemapedia/views/core/widgets/widgets.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MovieHorizontalListview extends StatefulWidget {
  final List<Movie> _movies;
  final String? _title;
  final String? _subTitle;
  final VoidCallback? _loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required List<Movie> movies,
    String? title,
    String? subTitle,
    VoidCallback? loadNextPage,
  }) : _movies = movies,
       _title = title,
       _subTitle = subTitle,
       _loadNextPage = loadNextPage;

  @override
  State<MovieHorizontalListview> createState() =>
      _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (widget._loadNextPage == null) return;

      if ((_scrollController.position.pixels + 200) >=
          _scrollController.position.maxScrollExtent) {
        widget._loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget._title != null || widget._subTitle != null)
            _TItle(title: widget._title, subTitle: widget._subTitle),

          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: widget._movies.length,
              itemBuilder: (context, index) {
                return FadeInRight(
                  child: _Slide(
                    widget._movies[index],
                    key: ValueKey(widget._movies[index].id),
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

class _Slide extends StatelessWidget {
  final Movie _movie;

  const _Slide(this._movie, {super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme(:titleSmall, :bodyMedium, :bodySmall) = Theme.of(
      context,
    ).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // child: Image.network(_movie.posterPath, width: 150, loadingBuilder: ,),
              child: CustomImageNetwork(
                _movie.posterPath,
                width: 150,
                onTap: () => context.push('/movie/${_movie.id}'),
              ),
            ),
          ),

          SizedBox(height: 5),

          // Title
          SizedBox(
            width: 150,
            child: Text(_movie.title, maxLines: 2, style: titleSmall),
          ),

          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                SizedBox(width: 3),
                Text(
                  '${_movie.voteAverage}',
                  style: bodyMedium?.copyWith(color: Colors.yellow.shade800),
                ),
                Spacer(),
                Text(HumanFormats.number(_movie.popularity), style: bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TItle extends StatelessWidget {
  final String? _title;
  final String? _subTitle;

  const _TItle({String? title, String? subTitle})
    : _title = title,
      _subTitle = subTitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme(:titleLarge) = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_title != null) Text(_title, style: titleLarge),

          // const Spacer(),
          if (_subTitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(_subTitle),
            ),
        ],
      ),
    );
  }
}
