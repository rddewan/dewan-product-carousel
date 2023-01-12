part of dewan_product_carousel;


class MImageWidget extends StatelessWidget {
  final int qty;
  final double imageWidth;
  final double imageHeight;
  final String? url;
  final String label;
  final TextStyle? style;
  final bool hasOffer;
  final String offerUrl;
  
  const MImageWidget({
    Key? key, 
    required this.qty, 
    required this.imageWidth,
    required this.imageHeight,
    required this.url, 
    required this.label,
    required this.style,
    required this.hasOffer,
    required this.offerUrl,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,      
      children: [
        MCacheImage(
          imageUrl: url,
          width: imageWidth,
          height: imageHeight,
          boxFit: BoxFit.cover,
        ),

        // 
        if (hasOffer)... [
          Positioned(
            top: 4,
            right: 4,
            child: MCacheImage(
              imageUrl: offerUrl,
              width: 50,
              height: 50,
              boxFit: BoxFit.cover,
            ),
          ),

        ],

        /// Check out of stuck
        if (qty == 0)...[
          /// Out of stock background
          Container(
            width: imageWidth,
            height: imageHeight,
            color: Colors.black54.withOpacity(0.1),            
          ),

          /// Out of stock text
          Container(
            decoration: BoxDecoration(
              color: Colors.black54.withOpacity(0.5),
              borderRadius:
                const BorderRadius.all(
                  Radius.circular(kMedium),
                ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: kLarge,
                right: kLarge,
                top: kXSmall,
                bottom: kXSmall,
              ),
              child: Text(
                label,
                style: style,
              ),
            ),
          )
        ]

      ],
    );                           
                          
  }
}