import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pixabay_flutter/core/data/di/dependency_container.dart';
import 'package:pixabay_flutter/core/presentation/routes/app_router.gr.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';
import 'package:pixabay_flutter/core/presentation/widgets/buttons/button_builder.dart';
import 'package:pixabay_flutter/core/presentation/widgets/placeholders/failure_widget.dart';
import 'package:pixabay_flutter/core/presentation/widgets/placeholders/loading_widget.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/models/pixabay_image_model.dart';
import 'package:pixabay_flutter/features/pixabay/search/presentation/bloc/pixabay_search_bloc.dart';
import 'package:pixabay_flutter/l10n/generated/l10n.dart';

@RoutePage()
class PixabaySearchPage extends StatefulWidget {
  const PixabaySearchPage({super.key});

  @override
  State<PixabaySearchPage> createState() => _PixabaySearchPageState();
}

class _PixabaySearchPageState extends State<PixabaySearchPage> {
  final bloc = sl.get<PixabaySearchBloc>();

  final PagingController<int, PixabayImageModel> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_fetchPage);
  }

  _fetchPage(int pageKey) {
    bloc.add(const PixabaySearchEvent.fetch());
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(const PixabaySearchEvent.init()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<PixabaySearchBloc, PixabaySearchState>(
            listenWhen: (previous, current) => previous.images != current.images,
            listener: (context, state) {
              try {
                _pagingController.itemList = [];

                final isLastPage = !state.images.hasNext;
                if (isLastPage) {
                  _pagingController.appendLastPage(state.images.items);
                } else {
                  _pagingController.appendPage(state.images.items, state.images.page);
                }
              } catch (error) {
                _pagingController.error = error;
              }
            },
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            title: TextField(
              onChanged: (value) => bloc.add(PixabaySearchEvent.queryUpdated(value)),
              decoration: InputDecoration(
                hintText: S.of(context).search,
              ),
            ),
          ),
          body: BlocBuilder<PixabaySearchBloc, PixabaySearchState>(
            builder: (context, state) {
              if (state.status == PixabaySearchStatus.loading) {
                return const LoadingWidget();
              }

              if (state.status == PixabaySearchStatus.error) {
                return FailureWidget(
                  onTap: () => bloc.add(const PixabaySearchEvent.init()),
                  failure: state.failure,
                );
              }

              final items = state.images.items;

              return PagedMasonryGridView<int, PixabayImageModel>.count(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate(
                  animateTransitions: true,
                  firstPageProgressIndicatorBuilder: (context) {
                    return const SizedBox();
                  },
                  noItemsFoundIndicatorBuilder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).search,
                          style: context.theme.texts.title3.regular.copyWith(
                            color: context.theme.colors.texts.text1,
                          ),
                        ),
                        Text(
                          S.of(context).inputRequest,
                          style: context.theme.texts.body1.regular.copyWith(
                            color: context.theme.colors.texts.text5,
                          ),
                        ),
                      ],
                    );
                  },
                  itemBuilder: (context, item, index) {
                    final item = items[index];
                    final url = item.previewUrl;
                    if (url == null) {
                      return Container(
                        color: Colors.grey,
                      );
                    }
                    return ButtonBuilders.base(
                      onTap: () => context.router.push(PixabayDetailsRoute(id: item.id)),
                      child: Image.network(url, fit: BoxFit.cover),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
