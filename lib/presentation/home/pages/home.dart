import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
 late TabController _tabController;


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(context)
          ],
        ),
      ),

    );
  }

  Widget _homeTopCard(){
    return Center(
      child: SizedBox(
        height: 140,
          child: Stack(
            children: [

              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  AppVectors.homeTopCard
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Image.asset(
                    AppImages.homeArtist
                  ),
                ),
              )

            ],
          ),
      ),
    );
  }

 Widget _tabs(BuildContext context) {
   return TabBar(
     controller: _tabController,
     isScrollable: true,
     labelColor: context.isDarkMode ? Colors.white : Colors.black,
     unselectedLabelColor: Colors.grey,
     labelStyle: TextStyle(
       fontWeight: FontWeight.bold,
       fontSize: 16,
     ),  // Style for selected tab
     unselectedLabelStyle: TextStyle(
       fontWeight: FontWeight.w400,
       fontSize: 14,
     ),  // Style for unselected tab
     indicator: UnderlineTabIndicator(
       borderSide: BorderSide(
         width: 3.0,
         color: AppColors.primary,
       ),
       insets: EdgeInsets.symmetric(horizontal: 20),
     ),  // Custom indicator style
     padding: EdgeInsets.symmetric(vertical: 10),
     indicatorPadding: EdgeInsets.symmetric(vertical: 5),
     tabs: [
       Tab(text: 'New'),
       Tab(text: 'Songs'),
       Tab(text: 'Artists'),
       Tab(text: 'Podcast'),
     ],
   );
 }

}
