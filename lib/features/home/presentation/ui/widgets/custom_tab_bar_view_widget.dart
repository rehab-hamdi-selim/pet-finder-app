import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabViewWidget<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final String tabName;

  const CustomTabViewWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.tabName,
  });

  @override
  State<CustomTabViewWidget<T>> createState() => _CustomTabViewWidgetState<T>();
}

class _CustomTabViewWidgetState<T> extends State<CustomTabViewWidget<T>>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.items.isEmpty
        ? Center(
            child: Text(
              "No ${widget.tabName} available",
              style: const TextStyle(color: Colors.grey),
            ),
          )
        : ListView.builder(
            key: PageStorageKey(widget.tabName),
            padding: EdgeInsets.only(top: 12.h),
            itemCount: widget.items.length,
            itemBuilder: (context, i) => widget.itemBuilder(widget.items[i]),
          );
  }
}
