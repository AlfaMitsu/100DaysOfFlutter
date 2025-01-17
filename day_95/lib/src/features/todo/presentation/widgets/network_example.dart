import 'package:flutter/material.dart';

import 'common_example_route_wrapper.dart';
import 'example_app_bar_layout.dart';
import 'example_button_node.dart';

class NetworkExample extends StatelessWidget {
  const NetworkExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
      title: "Network",
      showGoBack: true,
      child: ListView(
        children: [
          ExampleButtonNode(
            title: "Image from the internet (with custom loader)",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommonExampleRouteWrapper(
                    imageProvider: const NetworkImage(
                      "https://source.unsplash.com/1900x3600/?camera,paper",
                    ),
                    loadingBuilder: (context, event) {
                      if (event == null) {
                        return const Center(
                          child: Text("Loading"),
                        );
                      }
                      final value = event.cumulativeBytesLoaded /
                          (event.expectedTotalBytes ??
                              event.cumulativeBytesLoaded);
                      final percentage = (100 * value).floor();
                      return Center(
                        child: Text("$percentage%"),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Error image",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CommonExampleRouteWrapper(
                    imageProvider: NetworkImage(
                      "https://pudim.com.br/sss.jpg",
                    ),
                    backgroundDecoration: BoxDecoration(
                      color: Color(0xffa1a1a1),
                    ),
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Error image with custom error screen",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommonExampleRouteWrapper(
                    imageProvider: const NetworkImage(
                      "https://pudim.com.br/sss.jpg",
                    ),
                    errorBuilder: (_, __, ___) {
                      return Column(
                        children: [
                          Image.asset("assets/neat.gif"),
                          const Text("well, that went badly"),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
