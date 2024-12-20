// ignore_for_file: must_be_immutable, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import '../model/order-model.dart';
import '../utilis/constant.dart';

class CheckSingleOrderScreen extends StatelessWidget {
  String docId;
  OrderModel orderModel;
  CheckSingleOrderScreen({
    super.key,
    required this.docId,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text('Order'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Product Name:${orderModel.productName}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Product Name: "+orderModel.productTotalPrice.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Quantuty: "+'x' + orderModel.productQuantity.toString
              ()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Description: ${orderModel.productDescription}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                foregroundImage: NetworkImage(orderModel.productImages[0]),
              ),
              CircleAvatar(
                radius: 50.0,
                foregroundImage: NetworkImage(orderModel.productImages[1]),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Order Model: ${orderModel.customerName}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Customer Ponne:${orderModel.customerPhone}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(orderModel.customerAddress),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(orderModel.customerId),
          ),
        ],
      ),
    );
  }
}
