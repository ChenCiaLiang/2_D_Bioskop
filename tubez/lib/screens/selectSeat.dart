import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tubez/client/TransaksiClient.dart';
import 'package:tubez/model/transaksi.dart';
import 'dart:ui';
import 'package:tubez/widgets/MovieDetailWidgets/BackButton.dart';
import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'package:tubez/screens/payment.dart';

class TrapeziumPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(
          255, 255, 255, 255) // Set the color of the trapezium
      ..style = PaintingStyle.fill; // Fill the trapezium

    Path path = Path()
      ..moveTo(size.width * 0.1, 0) // Top-left corner
      ..lineTo(
          size.width * 0.2, size.height) // Bottom-left corner (20% from left)
      ..lineTo(
          size.width * 0.8, size.height) // Bottom-right corner (80% from left)
      ..lineTo(size.width * 0.9, 0) // Top-right corner
      ..close(); // Close the path to form the flipped trapezium

    canvas.drawPath(path, paint); // Draw the trapezium path
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Only repaint if needed
  }
}

class selectSeatScreen extends StatefulWidget {
  const selectSeatScreen({super.key});

  @override
  State<selectSeatScreen> createState() => _selectSeatScreenState();
}

class _selectSeatScreenState extends State<selectSeatScreen> {
  Set<SeatNumber> selectedSeats = Set();
  Set<String> mySeats = {}; // This will store the translated seat numbers
  late Future<List<Transaksi>> futureTransaksi;
  final int rows = 10;
  final int cols = 10;

  @override
  void initState() {
    super.initState();
    futureTransaksi = TransaksiClient
        .getAllKursi(); // Fetch data when the widget is initialized
  }

  List<List<SeatState>> generateSeatLayout(List<Transaksi> transaksiList) {
    // Collect all reserved seats
    List<String> reservedSeats =
        transaksiList.expand((transaksi) => transaksi.kursiDipesan).toList();

    // Initialize the seat layout with unselected seats
    List<List<SeatState>> seatLayout = List.generate(
      rows,
      (rowIndex) => List.generate(
        cols,
        (colIndex) => SeatState.unselected,
      ),
    );

    // Map reserved seats to their indices and mark them as sold
    for (String seat in reservedSeats) {
      String rowLetter = seat[0].toLowerCase(); // Get the row letter
      int rowIndex =
          rowLetter.codeUnitAt(0) - 'a'.codeUnitAt(0); // Convert to row index
      int colIndex =
          int.parse(seat.substring(1)) - 1; // Get column index (zero-based)

      if (rowIndex >= 0 &&
          rowIndex < rows &&
          colIndex >= 0 &&
          colIndex < cols) {
        seatLayout[rowIndex][colIndex] = SeatState.sold;
      }
    }

    return seatLayout;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackButtonWidget(),

            // Trapezium Container
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // First widget: CustomPaint for the trapezium
                    Container(
                      child: CustomPaint(
                        size: Size(MediaQuery.of(context).size.width, 100),
                        painter: TrapeziumPainter(),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: FutureBuilder(
                            future: futureTransaksi,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text("Error: ${snapshot.error}"));
                              } else if (snapshot.hasData) {
                                List<List<SeatState>> currentSeatsState =
                                    generateSeatLayout(snapshot.data!);
                                return SeatLayoutWidget(
                                  onSeatStateChanged: (rowI, colI, seatState) {
                                    String seatString =
                                        SeatNumber(rowI: rowI, colI: colI)
                                            .toString();

                                    if (seatState == SeatState.selected) {
                                      selectedSeats.add(
                                          SeatNumber(rowI: rowI, colI: colI));
                                      mySeats.add(seatString);
                                    } else {
                                      selectedSeats.remove(
                                          SeatNumber(rowI: rowI, colI: colI));
                                      mySeats.remove(seatString);
                                    }
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          seatState == SeatState.selected
                                              ? "My Selected Seats: ${mySeats.join(', ')}"
                                              : "My Selected Seats: ${mySeats.join(', ')}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        backgroundColor: const Color.fromARGB(
                                            255, 56, 55, 55),
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                  },
                                  stateModel: SeatLayoutStateModel(
                                    rows: rows,
                                    cols: cols,
                                    seatSvgSize: 35,
                                    pathUnSelectedSeat:
                                        'assets/images/availableSeat.svg',
                                    pathSelectedSeat:
                                        'assets/images/selectedSeat.svg',
                                    pathSoldSeat: 'assets/images/soldSeat.svg',
                                    pathDisabledSeat:
                                        'assets/images/soldSeat.svg',
                                    currentSeatsState: currentSeatsState,
                                  ),
                                );
                              } else {
                                return Center(child: Text("No data available"));
                              }
                            }),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          showSlideInModal(context, mySeats);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/selectedSeat.svg'),
                              SizedBox(height: 10),
                              Text(
                                "Selected",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/availableSeat.svg'),
                              SizedBox(height: 10),
                              Text(
                                "Available",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              SvgPicture.asset('assets/images/soldSeat.svg'),
                              SizedBox(height: 10),
                              Text(
                                "Unavailable",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(0, 158, 158, 158),
                      radius: 30,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI &&
        colI == (other as SeatNumber).colI;
  }

  @override
  int get hashCode =>
      rowI.hashCode ^
      colI.hashCode; // Ensure both row and col are used for hashing

  @override
  String toString() {
    return '${translateRowToString(rowI)}${colI + 1}'; // Convert to seat label like A1, B2, C3, etc.
  }

  // Function to convert row index to letter (A, B, C, etc.)
  String translateRowToString(int rowIndex) {
    return String.fromCharCode(65 + rowIndex); // 65 is ASCII for 'A'
  }
}

void showSlideInModal(BuildContext context, Set<String> mySeats) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allow height to adjust based on content
    backgroundColor: Colors.black, // Optional: make the background transparent
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          color: const Color.fromARGB(255, 35, 35, 35),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Text(
                        "Seat Details",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          child: Image.asset('assets/images/spiderman.jpg')),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spiderman into The Spiderverse",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Monday, 07 Desember 2024",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 72, 70, 70)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "- Your Tickets cannot be exchanged or refunded",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.amber),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "- Children ages 2 or above require tickets",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.amber),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 63, 62, 62),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, top: 8),
                                child: Text(
                                  "Number of Seats: 2", // This number can be dynamic if needed
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7.0),
                                child: Text(
                                  "My Seats: ${mySeats.join(', ')}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: [
                        Text(
                          "Total:",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        Text(
                          "Rp 90.000",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.amber),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        var response = await TransaksiClient.createTransaksi(
                            5,
                            "Credit Card",
                            (45 * mySeats.length).toDouble(),
                            mySeats.toList());

                        if (response.statusCode == 200) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => paymentScreenState()));
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Password Salah'),
                              content: TextButton(
                                  onPressed: () => {},
                                  child: const Text('Daftar Disini !!!')),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Error'),
                            content: TextButton(
                                onPressed: () => {},
                                child: const Text('Samting wong')),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                      child: Text(
                        'Confirm',
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
              )
            ],
          ),
        ),
      );
    },
  );
}
