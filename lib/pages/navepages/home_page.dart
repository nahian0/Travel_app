import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travelapptest/misc/colors.dart';
import 'package:travelapptest/widgets/app_large_text1.dart';
import 'package:travelapptest/widgets/app_text.dart';
//ignore_for_file: prefer_const_constructors

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List places = ['mountain.jpeg', 'mountain2.jpg', 'mountain3.jpg'];

  var images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'hiking',
    'kayaking.png': 'kayking',
    'snorkling.png': 'snorkling'
  };
  @override
  Widget build(BuildContext context) {
    //TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //discover text
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: AppLargetext(text: 'Discover'),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          //tapbar
          Container(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        isScrollable: true,
                        labelPadding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        labelColor: Colors.black,
                        indicator: circulartabindicator(
                            color: AppColors.mainColor, radius: 4),

                        unselectedLabelColor: Colors.grey.withOpacity(.7),
                        //indicatorColor: Colors.amber,

                        tabs: const [
                          Text('places'),
                          Text('places'),
                          Text('places')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          height: 300,
                          //padding: EdgeInsets.only(left: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return Container(
                                width: 200,
                                height: 300,
                                margin: EdgeInsets.only(right: 10, top: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('img/' + places[index]),
                                      fit: BoxFit.cover),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 300,
                          //padding: EdgeInsets.only(left: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return Container(
                                width: 200,
                                height: 300,
                                margin: EdgeInsets.only(right: 10, top: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('img/' + places[index]),
                                      fit: BoxFit.cover),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 300,
                          //padding: EdgeInsets.only(left: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return Container(
                                width: 200,
                                height: 300,
                                margin: EdgeInsets.only(right: 10, top: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('img/' + places[index]),
                                      fit: BoxFit.cover),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargetext(
                  text: 'Explore more',
                  size: 22,
                ),
                Apptext(
                  text: 'see all',
                  color: AppColors.textColor1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 140,
            width: double.maxFinite,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (_, index) {
                  return Column(children: [
                    Container(
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(left: 0, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(
                                'img/' + images.keys.elementAt(index)),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Apptext(text: images.values.elementAt(index)),
                    )
                  ]);
                }),
          )
        ],
      ),
    );
  }
}

class circulartabindicator extends Decoration {
  final Color color;
  double radius;
  circulartabindicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // ignore: todo
    // TODO: implement createBoxPainter
    return circlepainter(color: color, radius: radius);
  }
}

class circlepainter extends BoxPainter {
  @override
  final Color color;
  double radius;
  circlepainter({required this.color, required this.radius});
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleoffset =
        Offset(configuration.size!.width / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleoffset, radius, paint);
  }
}
