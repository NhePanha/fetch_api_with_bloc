import 'package:auth_with_api/model/file_product_list.dart';
import 'package:auth_with_api/services/file_service_api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreenFile extends StatefulWidget {
  const HomeScreenFile({super.key});
  @override
  State<HomeScreenFile> createState() => _HomeScreenFileState();
}

class _HomeScreenFileState extends State<HomeScreenFile> {
  late Future<ProductList> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = ApiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: const Color.fromARGB(151, 76, 175, 79),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity, 
            height: 200,
            child: CarouselExample(),
          ),
          Container(
            // us doube.infinity
            width: 430, height: 615,
            child: FutureBuilder<ProductList>(
              future: _futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
                  return const Center(child: Text('No products found.'));
                }
                final products = snapshot.data!.data;
                return Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1,
                          childAspectRatio: 1,
                          mainAxisExtent: 300,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Stack(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(
                                    product: product
            
                                  )));
                                },
                                child: Card(
                                  color: Colors.white,
                                  shadowColor: const Color.fromARGB(163, 222, 222, 222),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 180,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(product.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          product.productName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text("${product.reqularPrice} Kg"),
                                            // Text("${DateTime.now()}",)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "\$${product.salePrice} ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                bottom: 15,
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 3, 70, 0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.add,color: Colors.white,size: 28,),
                                  ),
                                ),
                                
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // Positioned(
            
                    //   bottom: 20,
                    //   child: Container(
                    //   width: double.infinity,height: 50,color: Colors.amber,
                    // ))
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
/// bloc slider
class CarouselExample extends StatefulWidget {
  @override
  _CarouselExampleState createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  int _currentIndex = 0;

  final List<String> imageList = [
    'https://thumbs.dreamstime.com/b/ai-generator-image-orange-lime-lemon-cut-slide-show-fruit-flesh-ai-generator-image-orange-lime-lemon-cut-slide-show-348494073.jpg',
    'https://media.slidesgo.com/storage/13363628/tropical-fruits-agency1635934349.jpg',
    'https://media.slidesgo.com/storage/12937090/food-pattern1635234800.jpg',
    'https://i.pinimg.com/564x/e6/23/56/e6235677fab254f7f4482713e178d11d.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            CarouselSlider(
              items: imageList.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(item, fit: BoxFit.cover, width: 1000),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Positioned(
              bottom: 0,
              left: 100,right: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => setState(() => _currentIndex = entry.key),
                    child: Container(
                      width: 15.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? Colors.blue
                              : Colors.grey),
                    ),
                  );
                }).toList(),
              ),
            ),
        ]
      ),
    );
  }
}
/// bloc detail page
class DetailPage extends StatelessWidget {
  final Datum product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.productName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "\$${product.salePrice}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "${product.reqularPrice} Kg",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                product.description ?? "No description available.",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add to cart logic here
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}