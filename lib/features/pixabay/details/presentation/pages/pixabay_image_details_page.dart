import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_flutter/core/data/di/dependency_container.dart';
import 'package:pixabay_flutter/core/domain/error/failures.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';
import 'package:pixabay_flutter/core/presentation/widgets/placeholders/failure_widget.dart';
import 'package:pixabay_flutter/core/presentation/widgets/placeholders/loading_widget.dart';
import 'package:pixabay_flutter/features/pixabay/details/presentation/bloc/pixabay_image_details_bloc.dart';
import 'package:pixabay_flutter/features/pixabay/details/presentation/widgets/badge_widget.dart';
import 'package:pixabay_flutter/features/pixabay/details/presentation/widgets/user_widget.dart';
import 'package:pixabay_flutter/l10n/generated/l10n.dart';

@RoutePage()
class PixabayDetailsPage extends StatefulWidget {
  final int id;

  const PixabayDetailsPage({
    required this.id,
    super.key,
  });

  @override
  State<PixabayDetailsPage> createState() => _PixabayDetailsPageState();
}

class _PixabayDetailsPageState extends State<PixabayDetailsPage> {
  final bloc = sl.get<PixabayImageDetailsBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(PixabayImageDetailsEvent.init(widget.id)),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<PixabayImageDetailsBloc, PixabayImageDetailsState>(
          builder: (context, state) {
            if (state.status == PixabayImageDetailsStatus.loading) {
              return const LoadingWidget();
            }

            final item = state.item;

            if (state.status == PixabayImageDetailsStatus.error || item == null) {
              final Failure? failure;

              if (item == null) {
                failure = NotFoundFailure();
              } else {
                failure = state.failure;
              }

              return FailureWidget(
                onTap: () => bloc.add(PixabayImageDetailsEvent.init(widget.id)),
                failure: failure,
              );
            }

            return ListView(
              children: [
                Builder(
                  builder: (context) {
                    final url = item.imageUrl ?? item.webformatUrl;
                    if (url == null) return const SizedBox();

                    final ratio = item.ratioWH ?? 1;

                    return AspectRatio(
                      aspectRatio: ratio,
                      child: Image.network(
                        url,
                        loadingBuilder: (context, child, loadingProgress) {
                          return Container(
                            color: context.theme.colors.menu.background,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      UserWidget(
                        id: item.userId,
                        name: item.user,
                        avatarUrl: item.userImageUrl,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: context.theme.colors.menu.background, borderRadius: BorderRadius.circular(20)),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: BadgeWidget(
                                    title: S.of(context).likes,
                                    subtitle: "${item.likes ?? 0}",
                                  ),
                                ),
                                const VerticalDivider(indent: 10, endIndent: 10, width: 20),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: BadgeWidget(
                                    title: S.of(context).views,
                                    subtitle: "${item.views ?? 0}",
                                  ),
                                ),
                                const VerticalDivider(indent: 10, endIndent: 10, width: 20),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: BadgeWidget(
                                    title: S.of(context).comments,
                                    subtitle: "${item.comments ?? 0}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Builder(
                  builder: (context) {
                    final items = item.sizes;

                    if (items.isEmpty) return const SizedBox();

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            S.of(context).availableSizes,
                            style: context.theme.texts.title3.bold.copyWith(
                              color: context.theme.colors.texts.text1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return Text(
                                "${item.width.toInt()}x${item.height.toInt()}",
                                style: context.theme.texts.body2.bold.copyWith(
                                  color: context.theme.colors.texts.text3,
                                ),
                              );
                            },
                            shrinkWrap: true,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 100),
              ],
            );
          },
        ),
      ),
    );
  }
}
