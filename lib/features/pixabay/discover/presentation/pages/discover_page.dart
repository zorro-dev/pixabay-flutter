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
import 'package:pixabay_flutter/features/pixabay/discover/presentation/bloc/discover_bloc.dart';

@RoutePage()
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final bloc = sl.get<DiscoverBloc>();

  final PagingController<int, PixabayImageModel> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_fetchPage);
  }

  _fetchPage(int pageKey) {
    bloc.add(const DiscoverEvent.fetch());
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(const DiscoverEvent.init()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<DiscoverBloc, DiscoverState>(
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
            actions: [
              ButtonBuilders.base(
                onTap: () => context.router.push(const PixabaySearchRoute()),
                child: Icon(
                  Icons.search,
                  color: context.theme.colors.appBar.icon,
                ),
              ),
              const SizedBox(width: 10),
              ButtonBuilders.settings(
                onTap: () => context.router.push(const SettingsDashboardRoute()),
                color: context.theme.colors.appBar.icon,
              ),
            ],
          ),
          body: BlocBuilder<DiscoverBloc, DiscoverState>(
            builder: (context, state) {
              if (state.status == DiscoverStatus.loading) {
                return const LoadingWidget();
              }

              if (state.status == DiscoverStatus.error) {
                return FailureWidget(
                  onTap: () => bloc.add(const DiscoverEvent.init()),
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
