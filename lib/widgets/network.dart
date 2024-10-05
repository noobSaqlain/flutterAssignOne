import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkLayer extends StatefulWidget {
  const NetworkLayer({super.key});

  @override
  State<NetworkLayer> createState() => _NetworkLayerState();
}

class _NetworkLayerState extends State<NetworkLayer> {
  List<Post>? posts = [];

  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    try {
      final response = await http.get(
        Uri.parse('https://mpa0771a40ef48fcdfb7.free.beeceptor.com/jobs'),
      );

      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        List jsonData = jsonRes['data']; // Access 'data' field
        setState(() {
          posts = jsonData.map((post) => Post.fromJson(post)).toList();
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        posts!.isNotEmpty
            ? Expanded(
                // Wrap ListView with Expanded
                child: ListView.builder(
                  itemCount: posts!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: const ContinuousRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue,
                          width: 0.1,
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(posts![index].companyLogo),
                        ),
                        title: Text(posts![index].jobTitle),
                        subtitle: Text(
                          '${posts![index].companyName} - ${posts![index].location}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        trailing: Text(
                          posts![index].jobType,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    );
                  },
                ),
              )
            : const Text('No job posts available'),
      ],
    );
  }
}

class Post {
  final String companyName;
  final String jobTitle;
  final String jobType;
  final String companyLogo;
  final String location;
  final String timePosted;

  Post(
      {required this.companyName,
      required this.jobTitle,
      required this.jobType,
      required this.companyLogo,
      required this.location,
      required this.timePosted});

  factory Post.fromJson(Map<String, dynamic> json) {
    final job = json['job'];
    return Post(
      companyName: job['company']['name'],
      companyLogo: job['company']['logo'],
      jobType: job['type']['name_en'],
      jobTitle: job['title'],
      location: job['location']['name_en'],
      timePosted: job['created_date'],
    );
  }
}
