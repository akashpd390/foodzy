import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodzy/domain/category_vendors_list/models/vendors_model.dart';
import 'package:foodzy/persentation/vendor_screen/bloc/cart_cubit.dart';

import 'package:foodzy/persentation/vendor_screen/bloc/products_cubit.dart';
import 'package:foodzy/persentation/vendor_screen/bloc/state/cart_state.dart';
import 'package:foodzy/persentation/vendor_screen/bloc/state/products_state.dart';
import 'package:foodzy/persentation/vendor_screen/widget/cart_bar_widget.dart';
import 'package:foodzy/persentation/vendor_screen/widget/category_list.dart';
import 'package:foodzy/persentation/vendor_screen/widget/vendors_header_widget.dart';

////
///
///
///
///             Vendors Detail Page that shows the details of the vendor
///
///
///
/// /// This page includes a floating action button that opens an animated overlay
class VendorsDetailPage extends StatefulWidget {
  final VendorModel vendors;
  const VendorsDetailPage({super.key, required this.vendors});

  @override
  State<VendorsDetailPage> createState() => _VendorsDetailPageState();
}

class _VendorsDetailPageState extends State<VendorsDetailPage>
    with SingleTickerProviderStateMixin {
  ////
  ///
  ///     /// This is the state class for VendorsDetailPage that manages the overlay animation
  ///
  ///
  late final OverlayPortalController _overlayController;
  late final AnimationController _animController;
  late final Animation<double> _scale;
  late final Animation<double> _fade;
  late final Animation<double> _padding;

  // Height of the cart summary bar at the bottom of the screen
  // This is used to animate the position of the cart summary bar
  final double _cartSummaryHeight = 90.0;

  ///
  ///
  ///
  /// initializes the overlay controller and animation controller
  @override
  void initState() {
    super.initState();
    _overlayController = OverlayPortalController();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scale = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutBack),
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeIn),
    );

    _padding = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

// Toggles the overlay visibility and controls the animation.
  ///
  void _toggleOverlay() {
    if (_overlayController.isShowing) {
      _animController.reverse();
      Future.delayed(const Duration(milliseconds: 200), () {
        _overlayController.hide();
      });
    } else {
      _overlayController.show();
      _animController.forward(from: 0);
    }
  }

  ///
  ///
  ///
  ///
//Clean up the animation controller when the widget is disposed.
//
  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

//
////
  ///
  ///Builld
//
  @override
  Widget build(BuildContext context) {
    bool isCartEmpty = context.watch<CartCubit>().isCartEmpty;
    return Scaffold(
      appBar: _appBar(),
      body: _body(isCartEmpty),

      // Floating Action Button for 'Menu'
      floatingActionButton: floatingActionButton(isCartEmpty),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

// BODY of the page
  Stack _body(bool isCartEmpty) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: _cartSummaryHeight),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VendorHeader(
                  title: widget.vendors.name,
                  address: widget.vendors.address,
                  time: widget.vendors.meta?.time,
                  ratings: widget.vendors.ratings,
                ),
                const SizedBox(height: 20),
                BlocBuilder<ProductCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductsError) {
                      return Center(child: Text(state.message));
                    } else if (state is ProductsLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final category = state.products[index];
                          return CategoryList(category: category);
                        },
                      );
                    }
                    return const Center(
                        child: Text("Menu Categories will be displayed here"));
                  },
                ),
              ],
            ),
          ),
        ),

        // Cart Summary Bar: fixed to bottom of screen
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final isVisible = state is CartUpdated && state.items.isNotEmpty;

            return AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: isVisible ? 0 : -_cartSummaryHeight,
              height: _cartSummaryHeight,
              child: GestureDetector(
                onTap: _toggleOverlay,
                child: const CartSummary(),
              ),
            );
          },
        ),
      ],
    );
  }

// app Bar of page
  AppBar _appBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          // Navigator.of(context).pop(); // Example: go back
        },
      ),
      backgroundColor: Colors.white,
      elevation: 0, // No shadow for the app bar
      toolbarHeight: 56, // Standard toolbar height
    );
  }

//
// Floating Action Button with animated overlay for menu options
  AnimatedPadding floatingActionButton(bool isCartEmpty) {
    return AnimatedPadding(
      curve: Curves.easeInOut,
      duration: const Duration(microseconds: 300),
      padding:
          EdgeInsets.only(bottom: isCartEmpty ? 20 : _cartSummaryHeight + 16),
      child: FloatingActionButton.extended(
        onPressed: _toggleOverlay,
        icon: const Icon(Icons.restaurant),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        label: OverlayPortal(
          controller: _overlayController,
          overlayChildBuilder: (_) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: AnimatedBuilder(
                  animation: _animController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fade.value,
                      child: Transform.scale(
                        scale: _scale.value,
                        child: Padding(
                            padding: EdgeInsets.only(
                              bottom: isCartEmpty
                                  ? _padding.value
                                  : _cartSummaryHeight + _padding.value,
                            ),
                            child: child),
                      ),
                    );
                  },
                  child: fabMenus(),
                ),
              ),
            );
          },
          child: const Text("Menu"),
        ),
      ),
    );
  }

//
//
// menu optins
  Container fabMenus() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,

      // TODO : implemet the menu lists buttonns
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _menuButtons("Pizza", null),
          _menuButtons("Burger", null),
          _menuButtons("Sandwhich", null),
        ],
      ),
    );
  }

  ///
  ///
  ///menu buttons widget
  Widget _menuButtons(String title, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
