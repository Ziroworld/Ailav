import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:ailav/features/cart/domain/use_case/add_product_usecase.dart';
import 'package:ailav/features/cart/domain/use_case/clear_cart_usecase.dart';
import 'package:ailav/features/cart/domain/use_case/get_cart_usecase.dart';
import 'package:ailav/features/cart/domain/use_case/remove_product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddProductUsecase addProductUsecase;
  final RemoveProductUsecase removeProductUsecase;
  final ClearCartUsecase clearCartUsecase;
  final GetCartUsecase getCartUsecase;

  CartBloc({
    required this.addProductUsecase,
    required this.removeProductUsecase,
    required this.clearCartUsecase,
    required this.getCartUsecase,
  }) : super(CartState.initial()) {
    on<LoadCartEvent>(_onLoadCart);
    on<AddProductToCartEvent>(_onAddProduct);
    on<RemoveProductFromCartEvent>(_onRemoveProduct);
    on<ClearCartEvent>(_onClearCart);
    add(const LoadCartEvent(userId: "rohan123"));
  }

  Future<void> _onLoadCart(LoadCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result =
        await getCartUsecase.call(GetCartParams(userId: event.userId));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (cartItems) => emit(state.copyWith(isLoading: false, items: cartItems)),
    );
  }

  Future<void> _onAddProduct(
      AddProductToCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await addProductUsecase.call(
      AddProductParams(
        productId: event.productId,
        userId: event.userId,
        productName: event.productName,
        productPrice: event.productPrice,
        productQuantity: event.productQuantity,
      ),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false));
      },
    );
    add(LoadCartEvent(userId: event.userId));
  }

  Future<void> _onRemoveProduct(
      RemoveProductFromCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await removeProductUsecase.call(
      RemoveProductParams(
        productId: event.productId,
        userId: event.userId,
        productName: event.productName,
        productPrice: event.productPrice,
        productQuantity: event.productQuantity,
      ),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false));
      },
    );
    add(LoadCartEvent(userId: event.userId));
  }

  Future<void> _onClearCart(
      ClearCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await clearCartUsecase.call(
      ClearCartParams(userId: event.userId),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false, items: []));
      },
    );
  }
}
