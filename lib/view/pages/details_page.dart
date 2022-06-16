import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 440.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 12,
            child: Divider(color: Colors.white),
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  movie.title ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: index.isOdd ? Colors.white : Colors.black12,
                        child: Center(
                            child: Text(
                          movie.overview ?? "",
                          style: const TextStyle(color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Add a commeent",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 177, 17, 6),
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        color: const Color.fromARGB(255, 177, 17, 6),
                        height: 74,
                        padding: const EdgeInsets.only(left: 12),
                        child: const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 243, 67, 54),
                                  fontSize: 24)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        title: const Text(
                          'Jaxongir Rustamov',
                          style: TextStyle(
                              color: Color.fromARGB(255, 187, 14, 2),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "This was interesting movie",
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Container(
                          height: 60,
                          width: 60,
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYIMmE0bLUSDD7LII20c-b06qmFH_ZWUqUQA&usqp=CAU",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Divider(
                        thickness: 2,
                        color: Color.fromARGB(255, 243, 67, 54),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
