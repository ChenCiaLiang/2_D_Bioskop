import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:tubez/widgets/MovieDetailWidgets/BackButton.dart';
import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

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
  Set<String> mySeats = Set(); // This will store the translated seat numbers

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
                        child: SeatLayoutWidget(
                          onSeatStateChanged: (rowI, colI, seatState) {
                            print(
                                "Seat tapped: ${SeatNumber(rowI: rowI, colI: colI)} - State: $seatState");

                            // Translate the seat number
                            String seatString =
                                SeatNumber(rowI: rowI, colI: colI).toString();

                            // Add or remove seat from 'mySeats'
                            if (seatState == SeatState.selected) {
                              selectedSeats
                                  .add(SeatNumber(rowI: rowI, colI: colI));
                              mySeats.add(
                                  seatString); // Add the translated seat number to 'mySeats'
                            } else {
                              selectedSeats
                                  .remove(SeatNumber(rowI: rowI, colI: colI));
                              mySeats.remove(
                                  seatString); // Remove the translated seat number from 'mySeats'
                            }

                            // Optionally print the updated 'mySeats' list
                            print("My selected seats: $mySeats");
                          },
                          stateModel: const SeatLayoutStateModel(
                            rows: 10,
                            cols: 10,
                            seatSvgSize: 35,
                            pathUnSelectedSeat:
                                'assets/images/availableSeat.svg',
                            pathSelectedSeat: 'assets/images/selectedSeat.svg',
                            pathSoldSeat: 'assets/images/soldSeat.svg',
                            pathDisabledSeat: 'assets/images/soldSeat.svg',
                            currentSeatsState: [
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              [
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.sold,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                                SeatState.unselected,
                              ],
                              // Add more seat states as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => selectSeatScreen()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          child: Text(
                            'Confirm',
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
                      backgroundColor: const Color.fromARGB(36, 158, 158, 158),
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
