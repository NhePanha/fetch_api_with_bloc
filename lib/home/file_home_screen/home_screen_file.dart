import 'package:auth_with_api/model/file_product_list.dart';
import 'package:auth_with_api/services/file_service_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
class home_screen_file extends StatefulWidget {
  const home_screen_file({super.key});
  @override
  State<home_screen_file> createState() => _home_screen_fileState();
}
class _home_screen_fileState extends State<home_screen_file> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.notifications)
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
          searching_and_slide(),
          build_widget_api()
          ],
        ),
      ),
    );
  }
}

class build_widget_api extends StatelessWidget {
  const build_widget_api({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductList>>(
      future: ProductService.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No products found"));
        } else {
          final products = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Expanded(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(product.images[index]),
                            fit: BoxFit.cover,
                          ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class searching_and_slide extends StatelessWidget {
  const searching_and_slide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(145, 198, 198, 198),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Searching",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(145, 198, 198, 198),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Icon(Icons.sort, size: 35)),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ImageSlideshow(
                    width: double.infinity,

                    height: 200,

                    initialPage: 0,

                    indicatorColor: Colors.blue,

                    indicatorBackgroundColor: Colors.grey,

                    onPageChanged: (value) {
                      print('Page changed: $value');
                    },

                    autoPlayInterval: 3000,

                    isLoop: true,

                    children: [
                      Image.asset(
                        'images/sample_image_1.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'images/sample_image_2.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'images/sample_image_3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
