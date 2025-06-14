import 'package:flutter/material.dart';

class CommonDetailsListTile extends StatelessWidget {
  final String? title;
  final String subtitle;
  final bool hasLeadingIcon;
  final Widget? leadingIcon;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const CommonDetailsListTile({
    super.key,
    this.title,
    required this.subtitle,
    this.hasLeadingIcon = false,
    this.leadingIcon,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hasLeadingIcon
              ? (leadingIcon ?? Icon(Icons.error, color: Colors.red))
              : Text(
                title ?? '',
                style:
                    titleStyle ??
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
              ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              subtitle,
              style:
                  subtitleStyle ??
                  TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
