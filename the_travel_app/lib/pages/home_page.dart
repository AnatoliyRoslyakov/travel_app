import 'package:flutter/material.dart';

import 'package:the_travel_app/misc/colors.dart';
import 'package:the_travel_app/widgets/app_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List mesto = ['mesto1.jpg', 'mesto2.jpg', 'mesto3.jpg'];
List moreInfoImg = ["afisha.png", "ekskursia.png", "otdih.png", "pohod.png"];
List moreInfoText = ["Афиша", "Экскурсии", "Отдых", "Походы"];

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        TabController(length: 3, vsync: this); // this -> context
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Меню
          Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 30, color: Colors.black54),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)),
                  ),
                ],
              )),
          const SizedBox(height: 20),
          // Путешествие
          Container(
            margin: EdgeInsets.only(left: 20),
            child: AppLargeText(
              text: 'Откройте для себя',
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          // tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  controller: _tabController,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: [
                    Tab(text: 'Места'),
                    Tab(text: 'Вдохновение'),
                    Tab(text: 'Эмоции'),
                  ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                itemCount: mesto.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('img/${mesto[index]}'),
                            fit: BoxFit.cover)),
                  );
                },
              ),
              Text('Тут'),
              Text('Пока')
            ]),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: 'Узнать больше',
                    color: Colors.black,
                    size: 22,
                  ),
                  AppText(
                    text: 'Смотреть все',
                    color: AppColors.textColor1,
                  )
                ]),
          ),
          SizedBox(height: 10),
          Container(
              height: 119,
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 119.0,
                  aspectRatio: 1 / 1,
                  viewportFraction: 0.3,
                ),
                items: moreInfoText.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.3),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'img/${moreInfoImg[moreInfoText.indexOf(item)]}'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: AppText(
                                  text: item,
                                  color: AppColors.textColor2,
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
