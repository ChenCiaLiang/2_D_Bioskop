import 'package:flutter/material.dart';
import 'package:tubez/screens/pdf_view.dart'; // Import your pdf view file
import 'package:tubez/screens/selectPayment.dart';
import 'package:tubez/widgets/paymentWidgets/CountDown.dart';
import 'package:tubez/widgets/paymentWidgets/MovieDescription.dart';
import 'package:tubez/model/pdfItem.dart'; // Make sure this import exists for your 'Movie' model

class paymentScreenState extends StatefulWidget {
  final Set<String> mySeats;

  paymentScreenState({super.key, required this.mySeats});

  @override
  State<paymentScreenState> createState() => _paymentScreenStateState();
}

class _paymentScreenStateState extends State<paymentScreenState> {
  @override
  Widget build(BuildContext context) {
    Set<String> mySeats = widget.mySeats;
    // Example movie data
    List<Movie> soldMovies = [
      Movie(name: 'Movie 1', price: 45.00),
      Movie(name: 'Movie 2', price: 50.00),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text(
          "Order Confirmation",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove the default shadow of the AppBar
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0), // Padding around the content
            child: Column(
              children: [
                const CountDown(),
                const SizedBox(height: 20),
                const MovieDescription(),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 63, 62, 62),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                              Icons.add_card_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          width: 10), // Adjusted spacing between icon and text
                      Column(
                        children: [
                          Row(children: [
                            const Text(
                              "Tickets",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 140),
                            const Text("2x Rp 45.000",
                                style: TextStyle(color: Colors.white)),
                          ]),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                " ${mySeats.join(', ')}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1, // Ensure text is on a single line
                              ),
                              const SizedBox(width: 170),
                              const Text(
                                "90.000",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      "SubTotal",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Rp 90.000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "OrderFees",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Rp 0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Total Payment",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "Rp 90.000",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigate to a new screen when the user taps the container
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            selectPaymentScreen(), // Replace with your target screen
                      ),
                    );
                  },
                  child: Container(
                    color: const Color.fromARGB(255, 44, 43, 43),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 63, 62, 62),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                              Icons.add_card_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Dana",
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Spacer(),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    createPDF(
                      'John Doe',
                      90.00,
                      context,
                      soldMovies,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
