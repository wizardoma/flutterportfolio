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

  String background =
      """I am a software developer who loves learning new things and solving problems. Using incredible tools and software, I love building softwares and services that make positive impacts to the community
  I am an active member of various developers communities, where I focus on making impacts and sharing my experiences whilst learning.
  Being a full-stack engineer, my goal is to always build applications that are scalable and efficient under the hood while providing engaging, adaptive, simple and efficient user experiences. On the other hand, community gives me a platform to share complementary ideas with my peers and accelerate the process of crafting better solutions without being distracted by the buzz, glitz and opportunities that seem to exist.
  When I'm not in front of a computer screen, I'm probably reading a technical or self-help book, surfing the net for tech news and updates, hanging out or giving free therapy to a friend.""";
  String _tools =
      "I’ve picked up quite a few skills during the course of my studies, and work to improve these skills everyday. Here are a few of the tools & technologies that I have experience with:";

  List<String> _toolsLanguages = ["Java", "Javascript", "Dart", "Python"];
  List<String> _toolsFrameworks = [
    "Spring Framework",
    "Flutter",
    "ReactJs",
    "Hibernate"
  ];
  List<String> _toolsTools = ["Git", "FireBase", "Postgresql", "Postman"];
  List<String> _toolsDevops = [
    "Docker",
    "Microservices",
    " Google Cloud Platform",
    "Amazon Web Service",
    "Blockchain"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ibekason Alexander",
      debugShowCheckedModeBanner: false,
      theme: isDarkMode
          ? ThemeData.dark().copyWith(primaryColor: Colors.green)
          : ThemeData.light().copyWith(primaryColor: Colors.green),
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: ContactFab(),
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
              child: ListView(
                shrinkWrap: true,
                children: [
                  _introductionSection(),
                  _backgroundSection(),
                  _toolsSection(),
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
        crossAxisAlignment: CrossAxisAlignment.center,
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

  Widget _introductionSection() {
    var container = Container(
      child: Text(description,
          style: _textStyle(isDarkMode: isDarkMode, fontSize: 22, height: 1.5)),
    );

    return SectionWrapper(
      title: "Introduction",
      content: container,
      isDarkMode: isDarkMode,
    );
  }

  Widget _backgroundSection() {
    var container = Container(
      child: Text(
        background,
        style: _textStyle(height: 1.3, isDarkMode: isDarkMode, fontSize: 18),
      ),
    );
    return SectionWrapper(
      title: "Background",
      content: container,
    );
  }

  Widget _toolsSection() {
    var container = Container(
      child: Column(
        children: [
          Text(
            _tools,
            style: _textStyle(
              isDarkMode: isDarkMode,
              fontSize: 18,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              toolsLanguages(),
              toolsFrameworks(),
              toolsTools(),
              toolsDevops(),
            ],
          )
        ],
      ),
    );
    return SectionWrapper(
      title: "Tools & Technologies",
      content: container,
    );
  }

  Widget toolsLanguages() {
    return _toolsWrapper("Languages", _toolsLanguages);
  }

  Widget toolsFrameworks() {
    return _toolsWrapper("FrameWorks", _toolsFrameworks);
  }

  Widget toolsTools() {
    return _toolsWrapper("Tools", _toolsTools);
  }

  Widget toolsDevops() {
    return _toolsWrapper("Cloud/Devops", _toolsDevops);
  }

  Widget _toolsWrapper(String title, List<String> list) {
    List<Widget> widgets = list
        .map((e) => Text(
              e,
              style: _textStyle(
                isDarkMode: isDarkMode,
              ),
            ))
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ...widgets
      ],
    );
  }

  TextStyle _textStyle({bool isDarkMode, double fontSize, double height}) {
    return TextStyle(
        height: height ?? 1.3,
        color: !isDarkMode ? Colors.black54 : Colors.white,
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.w400);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(padding: EdgeInsets.only(left: 15), child: content),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class ContactFab extends StatefulWidget {
  @override
  _ContactFabState createState() => _ContactFabState();
}

class _ContactFabState extends State<ContactFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  void showScaffold(String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Widget twitter() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => showScaffold("@wizardom"),
        tooltip: 'Add',
        child: Text("Tweet"),
      ),
    );
  }

  Widget github() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => showScaffold("/wizardoma"),
        tooltip: 'Image',
        child: Text("Github"),
      ),
    );
  }

  Widget linkedIn() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => showScaffold("linked.com/in/alexander-ibekason"),
        tooltip: 'Inbox',
        child: Text("In"),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: twitter(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: github(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: linkedIn(),
        ),
        toggle(),
      ],
    );
  }
}
