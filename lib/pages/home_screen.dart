import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:wa_clone/pages/chat_screen.dart';
import 'story_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              SizedBox(
                width: size.width / 8,
                child: const Tab(
                  icon: Icon(Icons.camera_alt),
                ),
              ),
              SizedBox(width: size.width / 8, child: const Tab(text: "Chats")),
              SizedBox(width: size.width / 8, child: const Tab(text: "Status")),
              SizedBox(
                width: size.width / 8,
                child: const Tab(
                  text: "Calls",
                ),
              )
            ],
            isScrollable: true,
            indicatorColor: const Color(0xffF1F6F9),
          ),
          title: const Text("WhatsApp"),
          backgroundColor: const Color(0xff075e54),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        body: TabBarView(
          children: [
            const Icon(Icons.camera_alt),
            ListView.builder(
              itemCount: 2,
              itemBuilder: (_, index) {
                final String _name = faker.person.name();

                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        _name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      subtitle: const Text(
                        "Laptopu siberde ku...",
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Initicon(
                        text: _name,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: const [
                            Text("23:01"),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage(
                                      name: _name,
                                    )));
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Initicon(
                      text: "Vally",
                      backgroundColor: Colors.grey.shade300,
                    ),
                    title: const Text(
                      "My Status",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    subtitle: const Text(
                      "Laptopu siberde ku...",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("Recent Update"),
                  ),
                  ListTile(
                    leading: Initicon(
                      text: "Sonia",
                      backgroundColor: Colors.grey.shade300,
                    ),
                    title: const Text(
                      "Umut Ocak",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text(
                      "20 Haziran Pazar 00:20",
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StoryPageView())),
                  ),
                ],
              ),
            ),
            ListView(
              children: [
                ListTile(
                  title: const Text("Ernes",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  subtitle: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.red,
                        size: 15.5,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Yesterday, 19.50", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  leading: Initicon(
                    text: "Ernes",
                    backgroundColor: Colors.grey.shade300,
                  ),
                  trailing: const Icon(
                    Icons.phone,
                    color: Color(0xff075e54),
                  ),
                  onTap: () {},
                ),
                const Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
