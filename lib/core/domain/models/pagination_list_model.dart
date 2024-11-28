enum PaginationListStatus {
  initial,
  loading,
  display,
  error,
}

class PaginationListModel<T> {
  final PaginationListStatus status;

  final List<T> items;

  final int page;
  final int perPage;
  final int total;

  const PaginationListModel({
    required this.status,
    required this.items,
    required this.page,
    required this.perPage,
    required this.total,
  });

  const PaginationListModel.pure()
      : items = const [],
        status = PaginationListStatus.initial,
        page = 1,
        perPage = 20,
        total = 99999;

  bool get hasNext => page * perPage < total;
  bool get shouldPaginate => hasNext && status != PaginationListStatus.loading;

  PaginationListModel<T> copyWith({
    PaginationListStatus? status,
    List<T>? items,
    int? page,
    int? perPage,
    int? total,
  }) {
    return PaginationListModel<T>(
      items: items ?? this.items,
      status: status ?? this.status,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
    );
  }
}
