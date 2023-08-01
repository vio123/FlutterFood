import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedItem = 'All';

  Widget _buildItem(String label, String icon) {
    final isSelected = _selectedItem == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedItem = null; // Deselect the current item
          } else {
            _selectedItem = label; // Select the tapped item
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: ShapeDecoration(
          color: isSelected ? Color(0xFF1BAC4B) : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF1BAC4B)),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              icon,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF1BAC4B),
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 1.40,
                letterSpacing: 0.20,
              ),
            ),
            SizedBox(width: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF1BAC4B),
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 1.40,
                letterSpacing: 0.20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Caută aici',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 316,
                    child: Text(
                      'Recommended For You 😍',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 1.20,
                      ),
                    ),
                  ),
                  Text(
                    'See All',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF1BAC4B),
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      height: 1.40,
                      letterSpacing: 0.20,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildItem('All', '✅'),
                    const SizedBox(width: 12),
                    _buildItem('Hamburger', '🍔'),
                    const SizedBox(width: 12),
                    _buildItem('Pizza', '🍕'),
                    const SizedBox(width: 12),
                    _buildItem('Drink', '🍺'),
                    const SizedBox(width: 12),
                    _buildItem('Others', '🥮'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: _selectedItem == "All"
                      ? FirebaseFirestore.instance
                          .collection('restaurants')
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection('restaurants')
                          .where('category', isEqualTo: _selectedItem)
                          .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
                    final List<Widget> restaurantList = documents.map((doc) => restaurantListItem(doc)).toList();

                    return ListView(
                      children: restaurantList,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget restaurantListItem(QueryDocumentSnapshot doc) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: 148),
      padding: const EdgeInsets.all(14),
      decoration: ShapeDecoration(
        color: Color(0xFF1F222A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0C04060F),
            blurRadius: 60,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xFFBDBDBD),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(doc['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                   doc['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    height: 1.20,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      '800 m',
                      style: TextStyle(
                        color: Color(0xFFE0E0E0),
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.20,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '|',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE0E0E0),
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.20,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '4.9',
                      style: TextStyle(
                        color: Color(0xFFE0E0E0),
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.20,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '(2.3k)',
                      style: TextStyle(
                        color: Color(0xFFE0E0E0),
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(width: 8),
                    Icon(Icons.favorite, size: 24, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
