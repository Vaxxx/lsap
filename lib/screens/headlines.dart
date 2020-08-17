import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sapientia/model/news.dart';
import 'package:sapientia/model/services.dart';
import 'package:sapientia/utilities/constants.dart';
import 'package:sapientia/widgets/details-page.dart';
import 'package:sapientia/widgets/nav-drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Headlines extends StatefulWidget {
  @override
  _HeadlinesState createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {
  Services news = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      body: FutureBuilder<List<News>>(
        future: news.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  News newsItem = snapshot.data[index];
                  return Card(
                    elevation: 100,
                    child: InkWell(
                      onTap: () {
                        //send to details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return DetailsPage(newsItem);
                              },
                              fullscreenDialog: true),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //Text(newsItem.title)
                          newsItem.image != null
                              ? Image.network(newsItem.image)
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                newsItem.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Html(
                              data: newsItem.excerpt,
                              onLinkTap: (String link) {
                                _launchUrl(link);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return Container(
            color: colorWhite,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

_launchUrl(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Cannot launch $link';
  }
}
