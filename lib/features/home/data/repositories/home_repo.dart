import 'package:bookia_app/core/network/apis.dart';
import 'package:bookia_app/core/network/dio_helper.dart';
import 'package:bookia_app/features/home/data/model/best_seller/best_seller.dart';
import 'package:bookia_app/features/home/data/model/slider_response/slider_response.dart';

class HomeRepo {
  static Future<SliderResponse?> getSlider() async {
    try {
      var response = await DioHelper.get(endPoint: Apis.sliders);
      if (response.statusCode == 200) {
        return SliderResponse.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<BestSeller?> bestseller() async {
    try {
      var response = await DioHelper.get(endPoint: Apis.productsBestseller);
      if (response.statusCode == 200) {
        return BestSeller.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
