import 'package:flutter/material.dart';

class BarberReviewsPage extends StatelessWidget {
  BarberReviewsPage({super.key});
  final List<int> ratings = [4, 5, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Últimas avaliações',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: ratings.length,
              itemBuilder: (BuildContext context, int index) {
                return Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              i < ratings[index]
                                  ? Icons.star
                                  : Icons.star_border,
                              size: MediaQuery.of(context).size.width * 0.05,
                              color: Colors.yellow[700],
                            ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Expanded(
                            child: Text(
                              'Avaliação ${index + 1}',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
