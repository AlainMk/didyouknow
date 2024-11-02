import 'package:didyouknow/didyouknow/ui/home/bloc/home_bloc.dart';
import 'package:didyouknow/didyouknow/ui/home/fact_card.dart';
import 'package:didyouknow/didyouknow/ui/home/nav_bar.dart';
import 'package:didyouknow/didyouknow/ui/home/search_bar.dart';
import 'package:didyouknow/theme/colors.dart';
import 'package:didyouknow/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const GetTodayFact()),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(Icons.school),
              const Gap(KnowunitySpacing.smallMedium),
              const Text('Knowunity'),
              const Spacer(),
              const Icon(
                Icons.local_fire_department,
                color: KnowunityColors.lightGray,
              ),
              const Gap(KnowunitySpacing.smallMedium),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.chat_bubble_2_fill),
              ),
              const Gap(KnowunitySpacing.smallMedium),
              const CircleAvatar(
                radius: 14,
                child: Icon(Icons.person, size: 20),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const KnowunityBottomNavigationBar(),
        body: Builder(builder: (context) {
          return BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LoadingHomeState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorHomeState) {
                return Center(
                  child: Text(state.message),
                );
              }
              final homeState = state as SuccessHomeState;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(KnowunitySpacing.large),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: KnowunityColors.border,
                          child: Icon(Icons.waving_hand),
                        ),
                        const Gap(KnowunitySpacing.large),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lucas, Did you know?',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                'Here are some interesting facts for you',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: KnowunityColors.lightGray),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(KnowunitySpacing.large),
                    HomeFactCard(state: homeState),
                    const Gap(KnowunitySpacing.large),
                    const HomeSearchBar()
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
