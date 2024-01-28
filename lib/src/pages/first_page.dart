import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String value = 'This Week';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 344.w,
          height: 42.h,
          margin: EdgeInsets.symmetric(horizontal: 23.w, vertical: 30.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi John Doe. William',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.40,
                  ),
                ),
                Text(
                  'Welcome to FinX Stock',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.10,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: const Icon(
                Icons.threed_rotation_sharp,
              ),
            )
          ]),
        ),
        Expanded(
          child: ListView(
            children: [
              Container(
                height: 194.h,
                width: 342.w,
                margin: EdgeInsets.only(right: 23.w, bottom: 34.h, left: 23.w),
                decoration: ShapeDecoration(
                  color: const Color(0xFFE3EEFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 72.h,
                      padding:
                          EdgeInsets.only(top: 20.h, right: 16.w, left: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Stock Gains',
                                style: TextStyle(
                                  color: Color(0xFF616161),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.25,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '\$20,901.0.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '41',
                                      style: TextStyle(
                                        color: Color(0xFF616161),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            child: Opacity(
                              opacity: 0.60,
                              child: Container(
                                width: 124,
                                height: 36,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'This week',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF212121),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.10,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Color.fromRGBO(33, 33, 33, 1),
                                        size: 26,
                                      )
                                    ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: Container(
                          child: Stack(
                        children: [
                          Container(
                            child: const FittedBox(
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/chart.png'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset('assets/images/chartline.png'),
                          )
                        ],
                      )),
                    )
                  ],
                ),
              ),
              // Next Widget
              Container(
                margin: EdgeInsets.only(left: 23.w),
                height: 160.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Portfolio',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.10,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 23.w),
                          child: const Text(
                            'View all',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFF61C7A),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.10,
                            ),
                          ),
                        )
                      ],
                    ),
                    // NextWidget2
                    Container(
                      height: 109.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [_CoinContainer(), _CoinContainer()],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23.w, vertical: 30.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Watchlist',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.10,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 24.sp,
                          weight: 400,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        _ListItems(),
                        _ListItems(),
                        _ListItems(),
                        _ListItems(),
                        _ListItems(),
                        _ListItems()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget _ListItems() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: const ClipOval(
                      child:
                          Image(image: AssetImage('assets/images/apple.jpg'))),
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MSFT',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.10,
                    ),
                  ),
                  Text(
                    'Microsoft Corp.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.40,
                    ),
                  )
                ],
              ),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80.w,
                height: 32.h,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/chart.png'),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$213.10',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.10,
                    ),
                  ),
                  Text(
                    '2.5%',
                    style: TextStyle(
                      color: Color(0xFF289BF6),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.40,
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _CoinContainer() {
    return Container(
      height: 108.h,
      width: 185.w,
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
      margin: EdgeInsets.only(right: 23.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFE3EEFF),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: const ClipOval(
                    child: Image(image: AssetImage('assets/images/apple.jpg'))),
              ),
              SizedBox(
                width: 16.w,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'APPL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.10,
                    ),
                  ),
                  Text(
                    'Apple Inc.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.40,
                    ),
                  )
                ],
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '198.24',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.10,
                ),
              ),
              Text(
                '2.5%',
                style: TextStyle(
                  color: Color(0xFF039C6B),
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.40,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
