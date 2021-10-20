import 'package:flutter/material.dart';
import 'package:socialfilmfestival/UI/modul/modul_film_primo_grado.dart';
import 'package:socialfilmfestival/UI/navigation_main.dart';
import 'package:socialfilmfestival/screen/screen_page_film_pg/film_primo_grado_widget.dart';

class PageFilmpgWidget extends StatefulWidget {
  const PageFilmpgWidget({
    Key? key,
  }) : super(key: key);

  @override
  _PageFilmpgWidgetState createState() => _PageFilmpgWidgetState();
}

class _PageFilmpgWidgetState extends State<PageFilmpgWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          //in case if error found
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          //once data is ready this else block will execute
          // items will hold all the data of DataModel
          //items[index].name can be used to fetch name of product as done below
          // ignore: unused_local_variable
          var items = data.data as List<Modulprimogrado>;
          return ListView.builder(
            // ignore: unnecessary_null_comparison
            itemCount: items == null ? 0 : items.length,
            itemExtent: 163, // высота колонки
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 168,
                                  width: 100,
                                  color: Colors.amber,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Whoops!',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                );
                              },
                              fit: BoxFit.cover,
                              height: 168,
                              width: 100,
                              image: NetworkImage(
                                items[index].urlimage.toString(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: const [Icon(Icons.poll)],
                                    ),
                                  ],
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[index].namefilm.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                      ],
                                    ),
                                    //SizedBox(width: 50),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'April 7,2018',
                                      style: TextStyle(color: Colors.grey),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(items[index].descriptionfilm.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        //  borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.pushNamed(
                              context, MainNavigationNames.detailPG,
                              arguments: {
                                'id': items[index].id,
                                'namefilm': items[index].namefilm.toString(),
                                'descriptionfilm':
                                    items[index].descriptionfilm.toString(),
                                'urlimage': items[index].urlimage.toString(),
                                'urlvideo': items[index].urlfilm.toString(),
                              });
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          // show circular progress while data is getting fetched from json file
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
