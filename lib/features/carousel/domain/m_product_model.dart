part of dewan_product_carousel;

@freezed
class MProductModel with _$MProductModel {    
  const factory MProductModel({
      @Default(0)
      int id,
      String? category,      
      String? brand,
      String? productName,
      String? productImage,
      @Default(0)
      int quantity,
      @Default("")
      String price,
      @Default("")
      String discountedPrice,
      @Default("0")
      String discount,
      @Default(false)
      bool hasOffer,
      @Default("")
      String offerUrl,
  }) = _MProductModel;
  
}