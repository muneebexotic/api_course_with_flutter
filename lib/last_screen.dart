import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:postman_practice/Models/ProductsModel.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({super.key});

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  var data;
  Future<ProductsModel> getProductsApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/3ff74465-a057-4443-8bfb-7777f75c1b0e'));
    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Course Last Screen'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder<ProductsModel>(
                    future: getProductsApi(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  ListTile(
                                    title: Text(snapshot.data!.data![index].shop!.name.toString()),
                                    subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                                    ),
                                  ),
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data.length,
                                          itemBuilder: (context, position) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .25,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .5,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .images![
                                                                    position]
                                                                .url
                                                                .toString()),
                                                        fit: BoxFit.cover)),
                                              ),
                                            );
                                          })),
                                  Icon(snapshot.data!.data![index].inWishlist! == false ? Icons.favorite : Icons.favorite_outline)
                                ],
                              );
                            });
                      } else {
                        return Text('Loading');
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
