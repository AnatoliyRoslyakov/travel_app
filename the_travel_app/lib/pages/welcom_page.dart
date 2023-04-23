import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_travel_app/misc/colors.dart';
import 'package:the_travel_app/widgets/app_large_text.dart';
import 'package:the_travel_app/widgets/app_text.dart';
import 'package:the_travel_app/widgets/responsive_button.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  List images = ['11.png', '22.png', '33.png'];
  List textApp = ['Камчатский край', 'Санкт-Петербург', 'Москва'];
  List text = [
    'Большое количество достопримечательностей. Потрясающая рыбалка и возможность ложками есть красную икру. По-настоящему экстремальный отдых зимой и летом.',
    'В Петербурге сама атмосфера располагает к творчеству, а так же есть очень много студий и школ,где можно развиваться в любом творческом направлении.',
    'Большой город  —  бешенная динамика, жизнь буквально «кипит». Это способствует его развитию, а там где всё стремительно развивается — появляются возможности.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/' + images[index]),
                      fit: BoxFit.fill)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: 'Откройте для себя'),
                          AppText(text: textApp[index], size: 30),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 270,
                            child: AppText(
                              text: text[index],
                              size: 15,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ResponsiveButton(
                            width: 120,
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(images.length, (indexDots) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              width: 8,
                              height: index == indexDots ? 25 : 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots
                                      ? AppColors.mainColor
                                      : AppColors.mainColor.withOpacity(0.3)));
                        }),
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}
