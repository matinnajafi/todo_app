import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/domain/entities/category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;

  final List<Category> categories = const [
    Category(title: 'همه', iconName: 'checklist', color: greyColor),
    Category(title: 'کاری', iconName: 'briefcase', color: greenColor),
    Category(title: 'شخصی', iconName: 'people', color: orangeColor),
    Category(title: 'آموزش', iconName: 'study', color: blueColor),
    Category(title: 'ورزش', iconName: 'ball', color: redColor),
    Category(title: 'قرارملاقات', iconName: 'meeting', color: yellowColor),
    Category(title: 'خرید', iconName: 'bag', color: pinkColor),
    Category(title: 'مدیتیشن', iconName: 'meditation', color: purpleColor),
    Category(title: 'کار بانکی', iconName: 'bankking', color: tealColor),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 166,
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: CategoryCardItem(
                  category: category,
                  isSelected: selectedIndex == index,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCardItem extends StatelessWidget {
  final Category category;
  final bool isSelected;

  const CategoryCardItem({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 146,
            width: isSelected ? 120 : 80,
            decoration: ShapeDecoration(
              color:
                  isSelected
                      // ignore: deprecated_member_use
                      ? category.color.withOpacity(1.0)
                      // ignore: deprecated_member_use
                      : category.color.withOpacity(0.25),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(52),
              ),
              shadows: [
                BoxShadow(
                  color:
                      isSelected
                          // ignore: deprecated_member_use
                          ? category.color.withOpacity(0.5)
                          : Colors.transparent,
                  blurRadius: isSelected ? 20 : 0,
                  spreadRadius: isSelected ? -3 : 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  bottom: isSelected ? 54 : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isSelected ? 62 : 32,
                    child: Image.asset('images/${category.iconName}.png'),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  child: AnimatedContainer(
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 250),
                    height: 26,
                    width: isSelected ? 90 : 0,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        category.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
