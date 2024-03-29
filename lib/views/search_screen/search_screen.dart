import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_movieapp/constants/constant.dart';
import 'package:flutter_application_movieapp/controller/search_provider.dart';
import 'package:flutter_application_movieapp/views/detail_screen/detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchProvider.searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: "Search...",
                ),
                onChanged: (value) {
                  searchProvider.searchMovies(value);
                },
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: [
          if (searchProvider.searchedResult.isNotEmpty)
            GridView.builder(
              itemCount: searchProvider.searchedResult.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.4,
              ),
              itemBuilder: (context, index) {
                final searchData = searchProvider.searchedResult[index];
                final posterPath = searchData.posterPath;
                if (posterPath != null) {
                  final imageUrl = '${Constant.imagPath}$posterPath';
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(1.2),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                          ),
                          color: const Color.fromARGB(255, 10, 22, 112),
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailesScreen(
                          id: searchData.id!,
                          movie: searchData,
                        ),
                      ));
                    },
                  );
                } else {
                  return const Text("No Data");
                }
              },
            )
          else
            Center(
              child: Text(
                "You can search here movies you want",
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
