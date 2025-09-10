import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  // _selectedBottomNavIndex is now managed implicitly by GoRouter's current path,
  // but keeping it for local visual state if necessary, overridden by GoRouterState.
  int _selectedBottomNavIndex = 0;

  final List<String> categories = [
    'All Coffee',
    'Machiato',
    'Latte',
    'Americano',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'id': 'I154:321;417:715',
      'name': 'Caffe Mocha',
      'description': 'Deep Foam',
      'rating': '4.8',
      'price': '4.53',
    },
    {
      'id': 'I154:337;417:717',
      'name': 'Flat White',
      'description': 'Espresso',
      'rating': '4.8',
      'price': '3.53',
    },
    {
      'id': 'I154:369;417:716',
      'name': 'Mocha Fusi',
      'description': 'Ice/Hot',
      'rating': '4.8',
      'price': '7.53',
    },
    {
      'id': 'I154:353;417:718',
      'name': 'Caffe Panna',
      'description': 'Ice/Hot',
      'rating': '4.8',
      'price': '5.53',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final bottomPadding = mediaQuery.padding.bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF131313),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 99 + bottomPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Section (Gradient Background and Header Content)
                  Container(
                    width: screenWidth,
                    height: mediaQuery.size.height * 0.34, // Approximately 280/812
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF131313),
                          Color(0xFF313131),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Location',
                                        style: GoogleFonts.sora(
                                          color: const Color(0xFFA2A2A2),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.12,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(
                                            'Bilzen, Tanjungbalai',
                                            style: GoogleFonts.sora(
                                              color: const Color(0xFFD8D8D8),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFFD8D8D8),
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white.withOpacity(0.1),
                                    ),
                                    child: const Icon(Icons.person_outline, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF242424),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.search,
                                          color: Color(0xFFA2A2A2),
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: TextField(
                                            style: GoogleFonts.sora(
                                              color: const Color(0xFFA2A2A2),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Search coffee',
                                              hintStyle: GoogleFonts.sora(
                                                color: const Color(0xFFA2A2A2),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  width: 52,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE89843),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.filter_list,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // Handle filter button press
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Promo Banner (overlaps with the top section)
                  Transform.translate(
                    offset: Offset(0, -mediaQuery.size.height * 0.085), // Adjust this value to control overlap
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      width: screenWidth - 48,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/154_387.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFED5151),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Promo',
                                style: GoogleFonts.sora(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Buy one get one FREE',
                              style: GoogleFonts.sora(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                height: 1.25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Space below banner to push categories up
                  SizedBox(height: mediaQuery.size.height * 0.01), // Adjust as needed
                  // Category Tabs
                  SizedBox(
                    height: 29,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: categories.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final isSelected = index == _selectedCategoryIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategoryIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFE89843)
                                  : const Color(0xFFEDEDED).withOpacity(0.35),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: GoogleFonts.sora(
                                  color: isSelected ? Colors.white : const Color(0xFF313131),
                                  fontSize: 14,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Product Grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        // Calculate crossAxisCount based on screen width
                        // A card width of 156 with 16 spacing implies 2 cards for 375px width (375 - 24*2 - 16 / 2 = 155.5)
                        // For responsiveness, ensure cards don't shrink too much.
                        final cardWidth = 156.0;
                        final spacing = 16.0;
                        final availableWidth = constraints.maxWidth;
                        final crossAxisCount =
                            (availableWidth + spacing) ~/ (cardWidth + spacing);

                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(), // Important to allow parent scroll
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: spacing,
                            mainAxisSpacing: spacing,
                            childAspectRatio: (cardWidth / 238), // Original card width / height
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                context.push('/detail_item', extra: product); // Replaced Navigator.pushNamed with context.push
                              },
                              child: _buildProductCard(
                                id: product['id']!,
                                name: product['name']!,
                                description: product['description']!,
                                rating: product['rating']!,
                                price: product['price']!,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Navigation Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomNavigationBar(context, bottomPadding),
            ),
            // Home Indicator
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                top: false,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    width: 134,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFF242424),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String id,
    required String name,
    required String description,
    required String rating,
    required String price,
  }) {
    final assetPath = 'assets/images/${id.replaceAll(':', '_').replaceAll(';', '_')}.png';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  assetPath,
                  width: double.infinity,
                  height: 128, // Fixed height for product images
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xFF313131),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Color(0xFFFAC34E), size: 12),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: GoogleFonts.sora(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: GoogleFonts.sora(
                color: const Color(0xFF242424),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: GoogleFonts.sora(
                color: const Color(0xFFA2A2A2),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(), // Pushes price and button to the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ $price',
                  style: GoogleFonts.sora(
                    color: const Color(0xFF050505),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE89843),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero, // Remove default padding
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: () {
                      // Handle add to cart for this product
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, double bottomPadding) {
    return Container(
      height: 99 + bottomPadding,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBottomNavItem(context, Icons.home_rounded, 0, '/home_page'),
          _buildBottomNavItem(context, Icons.favorite_border_rounded, 1, '/favorites'), // Placeholder route, ensure it's defined in GoRouter
          _buildBottomNavItem(context, Icons.shopping_bag_outlined, 2, '/cart'), // Placeholder route
          _buildBottomNavItem(context, Icons.notifications_none_rounded, 3, '/notifications'), // Placeholder route
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(BuildContext context, IconData icon, int index, String routeName) {
    // Determine if this item's route is the current route or a child of it
    // Using GoRouterState.of(context).uri.toString() to get the current full path
    final currentPath = GoRouterState.of(context).uri.toString();
    final bool isSelected = currentPath.startsWith(routeName);

    return GestureDetector(
      onTap: () {
        // Only navigate if not already on the selected tab
        if (!isSelected) {
          setState(() {
            _selectedBottomNavIndex = index; // Update internal state for immediate visual feedback
          });
          context.go(routeName); // Use context.go for bottom navigation tabs to replace the stack
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFE89843) : const Color(0xFFA2A2A2),
            size: 24,
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 10,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFE89843),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
        ],
      ),
    );
  }
}