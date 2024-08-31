import 'package:flutter/material.dart';
import 'package:tabnews/core/domain/entities/news_entity.dart';
import 'package:tabnews/core/mixin/datetime_mixin.dart';
import 'package:tabnews/core/widgets/card_widget.dart';
import 'package:tabnews/core/widgets/markdown/markdown_viewer_widget.dart';
import 'package:tabnews/core/widgets/spacer_widget.dart';
import 'package:tabnews/core/widgets/text_widget.dart';

class DetailedNewsCardWidget extends StatelessWidget with DateTimeMixin {
  const DetailedNewsCardWidget({
    required this.news,
    super.key,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextWidget(news.ownerUsername, size: TextWidgetSizes.titleMedium),
            const TextWidget(' • ', size: TextWidgetSizes.titleMedium),
            TextWidget(
              getRelativeTime(news.publishedAt),
              size: TextWidgetSizes.titleMedium,
            ),
          ],
        ),
        const SpacerWidget(size: SpacerWidgetSizes.small),
        CardWidget(
          child: MarkdownViewerWidget(data: '# ${news.title}\n${news.body}'),
        ),
      ],
    );
  }
}
