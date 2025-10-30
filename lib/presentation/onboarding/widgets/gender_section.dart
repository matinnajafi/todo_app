import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/enums/gender_enum.dart';

class GenderContainers extends StatefulWidget {
  const GenderContainers({super.key});

  @override
  State<GenderContainers> createState() => _GenderContainersState();
}

class _GenderContainersState extends State<GenderContainers> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    final double containerWidth =
        MediaQuery.of(context).size.width *
        0.38; // 0.02 for padding between boxes

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          Gender.values.reversed.map((gender) {
            final bool isSelected = selectedGender == gender;
            return _buildGenderBox(
              gender: gender,
              isSelected: isSelected,
              onTap: () => setState(() => selectedGender = gender),
              width: containerWidth,
            );
          }).toList(),
    );
  }

  Widget _buildGenderBox({
    required Gender gender,
    required bool isSelected,
    required VoidCallback onTap,
    required double width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
        height: 140,
        width: width,
        decoration: ShapeDecoration(
          color:
              isSelected
                  ? gender.activeColor
                  // ignore: deprecated_member_use
                  : gender.activeColor.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
              height: isSelected ? 95 : 75,
              child: Image.asset(gender.iconPath),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Text(
                gender.labelFa,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? whiteColor : greyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderTitle extends StatelessWidget {
  const GenderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'جنسیت',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: blackColor,
          ),
        ),
      ],
    );
  }
}
