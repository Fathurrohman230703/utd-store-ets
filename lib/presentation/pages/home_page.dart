import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';

import '../../data/services/crypto_service.dart';
import '../../data/services/isolate_service.dart';

import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (_) => sl<ProductCubit>()..getProducts(),

      child: Scaffold(

        appBar: AppBar(
          title: const Text('UTD Store'),
        ),

// Fix UI

        body: Column(

          children: [

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(16),

              color: Colors.orange.shade100,

              child: StreamBuilder<String>(

                stream: sl<CryptoService>()
                    .getBitcoinPrice(),

                builder: (context, snapshot) {

                  if (!snapshot.hasData) {

                    return const Text(
                      'Loading Bitcoin...',
                    );
                  }

                  return Text(

                    'Bitcoin Price: \$${snapshot.data}',

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),

            ElevatedButton(

              onPressed: () async {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Kalkulasi dimulai...',
                    ),
                  ),
                );

                final result = await sl<IsolateService>()
                    .startHeavyTask();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Selesai: $result',
                    ),
                  ),
                );
              },

              child: const Text(
                'Kalkulasi Pajak Kripto',
              ),
            ),

            Expanded(

              child: BlocBuilder<ProductCubit, ProductState>(

                builder: (context, state) {

                  if (state is ProductLoading) {

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ProductError) {

                    return Center(
                      child: Text(state.message),
                    );
                  }

                  if (state is ProductLoaded) {

                    return ListView.builder(

                      itemCount: state.products.length,

                      itemBuilder: (context, index) {

                        final product = state.products[index];

                        return ListTile(

                          leading: Image.network(
                            product.image,
                            width: 50,
                          ),

                          title: Text(product.title),

                          subtitle: Text(
                            '\$${product.price}',
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}