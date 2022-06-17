import 'package:flutter/material.dart';
import 'package:movie_app/core/api_response.dart';
import 'package:movie_app/view/widgets/movie_item.dart';
import 'package:movie_app/view/widgets/second_slider.dart';
import 'package:movie_app/viewmodel/main_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int activePage = 1;
  @override
  void initState() {
    super.initState();
    Provider.of<MainViewModel>(context, listen: false).fetchPopular();
    _pageController = PageController(viewportFraction: 0.5, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text("Movie App"),
      // ),
      body: Consumer<MainViewModel>(builder: (context, data, child) {
        if (data.response.status == Status.LOADING) {
          return const CircularProgressIndicator();
        }
        if (data.response.status == Status.ERROR) {
          return Center(
            child: Text(data.response.message!),
          );
        }

        return ListView(
          children: [
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Popular Movie",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 46),
              child: SizedBox(
                height: 400,
                child: PageView.builder(
                    itemCount: data.movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MovieItem(
                        data.movies[index],
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: PageView.builder(
                  itemCount: data.movies.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context, pagePosition) {
                    bool active = pagePosition == activePage;
                    return SecondSlider(
                      data.movies[pagePosition],
                      active,
                    );
                  }),
            ),
          ],
        );
      }),
    );
  }
}
