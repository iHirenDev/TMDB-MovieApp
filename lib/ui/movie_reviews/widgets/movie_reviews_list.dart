// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/repository/models/movie_reviews.dart';
import 'package:flutter_bloc_demo/ui/movie_details/movie_details_page.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_description_widget.dart';
import 'package:flutter_bloc_demo/ui/movie_reviews/widgets/movie_reviews_header_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieReviewsList extends StatelessWidget {
  const MovieReviewsList(
      {Key? key, required this.reviews, required this.ratings})
      : super(key: key);

  final List<Reviews> reviews;
  final double ratings;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ratings.toString().substring(0, 3) + '/10',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
                initialRating: ratings,
                itemCount: 10,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 50,
                    ),
                onRatingUpdate: (rating) {}),
            Expanded(
              child: reviews.isEmpty
                  ? Center(
                      child: Text(
                      'No reviews yet',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ))
                  : ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  'Review by: ' +
                                      reviews[index].authorDetails.username,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                            const Divider(
                              height: 4.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: reviews.length > 3
                                  ? MovieDescriptionWidget(
                                      textContent: reviews[index].content,
                                      isReviews: true)
                                  : Text(reviews[index].content,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 4,
                            )
                          ],
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
