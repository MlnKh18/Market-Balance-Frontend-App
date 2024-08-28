import 'package:flutter/material.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';

class ExpansionOverlayTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;

  const ExpansionOverlayTile({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  _ExpansionOverlayTileState createState() => _ExpansionOverlayTileState();
}

class _ExpansionOverlayTileState extends State<ExpansionOverlayTile>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isExpanded = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0.0, size.height),
          showWhenUnlinked: false,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Material(
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.children,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleExpansion() {
    if (_isExpanded) {
      _animationController.reverse().then((value) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      _animationController.forward();
    }
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: ListTile(
        leading: const Icon(
          Icons.location_on,
          color: secondaryColor,
        ),
        title: widget.title,
        trailing: Icon(
          _isExpanded
              ? Icons.keyboard_arrow_down_outlined
              : Icons.arrow_forward_ios_rounded,
        ),
        onTap: _toggleExpansion,
      ),
    );
  }
}
