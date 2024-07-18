

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/model/home_model.dart';
import 'package:wallpaper_app/screen/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  TextEditingController txtname=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().animalGetData("animal");
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Wallper",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:
           Column(
              children: [
                if(providerW!.animalModel==null)
                  Column(
                    children: [
                      SearchBar(
                        elevation: MaterialStateProperty.all(0.9),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.5)),
                        controller: txtname,
                        hintText: 'Search',
                        trailing: [
                          IconButton(onPressed: () {
                            providerR!.animalGetData(txtname.text);
                          }, icon: const Icon(Icons.search))
                        ],
                      ),
                      Text("No Data",style: TextStyle(fontSize: 20,color: Colors.red),)
                    ],
                  )
                else if(providerW!.animalModel!=null)
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SearchBar(
                    elevation: MaterialStateProperty.all(0.9),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.5)),
                    controller: txtname,
                    hintText: 'Search',
                    trailing: [
                     IconButton(onPressed: () {
                       providerR!.animalGetData(txtname.text);
                     }, icon: const Icon(Icons.search))
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                Expanded(
                  child: MasonryGridView.builder(
                    padding: const EdgeInsets.all(5 ),
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    itemCount: providerW!.animalModel!.l1!.length,
                    gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                           HintModel a1=providerR!.animalModel!.l1![index];
                          Navigator.pushNamed(context, 'detail',arguments: a1);
                        },
                        child: CachedNetworkImage(
                          imageUrl:
                          "${providerW!.animalModel!.l1![index].largeImageURL}",
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const SizedBox(
                              height: 10,
                              width: 10,
                              child:
                              Center(child: CircularProgressIndicator())),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
    );
  }
}
