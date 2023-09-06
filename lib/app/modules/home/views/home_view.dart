import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:dating_app/app/constant/colors.dart';
import 'package:dating_app/app/modules/UserInfoPage/views/user_info_page_view.dart';
import 'package:dating_app/app/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProfileCard> profile = [];

  List<String> images = [
    'https://marketplace.canva.com/EAFXS8-cvyQ/1/0/1600w/canva-brown-and-light-brown%2C-circle-framed-instagram-profile-picture-2PE9qJLmPac.jpg',
    'https://t3.ftcdn.net/jpg/03/02/09/52/360_F_302095207_iuCeDS2jIkIptfE29Wb0ldDs248FAzoi.jpg',
    'https://www.shutterstock.com/image-photo/portrait-smiling-red-haired-millennial-250nw-1194497251.jpg',
    'https://t4.ftcdn.net/jpg/04/44/53/99/360_F_444539901_2GSnvmTX14LELJ6edPudUsarbcytOEgj.jpg',
    'https://media.istockphoto.com/id/1300972573/photo/pleasant-young-indian-woman-freelancer-consult-client-via-video-call.jpg?b=1&s=612x612&w=0&k=20&c=gApYcn6GubvJA-YoMO00KZAShv66MHEwrsAbcmaq_cQ=',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcHwpdNGok5kGlo_V4gUHIU2kSWxTzAoVvkR6CeRa6zb-16O9SyJ8lz9LPXxwUXbaTY4g&usqp=CAU',
  ];

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  final AppinioSwiperController controller = AppinioSwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('For You',
            style: TextStyle(
                color: ColorConstants.primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(
            Icons.person,
            color: ColorConstants.primaryColor,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.message,
              color: ColorConstants.primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          AppinioSwiper(
            controller: controller,
            onSwipe: _swipe,
            loop: true,
            padding: const EdgeInsets.only(bottom: 130, top: 16),
            cardsBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: AspectRatio(
                  aspectRatio: 4 / 4,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(images[index]),
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter,
                        // scale: 1.1,
                      ),
                    ),
                  ),
                ),
              );
            },
            cardsCount: profile.length,
          ),
          Positioned(
              bottom: 50,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => controller.swipeLeft(),
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.close,
                        color: ColorConstants.close,
                        size: 32,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.star,
                        color: ColorConstants.star,
                        size: 32,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.swipeRight(),
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: ColorConstants.favorite,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    print("the card was swiped to the: " + direction.name);
  }

  void _loadCards() {
    for (String image in images) {
      profile.add(ProfileCard(image: image));
    }
  }
}
