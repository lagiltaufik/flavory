import 'package:flavory/core/constants/app_constants.dart';

class NavIndexMapper {
  static int fromLocation(String location) {
    if (location.startsWith(AppConstants.routeSearch)) return 1;
    return 0;
  }
}
