import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_travel_app/misc/colors.dart';
import 'package:the_travel_app/widgets/app_large_text.dart';
import 'package:the_travel_app/widgets/app_text.dart';
import 'package:the_travel_app/widgets/responsive_button.dart';

import '../widgets/app_buttons.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 5;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 360,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'img/mesto1.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: 'Эрмитаж',
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: '₽ 250',
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: 'Россия, Москва',
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star_sharp,
                              color: index < gottenStars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: '($gottenStars)',
                          color: AppColors.textColor2,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    AppLargeText(
                      text: 'Билеты',
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(height: 5),
                    AppText(
                      text: 'Количество человек в вашей группе',
                      color: AppColors.textColor2,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              size: 50,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    AppLargeText(
                      text: 'Описание',
                      color: Colors.black.withOpacity(0.8),
                      size: 22,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.textColor2.withOpacity(0.5)),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      height: 90,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            text:
                                'Главный художественный и исторический музей нашей страны. Является одним из самых известных и популярных музеев мира: ежегодно его посещают около 4 миллионов туристов.',
                            color: AppColors.textColor2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 15,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      color: AppColors.textColor1,
                      size: 60,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.textColor1,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    const SizedBox(width: 10),
                    ResponsiveButton(
                      onTap: () {},
                      isResponsive: true,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
