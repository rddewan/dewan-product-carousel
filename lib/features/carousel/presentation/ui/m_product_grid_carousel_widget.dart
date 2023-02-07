
part of dewan_product_carousel;

class MProductGridCarouselWidget extends StatefulWidget {
  final List<MProductModel> products;  
  final void Function(int) onTap;
  final int dotCount;
  final double boxWidth;
  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final double cardElevation;
  final double cardBorderRadius;
  final Image? currencyIcon; 
  final String? outOfStockText;
  final String? brandLabel;
  final TextStyle? brandTextStyle;
  final TextStyle? productNameTextStyle;
  final TextStyle? productTypeTextStyle;
  final TextStyle? outOfStockTextStyle;
  final TextStyle? priceTextStyle;
  final Color activeDotColor;
  final Color? productTypeBackgroundColor;
  final bool isAutoScroll;
 
   MProductGridCarouselWidget({
    required this.products,    
    required this.activeDotColor,
    required this.boxWidth,
    this.width,
    this.height,
    this.imageWidth,
    this.imageHeight,
    required this.cardElevation,
    required this.cardBorderRadius,
    required this.onTap,
    required this.dotCount,
    this.currencyIcon,    
    this.outOfStockText,
    this.brandLabel,
    this.brandTextStyle,
    this.productNameTextStyle,
    this.productTypeTextStyle,
    this.outOfStockTextStyle,
    this.priceTextStyle,
    this.productTypeBackgroundColor, 
    this.isAutoScroll = true,  
    Key? key,
  }) : assert(products.isNotEmpty), super(key: key);

  @override
  State<MProductGridCarouselWidget> createState() => _MProductGridCarouselWidgetState();
}

class _MProductGridCarouselWidgetState extends State<MProductGridCarouselWidget> {
  late ScrollController _scrollController;
  late Timer timer;  
  int currentDotPosition = 0;
  // Get device width
  double deviceWidth = 0; 
  // Current scroll position is always 0 so we need to add device width
  // to set scroll position to end of device
  double currentPosition = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(); 
     onScroll(); 
    // enable or disable auto scroll
    if(widget.isAutoScroll) {     
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        autoScroll();  
      },);
    }     
    
  }  

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void autoScroll() {
    deviceWidth = MediaQuery.of(context).size.width;   

    timer = Timer.periodic(const Duration(seconds: 3), ((timer) {   
      currentPosition = _scrollController.position.pixels + deviceWidth;
      final maxExtend = _scrollController.position.maxScrollExtent;

      // If the current position is > device width , calculate the dot position
      if (currentPosition >= maxExtend) {
        setState(() {
            _scrollController.jumpTo(0);
            currentDotPosition = 0;
          });
      } else {
        // Divide current scroll position by device width to get dot position
        final dotPosition = currentPosition / deviceWidth ;
        // Position must be less the dot count
        if (dotPosition < widget.dotCount) {
          // Update dot position         
          setState(() {
            _scrollController.jumpTo(currentPosition);
            currentDotPosition = dotPosition.floor();
          });
        }       
       
      }
      
    }),);
  }

  void onScroll() {
    _scrollController.addListener(() {
      // Get device width
      final deviceWidth = MediaQuery.of(context).size.width;
      // Current scroll position is always 0 so we need to add device width
      // to set scroll position to end of device
      final currentPosition = _scrollController.position.pixels + deviceWidth;

      // If the current position is > device width , calculate the dot position
      if (currentPosition > deviceWidth) {
        // Divide current scroll position by device width to get dot position
        final dotPosition = currentPosition / deviceWidth;
        // Position must be less the dot count
        if (dotPosition < widget.dotCount) {
          // Update dot position
          setState(() {
            currentDotPosition = dotPosition.floor();
          });
        }
      } else {
        // update dot position to 0
        setState(() {
          currentDotPosition = 0;
        });
       
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(     
      mainAxisSize: MainAxisSize.min,
      children: [                
        SizedBox(          
          height: widget.height,
          child: GridView.builder(            
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.products.length,                       
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final data = widget.products[index];
        
              return GestureDetector(
                onTap: () => widget.onTap(data.id),
                child: Card(                    
                  elevation: widget.cardElevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.cardBorderRadius),
                  ),
                  child: Column(                     
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MImageWidget(
                        imageHeight: widget.imageHeight,
                        imageWidth: widget.imageWidth,
                        qty: data.quantity,
                        url: data.productImage, 
                        label: widget.outOfStockText ?? '-', 
                        style: widget.outOfStockTextStyle,
                        hasOffer: data.hasOffer,
                        offerUrl: data.offerUrl,
                      ),
        
                      const SizedBox(
                        height: kXSmall,
                      ),
        
                      Padding(
                        padding: const EdgeInsets.only(left: kXSmall,right: kXSmall),
                        child: Container(
                          decoration:  BoxDecoration(
                            color: widget.productTypeBackgroundColor ?? Colors.grey[100],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(kXSmall),),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(kXXSmall),
                            child: Text(
                              data.category ?? '-' ,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: widget.productTypeTextStyle,
                            ),
                          ),
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.only(left: kXSmall,right: kXSmall),
                        child: Text(
                          data.productName ?? '-',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: widget.productNameTextStyle,
                        ),
                      ),
                      
                      if (widget.brandLabel != null) ... [
                        Padding(
                          padding: const EdgeInsets.only(left: kXSmall,right: kXSmall),
                          child: Text(
                            '${widget.brandLabel} ${data.brand}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: widget.brandTextStyle,
                          ),
                        ), 
                      ],
                      
                      Padding(
                        padding: const EdgeInsets.only(left: kXSmall,right: kXSmall),
                        child: Row(
                          children: [                              
                            
                            if (data.discount != "0")...[
        
                              Text(
                                data.discountedPrice,
                                style: widget.priceTextStyle,
                              ),
        
                              const SizedBox(width: kXSmall,),
        
                              Text(
                                data.price,
                                style: Theme.of(context).textTheme.caption?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
        
                              const SizedBox(width: kXSmall,),
        
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.pink[50],
                                  borderRadius: const BorderRadius.all(Radius.circular(kSmall)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(kXSmall),
                                  child: Text(
                                    '-${data.discount}%',
                                    style: Theme.of(context).textTheme.caption?.copyWith(
                                      color: Colors.redAccent[400],
                                    ),
                                  ),
                                ),
                              ),
        
                            ]
                            else ... [
                              Text(
                                data.price,
                                style: widget.priceTextStyle,
                              ),
                            ]    
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        
        if(widget.dotCount <= 0) ...[
          const SizedBox()                  
        ]
        else ...[
          DotsIndicator(
            dotsCount: widget.dotCount,
            position: currentDotPosition.toDouble(),
            decorator: DotsDecorator(
              activeColor: widget.activeDotColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),),
            ),
          )

        ]                  
      ],
    );
  }
}
