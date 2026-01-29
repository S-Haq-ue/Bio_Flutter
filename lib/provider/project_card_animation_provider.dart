import 'package:flutter/material.dart';

class ProjectCardAnimationProvider extends ChangeNotifier {
  late List<AnimationController> _forwardControllers;
  late List<AnimationController> _reverseControllers;
  late List<Animation<double>> _forwardAnimations;
  late List<Animation<double>> _reverseAnimations;
  late List<int> _currentAnimationState; // 0: idle, 1: playing forward, -1: playing reverse
  late TickerProvider _vsync;

  List<Animation<double>> get forwardAnimations => _forwardAnimations;
  List<Animation<double>> get reverseAnimations => _reverseAnimations;
  List<int> get currentAnimationState => _currentAnimationState;

  ProjectCardAnimationProvider({
    required int cardCount,
    required TickerProvider vsync,
  }) {
    _vsync = vsync;
    _initializeAnimations(cardCount);
  }

  void _initializeAnimations(int cardCount) {
    _currentAnimationState = List.filled(cardCount, 0);

    _forwardControllers = List.generate(
      cardCount,
      (index) => AnimationController(
        duration: Duration(milliseconds: 800 + (index * 120)),
        vsync: _vsync,
      ),
    );

    _reverseControllers = List.generate(
      cardCount,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 350),
        vsync: _vsync,
      ),
    );

    _forwardAnimations = _forwardControllers.map((controller) {
      return Tween<double>(begin: 0.90, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeIn),
      );
    }).toList();

    _reverseAnimations = _reverseControllers.map((controller) {
      return Tween<double>(begin: 1.0, end: 0.90).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut),
      );
    }).toList();

    // Initialize all forward controllers to position 0.0 (begin value = 0.90)
    for (var controller in _forwardControllers) {
      controller.value = 0.0;
    }

    // Initialize all reverse controllers to position 1.0 (end value = 0.90)
    for (var controller in _reverseControllers) {
      controller.value = 1.0;
    }
  }

  void onVisibilityChanged(int index, double visibleFraction) {
    if (visibleFraction > 0.1) {
      // Card is visible - play forward animation
      if (_currentAnimationState[index] != 1) {
        _currentAnimationState[index] = 1;
        _reverseControllers[index].reset();
        _forwardControllers[index].forward();
        notifyListeners();
      }
    } else {
      // Card is invisible - play reverse animation
      if (_currentAnimationState[index] != -1) {
        _currentAnimationState[index] = -1;
        _forwardControllers[index].reset();
        _reverseControllers[index].forward();
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _forwardControllers) {
      controller.dispose();
    }
    for (var controller in _reverseControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
