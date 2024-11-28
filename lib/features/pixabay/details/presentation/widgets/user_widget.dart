import 'package:flutter/material.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';

class UserWidget extends StatelessWidget {
  final int? id;
  final String? avatarUrl;
  final String? name;

  const UserWidget({
    required this.id,
    this.avatarUrl,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userImageUrl = avatarUrl;
    final user = name;

    return Row(
      children: [
        if (userImageUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.network(
              userImageUrl,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey,
                );
              },
            ),
          ),
        if (user != null) ...[
          const SizedBox(width: 10),
          Text(
            user,
            style: context.theme.texts.title3.medium.copyWith(
              color: context.theme.colors.texts.text5,
            ),
          ),
        ]
      ],
    );
  }
}
