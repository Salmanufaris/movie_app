import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/api/api.dart';
import 'package:flutter_application_movieapp/constants/constant.dart';
import 'package:flutter_application_movieapp/models/cast.dart';
import 'package:flutter_application_movieapp/models/movies.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailesScreen extends StatelessWidget {
  DetailesScreen({
    super.key,
    required this.movie,
    required this.id,
  });

  final Movies movie;
  int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          // leading: const BackBtn(),
          backgroundColor: Colors.amber,
          expandedHeight: 400,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: Image.network(
                '${Constant.imagPath}${movie.posterPath}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  'overview',
                  style: GoogleFonts.openSans(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  movie.overView!,
                  style: GoogleFonts.acme(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Release Date :  ',
                              style: GoogleFonts.acme(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              movie.releaseDate!,
                              style: GoogleFonts.acme(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Rating ',
                        style: GoogleFonts.acme(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text('${movie.voteAverage!.toStringAsFixed(1)}/10')
                    ],
                  ),
                ),
                FutureBuilder(
                  // future:Provider.of<CastProvider>(context,listen: false).loadCast(context, id),
                  future: Api().getCast(
                    castUrl:
                        'https://api.themoviedb.org/3/movie/$id/credits?api_key=b3e0d3eff8d8a525377abdb307695baa',
                    context: context,
                  ),
                  builder: (context, AsyncSnapshot<List<CastModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text("No data available");
                    } else {
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            CastModel casts = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: CircleAvatar(
                                        radius: 45,
                                        backgroundImage: NetworkImage(
                                            '${Constant.imagPath}${casts.profilePath!}'),
                                      ),
                                    ),
                                  ),
                                  Text(casts.name!),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
