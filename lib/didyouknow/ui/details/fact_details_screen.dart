import 'package:didyouknow/didyouknow/data/models/fact.dart';
import 'package:didyouknow/didyouknow/ui/details/article_fact.dart';
import 'package:didyouknow/didyouknow/ui/details/bloc/details_fact_bloc.dart';
import 'package:didyouknow/didyouknow/ui/details/slides_fact.dart';
import 'package:didyouknow/didyouknow/ui/details/video_fact.dart';
import 'package:didyouknow/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactDetailsScreen extends StatelessWidget {
  const FactDetailsScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsFactBloc()..add(GetFactDetails(id)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Fact Details'),
          backgroundColor: Colors.transparent,
          foregroundColor: KnowunityColors.white,
          iconTheme: const IconThemeData(color: KnowunityColors.white),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.heart),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.share),
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                KnowunityColors.background.withOpacity(0.9),
                KnowunityColors.third.withOpacity(0.7),
              ],
            ),
          ),
          child: Builder(
            builder: (context) {
              return BlocBuilder<DetailsFactBloc, DetailsFactState>(
                builder: (context, state) {
                  if (state is LoadingDetailsFactState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ErrorDetailsFactState) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  final details = state as SuccessDetailsFactState;
                  if (details.factType == ContentType.article) {
                    return ArticleFact(item: details.slideItems.first);
                  } else if (details.factType == ContentType.video) {
                    return VideoFact(item: details.slideItems.first);
                  }
                  return SlidesFact(items: details.slideItems);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
