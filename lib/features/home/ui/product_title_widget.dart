// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/bloc/home_bloc.dart';

import 'package:flutter_application_1/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({
    Key? key,
    required this.productDataModel, required this.homeBloc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(height:20 ,),
          Text(productDataModel.name, style: const TextStyle(fontSize:18,fontWeight: FontWeight.bold ),),
          Text(productDataModel.description),
          const SizedBox(height:20 ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ "+ productDataModel.price.toString(), style: const TextStyle(fontSize:18,fontWeight: FontWeight.bold ),),
              Row(children: [
                 IconButton(
                      onPressed: () {
                       homeBloc.add(HomeProductWishlistButtonClickedEvent(productDataModel));
                      },
                      icon: const Icon(Icons.favorite,  ), ),
                      
                  IconButton(
                      onPressed: () {
                      homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_cart))
              ],)
            ],
          ),

        ],
      ),
    );
  }
}
