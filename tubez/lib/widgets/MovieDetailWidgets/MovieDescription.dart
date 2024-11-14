import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 0,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Container(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height,
              child: Container(
                child: Image.asset('assets/images/spiderman.jpg'),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text(
                            "SPIDER-MAN : INTO THE SPIDERVERSE",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          child: const Text(
                            "Synopsis",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(right: 6),
                          child: Scrollbar(
                            thumbVisibility: true,
                            radius: Radius.circular(8),
                            thickness: 3,
                            child: Container(
                              margin: const EdgeInsets.only(right: 6.0),
                              child: const SingleChildScrollView(
                                  child: Text(
                                      "Bitten by a radioactive spider in the subway, Brooklyn teenager Miles Morales suddenly develops mysterious powers that transform him into the one and only Spider-Man. When he meets Peter Parker, he soon realizes that there are many others who share his special, high-flying talents. Miles must now use his newfound skills to battle the evil Kingpin, a hulking madman who can open portals to other universes and pull different versions of Spider-Man into our world.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 206, 206, 206),
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
