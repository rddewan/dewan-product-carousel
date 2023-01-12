
Dewan Product Carousel: Build a Product Carousel that slide horizontally in a efficient way.

## Features
<img src="https://github.com/rddewan/dewan-product-carousel/blob/main/screenshot/image1.png" width="300" height="400">



## Getting started
Flutter and Dart version : 3.3.10 - 2.18.6
### Install : In your `pubspec.yaml`  under `dependencies:` add the following code to use it directly from git.
```
 dewan_product_carousel:    
    git:
      url:https://github.com/rddewan/dewan-product-carousel
      path: 
```
Once you have installed the package you can import the package as shown below and start using it.

`import 'package:dewan_product_carousel/dewan_product_carousel.dart';`

## Usage

For complete example please check the `/example` folder.

```dart
class _MyHomePageState extends State<MyHomePage> {
  final List<MProductModel> products = const [
    MProductModel(
      id: 1,
      category: "HP",         
      productName: "da 1",
      brand: "Jerhigh",
      productImage: "https://bazar.rdewan.dev/storage/product/images/cdfdd4a6652adad680c769073bb9171d.jpg",
      quantity: 0,
      price: "฿10.20",       
    ),
    MProductModel(
      id: 2,
      category: "Dell",
      productName: "test new today 2",
      brand: "Tree on tree",
      productImage: "https://bazar.rdewan.dev/storage/product/images/e739e85ffd24aee1fd5194e301b8ed51.jpg",
      quantity: 9, 
      price: "฿100.00",
      discountedPrice: "฿50", 
      discount: "50",
      hasOffer: true,
      offerUrl: "https://bazar.rdewan.dev/storage/sales/special-offer.png"        
    ),
    MProductModel(
      id: 3,
      category: "Lenovo",          
      productName: "Kaffir Lime Essential Oil Shampoo 300 ml 3",
      brand: "Kaff & co.",
      productImage: "https://bazar.rdewan.dev/storage/product/images/52d665528f8f5811b84596b731c5d99e.jpg",
      quantity: 0,
      price: "฿50.30",   
      hasOffer: true,
      offerUrl: "https://bazar.rdewan.dev/storage/sales/special-offer.png"          
    ),
    MProductModel(
      id: 4,
      category: "Samsung",
      productName: "test new today 4",
      brand: "Tree on tree",
      productImage: "https://bazar.rdewan.dev/storage/product/images/2c7382db39013299017473b8d9f92d16.jpg",
      quantity: 9,   
      price: "฿60",
      discountedPrice: "฿54", 
      discount: "10"   
    ),
    MProductModel(
      id: 5,
      category: "Microsoft",         
      productName: "check list 5",
      brand: "อื่นๆ",
      productImage: "https://bazar.rdewan.dev/storage/product/images/3f836873c5ed69293486276bbdfcc2c9.jpg",
      quantity: 29, 
      price: "฿40.30",
      hasOffer: true,
      offerUrl: "https://bazar.rdewan.dev/storage/sales/special-offer.png"          
    ),
    MProductModel(
      id: 6,
      category: "Google",
      productName: "test new today 6",
      brand: "Tree on tree",
      productImage: "https://bazar.rdewan.dev/storage/product/images/c86d215acbf8378410e76233335c594f.jpg",
      quantity: 9,  
      price: "฿90.30",
      hasOffer: true,
      offerUrl: "https://bazar.rdewan.dev/storage/sales/special-offer.png"        
    ),
    MProductModel(
      id: 7,
      category: "TLC",
      productName: "test new today 7",
      brand: "Tree on tree",
      productImage: "https://bazar.rdewan.dev/storage/product/images/db53dc0dfa3b15878968d9bd519b4026.jpg",
      quantity: 9,  
      price: "฿30.30"           
    ),
    MProductModel(
      id: 8,
      category: "Vivo",
      productName: "บล็อกแมวรักษ์โลก 8",
      brand: "Kaff & co",
      productImage: "https://bazar.rdewan.dev/storage/product/images/bd1904d6feeaf023335b29fe608b0da5.jpg",
      quantity: 88, 
      price: "฿80.30",
      hasOffer: true,
      offerUrl: "https://bazar.rdewan.dev/storage/sales/special-offer.png"       
    ),
    MProductModel(
      id: 9,
      category: "productdigital",
      productName: "test new today 9",
      brand: "Tree on tree",
      productImage: "https://bazar.rdewan.dev/storage/product/images/e124f0a5dbd5adf270e2e4b8c77a27c8.jpg",
      quantity: 9, 
      price: "฿10.30"            
    ),
    MProductModel(
      id: 10,
      category: "IBM",
      productName: "test new today 10",
      brand: "Tree on tree",
      productImage: "https://bazar.rdewan.dev/storage/product/images/f44e33a8a4860c462f3a092b916dad70.jpg",
      quantity: 0,  
      price: "฿20.30" ,
      hasOffer: true,
      offerUrl: "https://bazar.rdewan.dev/storage/sales/special-offer.png"          
    ),
    MProductModel(
      id: 11,
      category: "Google",
      productName: "test new today 11",
      brand: "Tree on tree",
      productImage: "https://bazar.rdewan.dev/storage/product/images/44e93bfab0790f3f0b7b5e81260f246c.jpg",
      quantity: 9,   
      price: "฿80.30"          
    )
  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(        
        title: Text(widget.title),
      ),
      body: Center(       
        child: SingleChildScrollView(
          child: Column(          
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[               
              const SizedBox(height: 8,), 
              const Text(
                'Product Carousel Demo',
              ),
        
              if (products.isEmpty) ... [
                const SizedBox(),
              ]
              else ...[
        
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MProductCarouselWidget(
                    boxWidth: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width / 2,
                    height: 310,
                    imageWidth: MediaQuery.of(context).size.width / 2,
                    imageHeight: 180,
                    cardElevation: 2,
                    cardBorderRadius: 8,
                    products: products,       
                    outOfStockText: "SOLD OUT", 
                    outOfStockTextStyle: const TextStyle(color: Colors.white),   
                    productTypeBackgroundColor: Colors.red[50],  
                    productTypeTextStyle: TextStyle(color: Colors.redAccent[400]), 
                    brandLabel: "Brand:",
                    brandTextStyle:  const TextStyle(color: Colors.black45, fontSize: 12),
                    priceTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.redAccent[400],
                    ),
                    activeDotColor: Colors.orangeAccent, 
                    dotCount:  products.length ~/ (MediaQuery.of(context).size.width / 160).floor(),
                    isAutoScroll: false,
                    onTap: (id) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('ProductId: $id'),),);
                    },
                    
                  ),
                )
              ]           
             
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

```

## Additional information
If you want to contribute to this project , you are welcome to create a PR.

## License
The source code is licensed under the MIT license, which you can find in
the LICENSE file.
