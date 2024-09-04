import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nany/provider/home_provider.dart';
import 'package:nany/utils/app_colors.dart';
import 'package:nany/utils/app_text_style.dart';
import 'package:nany/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false)
          .getApiCallCurrentBooking(context);
      Provider.of<HomeProvider>(context, listen: false)
          .getApiCallPackage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.015),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: AppColors.primaryDarkColor,
                      ),
                    ),
                  ),
                  // SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              "https://i.pinimg.com/736x/51/e0/d5/51e0d5aa27808ce689e3dd5a5cd7685a.jpg",
                              height: 60,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: AppTextStyle.ts14MB,
                          ),
                          Text(
                            "Emily Cyrus",
                            style: AppTextStyle.ts18BB
                                .copyWith(color: AppColors.primaryDarkColor),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: height * 0.2,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Nanny And Babysitting Services",
                            style: AppTextStyle.ts20BB
                                .copyWith(color: AppColors.blueColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: height * 0.02),
                          SizedBox(
                            width: width * 0.2,
                            child: CustomButton(
                              onTap: () {},
                              title: "Book Now",
                              bgColor: AppColors.blueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Text("Your current booking", style: AppTextStyle.ts18MB),
                  SizedBox(height: height * 0.01),
                  ListView.builder(
                      itemCount: provider.currentBookingList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var currentBoolingData = provider.currentBookingList[0];
                        return provider.isLoading1
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : currentBooking(
                                width,
                                height,
                                currentBoolingData["title"],
                                currentBoolingData["from_date"],
                                currentBoolingData["from_time"],
                                currentBoolingData["to_date"],
                                currentBoolingData["to_time"],
                              );
                      }),

                  SizedBox(height: height * 0.03),
                  Text("Packages", style: AppTextStyle.ts18MB),
                  SizedBox(height: height * 0.01),
                  ListView.builder(
                      itemCount: provider.packageList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var items = provider.packageList[index];
                        return provider.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: packageWidget(
                                  width,
                                  height,
                                  index,
                                  items["title"],
                                  items["price"],
                                  items["desc"],
                                ),
                              );
                      }),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget currentBooking(double width, double height, String title,
      String fromDate, String fromTime, String toDate, String toTime) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.ts16RB
                      .copyWith(color: AppColors.primaryDarkColor),
                ),
                SizedBox(
                  width: width * 0.2,
                  child: CustomButton(
                    onTap: () {},
                    title: "Start",
                    bgColor: AppColors.primaryDarkColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Text("Form", style: AppTextStyle.ts12RB),
                ),
                SizedBox(
                    width: width * 0.4,
                    child: Text("To", style: AppTextStyle.ts12RB)),
              ],
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: AppColors.primaryColor,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            fromDate,
                            style: AppTextStyle.ts14RB,
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: AppColors.primaryColor,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            fromTime,
                            style: AppTextStyle.ts14RB,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: AppColors.primaryColor,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            toDate,
                            style: AppTextStyle.ts14RB,
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: AppColors.primaryColor,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            toTime,
                            style: AppTextStyle.ts14RB,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  icons: Icons.star_outline,
                  iconsColor: AppColors.white,
                  title: "Rate Us",
                  titleColor: AppColors.white,
                  bgColor: AppColors.blueColor,
                ),
                CustomButton(
                  icons: Icons.location_on_outlined,
                  iconsColor: AppColors.white,
                  title: "Geolocation",
                  titleColor: AppColors.white,
                  bgColor: AppColors.blueColor,
                ),
                CustomButton(
                  icons: Icons.star_outline,
                  iconsColor: AppColors.white,
                  title: "Survillence",
                  titleColor: AppColors.white,
                  bgColor: AppColors.blueColor,
                )
              ],
            ),
            SizedBox(height: height * 0.01),
          ],
        ),
      ),
    );
  }

  Widget packageWidget(double width, double height, int index, String title,
      String amount, String description) {
    return Container(
      height: height * 0.2,
      width: width,
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? AppColors.primaryColor
              : AppColors.lightBlueColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 35,
                  color: index % 2 == 0
                      ? AppColors.primaryDarkColor
                      : AppColors.white,
                ),
                CustomButton(
                  onTap: () {},
                  title: "Book Now",
                  bgColor: index % 2 == 0
                      ? AppColors.primaryDarkColor
                      : AppColors.darkBlueColor,
                ),
              ],
            ),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: AppTextStyle.ts16MB
                        .copyWith(color: AppColors.blueColor)),
                Text(amount,
                    style: AppTextStyle.ts16RB
                        .copyWith(color: AppColors.blueColor))
              ],
            ),
            SizedBox(height: height * 0.015),
            Text(description, style: AppTextStyle.ts12RB),
          ],
        ),
      ),
    );
  }
}
