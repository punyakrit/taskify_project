import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../service/ad_mob.dart';

class Description extends StatefulWidget {
  final String title, description;

  const Description({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  BannerAd? _banner;

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  void _createBannerAd() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
         adUnitId: AdMobService.bannerAdUnitId,
          listener: AdMobService.bannerListner,
           request: const AdRequest()
           ) ..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Description'),
       backgroundColor: Colors.deepOrange.withOpacity(0.8),),
      body: Container(
      padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Container(decoration: BoxDecoration(),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    widget.description,
                    style: TextStyle(
                    fontSize: 20
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _banner == null
            ? Container()
            : Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 52,
                child: AdWidget(ad: _banner!),
              ),
    );
  }
}
