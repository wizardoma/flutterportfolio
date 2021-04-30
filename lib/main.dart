import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  String description =
      "Alex here, a highly motivated software developer with solid understanding of software development best practices and loves to build stuff, I'm also an open source hobbyist & tech enthusiast with a never easing desire to solve problems with software.👨‍";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ibekason Alexander",
      debugShowCheckedModeBanner: false,
      theme: isDarkMode
          ? ThemeData.dark()
          : ThemeData.light().copyWith(primaryColor: Colors.green),
      home: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                    expandedHeight: 300.0,
                    pinned: true,
                    floating: false,
                    flexibleSpace: getFlexibleSpaceBar()),
                SliverPadding(
                  padding: EdgeInsets.all(10),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Software Engineer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                              Text(
                                "Owerri, Nigeria",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ]),
                  ),
                )
              ];
            },
            body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  introductionSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleDarkMode(val) {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  Widget getFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      background: Image.asset(
        "assets/profile.jpg",
        fit: BoxFit.cover,
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 4, child: Text("Ibekason Alexander Onyebuchi")),
          Flexible(
              flex: 1,
              child: FittedBox(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(13)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lightbulb,
                        color: Colors.white,
                      ),
                      Switch(
                          activeColor: Colors.green,
                          activeTrackColor: Colors.white,
                          value: isDarkMode,
                          onChanged: (val) => _toggleDarkMode(val)),
                      Icon(
                        Icons.lightbulb,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget introductionSection() {
    var container = Container(
      child: Text(
        description,
        style: TextStyle(
            height: 1.5,
            color: !isDarkMode ? Colors.black54 : Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400),
      ),
    );

    return SectionWrapper(
      title: "Hello!",
      content: container,
      isDarkMode: isDarkMode,
    );
  }
}

class SectionWrapper extends StatelessWidget {
  final String title;
  final bool isDarkMode;
  final Widget content;

  const SectionWrapper({Key key, this.title, this.content, this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: !isDarkMode ? Colors.black54 : Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(padding: EdgeInsets.only(left: 15), child: content),
      ],
    );
  }
}
