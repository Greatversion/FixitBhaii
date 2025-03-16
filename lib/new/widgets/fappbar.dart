import 'package:fixitbhai/new/colors.dart';
import 'package:fixitbhai/new/example_data.dart';
import 'package:fixitbhai/new/helper/helper.dart';
// import 'package:fixitbhai/new/widgets/discount_card.dart';
// import 'package:fixitbhai/new/widgets/ficon_button.dart';
import 'package:fixitbhai/new/widgets/header_clip.dart';
import 'package:fixitbhai/new/widgets/promo_text.dart';
import 'package:flutter/material.dart';

class FAppBar extends SliverAppBar {
  final PageData data;
  final BuildContext context;
  final bool isCollapsed;
  final double expandedHeight;
  final double collapsedHeight;
  final ScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;

  FAppBar({
    required this.data,
    required this.context,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.scrollController,
    required this.onCollapsed,
    required this.onTap,
    required this.tabController,
  }) : super(elevation: 4.0, pinned: true, forceElevated: true);

  @override
  Color? get backgroundColor => scheme.surface;

  @override
  Widget? get leading {
    return Center(
      child: IconButton(
        onPressed: () {},
        // backgroundColor: backgroundColor,
        icon: Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  List<Widget>? get actions {
    return [
      IconButton(
        // backgroundColor: backgroundColor,
        onPressed: () {},
        icon: Icon(Icons.share_outlined),
      ),
      IconButton(
        // backgroundColor: backgroundColor,
        onPressed: () {},
        icon: Icon(Icons.info_outline),
      ),
    ];
  }

  @override
  Widget? get title {
    var textTheme = Theme.of(context).textTheme;
    return AnimatedOpacity(
      opacity: this.isCollapsed ? 0 : 1,
      duration: const Duration(milliseconds: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hii",
            style: textTheme.titleMedium?.copyWith(color: scheme.onSurface),
            strutStyle: Helper.buildStrutStyle(textTheme.titleMedium),
          ),
          const SizedBox(height: 4.0),
          Text(
            data.deliverTime,
            style: textTheme.bodySmall?.copyWith(color: scheme.primary),
            strutStyle: Helper.buildStrutStyle(textTheme.bodySmall),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        color: scheme.surface,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          indicatorColor: scheme.primary,
          labelColor: scheme.primary,
          unselectedLabelColor: scheme.onSurface,
          indicatorWeight: 3.0,
          tabs: data.categories.map((e) {
            return Tab(text: e.title);
          }).toList(),
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final top = constraints.constrainHeight();
        final collapsedHight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });

        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Column(
            children: [
              Stack(
                children: [
                  PromoText(title: data.bannerText),
                  Column(
                    children: [
                      HeaderClip(data: data, context: context),
                    ],
                  ),
                ],
              ),
              // DiscountCard(
              //   title: data.optionalCard.title,
              //   subtitle: data.optionalCard.subtitle,
              // ),
            ],
          ),
        );
      },
    );
  }
}
