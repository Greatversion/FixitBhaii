import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/routes/app.routes.gr.dart';
import '../utils/reusable_widgets/service_dialog.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom();

  @override
  List<CustomRoute> get routes => [
        CustomRoute(
          page: Mainscreen.page,
          initial: true,
          children: [
            CustomRoute(
              page: HomeRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              durationInMilliseconds: 300, // Increased duration
            ),
            CustomRoute(
              page: ServiceRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              durationInMilliseconds: 300, // Increased duration
            ),
          ],
        ),
        CustomRoute(
          page: VendorRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds:
              300, // Slightly slower transition for SearchRoute
        ),
        CustomRoute(
          page: RefurbishedItemRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds:
              300, // Slightly slower transition for SearchRoute
        ),
        CustomRoute(
          page: OffersRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds:
              300, // Slightly slower transition for SearchRoute
        ),
        CustomRoute(
          page: CategoryRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds:
              300, // Slightly slower transition for SearchRoute
        ),
        CustomRoute(
          page: ServiceDisplayRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds:
              300, // Slightly slower transition for SearchRoute
        ),
        CustomRoute(
          page: ProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds:
              300, // Slightly slower transition for SearchRoute
        ),
        CustomRoute(
          page: SearchRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds:
              500, // Slightly slower transition for SearchRoute
        ),
      ];
}
