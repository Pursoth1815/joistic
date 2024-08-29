import 'package:flutter/material.dart';
import 'package:joistic/core/constants/app_colors.dart';
import 'package:joistic/core/constants/app_strings.dart';

class AnimatedSearchBox extends StatefulWidget {
  final Function(String)? onTextChanged;
  final Function? onTapClose;

  AnimatedSearchBox({Key? key, this.onTextChanged, this.onTapClose}) : super(key: key);
  @override
  _AnimatedSearchBoxState createState() => _AnimatedSearchBoxState();
}

class _AnimatedSearchBoxState extends State<AnimatedSearchBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _widthAnimation = Tween<double>(begin: 65, end: 250).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _toggleSearchBox() {
    setState(() {
      if (_isExpanded) {
        _controller.reverse();
        if (widget.onTapClose != null) {
          widget.onTapClose!();
        }
      } else {
        _controller.forward();
      }
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: _widthAnimation.value,
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 2,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              if (_isExpanded) ...[
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      if (widget.onTextChanged != null) {
                        widget.onTextChanged!(value);
                      }
                    },
                    style: TextStyle(fontSize: 14, color: AppColors.blackLite.withOpacity(0.8)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                      hintStyle: TextStyle(fontSize: 14, color: AppColors.blackLite.withOpacity(0.5)),
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: _toggleSearchBox,
                  ),
                ),
              ] else ...[
                Center(
                  child: IconButton(
                    icon: Image.asset(
                      AppStrings.search_image,
                      width: 20,
                      height: 20,
                    ),
                    onPressed: _toggleSearchBox,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
