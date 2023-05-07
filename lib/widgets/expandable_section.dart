import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget body;

  const ExpandableSection({required this.title, required this.body, super.key});

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ExpansionPanelList(
            animationDuration: const Duration(milliseconds: 300),
            expandedHeaderPadding: const EdgeInsets.only(top: 8, bottom: 8),
            expansionCallback: (_, isExpanded) => setState(() {
              expanded = !isExpanded;
            }),
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, _) => Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                  child: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                body: expanded
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: widget.body,
                        ),
                      )
                    : const SizedBox.shrink(),
                isExpanded: expanded,
                canTapOnHeader: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
