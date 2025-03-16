// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:fixitbhai/utils/offerScreen.dart' as _i4;
import 'package:fixitbhai/utils/reusable_widgets/service_dialog.dart' as _i13;
import 'package:fixitbhai/views/categoryScreen.dart' as _i1;
import 'package:fixitbhai/views/homeScreen.dart' as _i2;
import 'package:fixitbhai/views/mainScreen.dart' as _i3;
import 'package:fixitbhai/views/profileScreen.dart' as _i5;
import 'package:fixitbhai/views/refurbishedItemScreen.dart' as _i6;
import 'package:fixitbhai/views/searchScreen.dart' as _i7;
import 'package:fixitbhai/views/serviceDisplayScreen.dart' as _i8;
import 'package:fixitbhai/views/serviceScreen.dart' as _i9;
import 'package:fixitbhai/views/vendorScreen.dart' as _i10;
import 'package:flutter/material.dart' as _i12;

/// generated route for
/// [_i1.CategoryScreen]
class CategoryRoute extends _i11.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({
    _i12.Key? key,
    required String categoryName,
    required List<_i13.Service> services,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CategoryRoute.name,
          args: CategoryRouteArgs(
            key: key,
            categoryName: categoryName,
            services: services,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoryRouteArgs>();
      return _i1.CategoryScreen(
        key: args.key,
        categoryName: args.categoryName,
        services: args.services,
      );
    },
  );
}

class CategoryRouteArgs {
  const CategoryRouteArgs({
    this.key,
    required this.categoryName,
    required this.services,
  });

  final _i12.Key? key;

  final String categoryName;

  final List<_i13.Service> services;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, categoryName: $categoryName, services: $services}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.Mainscreen]
class Mainscreen extends _i11.PageRouteInfo<void> {
  const Mainscreen({List<_i11.PageRouteInfo>? children})
      : super(
          Mainscreen.name,
          initialChildren: children,
        );

  static const String name = 'Mainscreen';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.Mainscreen();
    },
  );
}

/// generated route for
/// [_i4.OffersScreen]
class OffersRoute extends _i11.PageRouteInfo<OffersRouteArgs> {
  OffersRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          OffersRoute.name,
          args: OffersRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OffersRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<OffersRouteArgs>(orElse: () => const OffersRouteArgs());
      return _i4.OffersScreen(key: args.key);
    },
  );
}

class OffersRouteArgs {
  const OffersRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'OffersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i6.RefurbishedItemScreen]
class RefurbishedItemRoute
    extends _i11.PageRouteInfo<RefurbishedItemRouteArgs> {
  RefurbishedItemRoute({
    _i12.Key? key,
    required Map<String, dynamic> item,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RefurbishedItemRoute.name,
          args: RefurbishedItemRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'RefurbishedItemRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RefurbishedItemRouteArgs>();
      return _i6.RefurbishedItemScreen(
        key: args.key,
        item: args.item,
      );
    },
  );
}

class RefurbishedItemRouteArgs {
  const RefurbishedItemRouteArgs({
    this.key,
    required this.item,
  });

  final _i12.Key? key;

  final Map<String, dynamic> item;

  @override
  String toString() {
    return 'RefurbishedItemRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [_i7.SearchScreen]
class SearchRoute extends _i11.PageRouteInfo<void> {
  const SearchRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.SearchScreen();
    },
  );
}

/// generated route for
/// [_i8.ServiceDisplayScreen]
class ServiceDisplayRoute extends _i11.PageRouteInfo<ServiceDisplayRouteArgs> {
  ServiceDisplayRoute({
    _i12.Key? key,
    required String serviceName,
    required String serviceImage,
    required String description,
    required String duration,
    required double price,
    required List<Map<String, String>> faqs,
    required List<String> diyTips,
    required List<String> uniqueFeatures,
    required List<Map<String, dynamic>> vendors,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ServiceDisplayRoute.name,
          args: ServiceDisplayRouteArgs(
            key: key,
            serviceName: serviceName,
            serviceImage: serviceImage,
            description: description,
            duration: duration,
            price: price,
            faqs: faqs,
            diyTips: diyTips,
            uniqueFeatures: uniqueFeatures,
            vendors: vendors,
          ),
          initialChildren: children,
        );

  static const String name = 'ServiceDisplayRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServiceDisplayRouteArgs>();
      return _i8.ServiceDisplayScreen(
        key: args.key,
        serviceName: args.serviceName,
        serviceImage: args.serviceImage,
        description: args.description,
        duration: args.duration,
        price: args.price,
        faqs: args.faqs,
        diyTips: args.diyTips,
        uniqueFeatures: args.uniqueFeatures,
        vendors: args.vendors,
      );
    },
  );
}

class ServiceDisplayRouteArgs {
  const ServiceDisplayRouteArgs({
    this.key,
    required this.serviceName,
    required this.serviceImage,
    required this.description,
    required this.duration,
    required this.price,
    required this.faqs,
    required this.diyTips,
    required this.uniqueFeatures,
    required this.vendors,
  });

  final _i12.Key? key;

  final String serviceName;

  final String serviceImage;

  final String description;

  final String duration;

  final double price;

  final List<Map<String, String>> faqs;

  final List<String> diyTips;

  final List<String> uniqueFeatures;

  final List<Map<String, dynamic>> vendors;

  @override
  String toString() {
    return 'ServiceDisplayRouteArgs{key: $key, serviceName: $serviceName, serviceImage: $serviceImage, description: $description, duration: $duration, price: $price, faqs: $faqs, diyTips: $diyTips, uniqueFeatures: $uniqueFeatures, vendors: $vendors}';
  }
}

/// generated route for
/// [_i9.ServiceScreen]
class ServiceRoute extends _i11.PageRouteInfo<void> {
  const ServiceRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ServiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.ServiceScreen();
    },
  );
}

/// generated route for
/// [_i10.VendorScreen]
class VendorRoute extends _i11.PageRouteInfo<void> {
  const VendorRoute({List<_i11.PageRouteInfo>? children})
      : super(
          VendorRoute.name,
          initialChildren: children,
        );

  static const String name = 'VendorRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.VendorScreen();
    },
  );
}
