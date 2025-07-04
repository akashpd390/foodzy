import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodzy/domain/category_vendors_list/models/vendors_model.dart';
import 'package:foodzy/persentation/category_vendors_lists/bloc/category_cubit.dart';
import 'package:foodzy/persentation/category_vendors_lists/bloc/state/category_state.dart';
import 'package:foodzy/persentation/category_vendors_lists/bloc/state/vendors_state.dart';
import 'package:foodzy/persentation/category_vendors_lists/bloc/vendors_cubit.dart';
import 'package:foodzy/persentation/category_vendors_lists/widget/category_card.dart';
import 'package:foodzy/persentation/category_vendors_lists/widget/header_widget.dart';
import 'package:foodzy/persentation/category_vendors_lists/widget/search_bar_widget.dart';
import 'package:foodzy/persentation/category_vendors_lists/widget/vendor_card_widget.dart';
import 'package:foodzy/persentation/vendor_screen/bloc/cart_cubit.dart';
import 'package:foodzy/persentation/vendor_screen/bloc/products_cubit.dart';
import 'package:foodzy/persentation/vendor_screen/page/vendor_page.dart';

class CategoryVendPage extends StatelessWidget {
  const CategoryVendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  RefreshIndicator _body(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<CategoryCubit>().fetchCategory(),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          const HeaderWidget(),
          const SliverToBoxAdapter(
            child: SearchBarWidget(),
          ),

          _categoryList(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Restaurants Nearby',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),

          // Vendors List
          _vendorList()
        ],
      ),
    );
  }

  ///
  ///
  ///
  ///             /// This method builds the header widget for the page.
  /// Builds the list of vendors
  BlocBuilder<VendorsCubit, VendorsState> _vendorList() {
    return BlocBuilder<VendorsCubit, VendorsState>(builder: (context, state) {
      if (state is VendorsInitialState) {
        context.read<VendorsCubit>().fetchVendors();
        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      } else if (state is VendorsLoadingState) {
        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      } else if (state is VendorsErrorState) {
        return SliverToBoxAdapter(
          child: Center(child: Text(state.errorMessage)),
        );
      } else if (state is VendorsLoadedState) {
        final vendors = state.vendors;
        if (vendors.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('No vendors found')),
          );
        }

        return _vendorTile(vendors);
      }

      return const SliverToBoxAdapter(
        child: Center(child: Text('Unknown state')),
      );
    });
  }

  ///
  ///
  ///
  ///         /// Builds the list of categories
  BlocBuilder<CategoryCubit, CategoryState> _categoryList() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, categoryState) {
        if (categoryState is CategoryInitial) {
          context.read<CategoryCubit>().fetchCategory();
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (categoryState is CategoryLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (categoryState is CategoryError) {
          return SliverToBoxAdapter(
            child: Center(child: Text(categoryState.message)),
          );
        } else if (categoryState is CategoryLoaded) {
          final categories = categoryState.categories;
          if (categories.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('No categories found')),
            );
          }

          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CategoryCard(category: categories[index]);
                },
                childCount: categories.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
            ),
          );
        }

        return const SliverToBoxAdapter(
          child: Center(child: Text('Unknown state')),
        );
      },
    );
  }

  ///
  ///
  ///
  ///
  ///       /// Builds the list of vendors
  SliverList _vendorTile(List<VendorModel> vendors) {
    return SliverList.builder(
      itemCount: vendors.length,
      itemBuilder: (context, index) => VendorCard(
        vendor: vendors[index],
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => CartCubit(),
                  ),
                  BlocProvider(
                    create: (_) =>
                        ProductCubit()..fetchProducts(vendors[index].id ?? 7),
                  ),
                ],
                child: VendorsDetailPage(vendors: vendors[index]),
              ),
            ),
          )
        },
      ),
    );
  }
}
