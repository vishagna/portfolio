import 'package:flutter/material.dart';

class HoverListTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const HoverListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  State<HoverListTile> createState() => _HoverListTileState();
}

class _HoverListTileState extends State<HoverListTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: _isHovered ? Colors.grey.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Icon(widget.icon,
                color: _isHovered ? Theme.of(context).colorScheme.primary : null),
            title: Text(
              widget.title,
              style: TextStyle(
                fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
                color: _isHovered
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
            subtitle: Text(widget.subtitle),
          ),
        ),
      ),
    );
  }
}
