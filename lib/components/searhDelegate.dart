import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  List<String> suggestions = [
      'asd',
      'asdasd',
      'asd',
      'asdasd',
      'asd',
      'asdasd',
    ];
  
  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
        ),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      ),
    ]; 
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    ); //searching result
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

           
          },
        );
      },
    );
  }
}
