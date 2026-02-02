import 'package:faym/models/collection_model.dart';
import 'package:flutter/material.dart';

const int _kMaxVisibleImages = 4;

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
    required this.collection,
    required this.isExpanded,
    required this.onTap,
  });

  final Collection collection;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAlias,

      child: Column(
        mainAxisSize: .min,
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      collection.title,
                      style: TextStyle(fontWeight: .w600),
                    ),
                  ),
                  AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 28,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: isExpanded ? _buildProductRow(context) : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

    Widget _buildProductRow(BuildContext context) {
    final urls = collection.imageUrls;
    if (urls.isEmpty) {
      return const Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SizedBox(height: 80),
      );
    }

    
    final visibleCount = urls.length > _kMaxVisibleImages ? _kMaxVisibleImages : urls.length;
    final remainingCount = urls.length - visibleCount;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SizedBox(
        height: 96,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: visibleCount,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final isLast = index == visibleCount - 1;
            final showOverlay = isLast && remainingCount > 0;
            return SizedBox(
              width: 96,
              height: 96,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      urls[index],
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _buildPlaceholder(context),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return _buildPlaceholder(context);
                      },
                    ),
                  ),
                  if (showOverlay) _buildMoreOverlay(remainingCount),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.image_not_supported_outlined,
        size: 32,
        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
      ),
    );
  }

  Widget _buildMoreOverlay(int count) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
          color: Colors.black54,
        ),
        child: Text(
          '+$count',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

