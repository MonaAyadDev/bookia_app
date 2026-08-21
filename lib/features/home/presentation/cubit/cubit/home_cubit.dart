import 'package:bookia_app/features/home/data/model/best_seller/best_seller.dart';
import 'package:bookia_app/features/home/data/model/best_seller/product.dart';
import 'package:bookia_app/features/home/data/model/slider_response/slider.dart';
import 'package:bookia_app/features/home/data/model/slider_response/slider_response.dart';
import 'package:bookia_app/features/home/data/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<SliderModel>? sliders = [];
  List<Product>? products = [];

  // 🔧 غيّري القيمة دي لـ false لما السيرفر يتصلح
  static const bool useMockData = true;

  Future<void> initLoad() async {
    emit(HomeLoading());

    if (useMockData) {
      await _loadMockData();
      return;
    }

    var response = await Future.value([
      await HomeRepo.getSlider(),
      await HomeRepo.bestseller(),
    ]);
    var sliderResponse = response[0] as SliderResponse?;
    var bestSellerResponse = response[1] as BestSeller?;
    sliders = sliderResponse?.data?.sliders;
    products = bestSellerResponse?.data?.products;
    if (sliderResponse != null || bestSellerResponse != null) {
      emit(HomeSuccess());
    } else {
      emit(HomeError());
    }
  }

  Future<void> _loadMockData() async {
    await Future.delayed(const Duration(milliseconds: 800));

    sliders = List.generate(
      3,
      (i) => SliderModel(image: 'https://picsum.photos/seed/slider$i/600/300'),
    );

    products = List.generate(
      7,
      (i) => Product(
        id: i,
        name: 'كتاب تجريبي ${i + 1}',
        description: 'وصف تجريبي',
        price: '${100 + i * 10}',
        discount: 0,
        priceAfterDiscount: (100 + i * 10).toDouble(),
        stock: 5,
        bestSeller: 1,
        image: 'https://picsum.photos/seed/book$i/300/300',
        category: 'روايات',
      ),
    );

    emit(HomeSuccess());
  }
}
