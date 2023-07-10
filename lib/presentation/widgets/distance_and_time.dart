import 'package:e_bike/Constants/Color_constant.dart';
import 'package:flutter/material.dart';
import 'package:e_bike/data/models/place_directions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DistanceAndTime extends StatelessWidget {
  final PlaceDirections? placeDirections;
  final isTimeAndDistanceVisible;

  const DistanceAndTime(
      {Key? key, this.placeDirections, required this.isTimeAndDistanceVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isTimeAndDistanceVisible,
      child: Positioned(
        top: 0,
        bottom: 400.h,
        left: 0,
        right: 0,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                margin: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 0.h),
                color: Colors.white,
                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.access_time_filled,
                    color: ColorConstant.blue,
                    size: 30.sp,
                  ),
                  title: Text(
                    placeDirections!.totalDuration,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Flexible(
              flex: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                margin: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 0.h),
                color: Colors.white,
                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.directions_car_filled,
                    color: ColorConstant.blue,
                    size: 30.sp,
                  ),
                  title: Text(
                    placeDirections!.totalDistance,
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
