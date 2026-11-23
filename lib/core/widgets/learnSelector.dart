
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class LearningGoalSelector extends StatefulWidget {
  final int? selectedMinutes;
  final ValueChanged<int> onChanged;
  const LearningGoalSelector({
    super.key,
    required this.selectedMinutes,
    required this.onChanged,
  });
  @override
  State<LearningGoalSelector> createState() =>
      _LearningGoalSelectorState();
}
class _LearningGoalSelectorState extends State<LearningGoalSelector> {
  final List<int> minutesOptions = [15, 20, 30, 40];
  bool isExpanded = false;
  void toggleDropdown() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
  void selectMinutes(int minutes) {
    widget.onChanged(minutes);
    setState(() {
      isExpanded = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: toggleDropdown,
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: const Color(0xff9CA3AF),
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time_filled,
                  size: 20,
                  color: Color(0xff374151),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.selectedMinutes == null
                        ? 'typeHowManyMinutes'.tr()
                        : '${widget.selectedMinutes} ${'minutes'.tr()}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: widget.selectedMinutes == null
                          ? const Color(0xff6B7280)
                          : Colors.black87,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Color(0xff6B7280)),
                    ),
                  ),
                  child: AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff6B7280),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ClipRect(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            reverseDuration: const Duration(milliseconds: 150),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              return SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: isExpanded
                ? Container(
                    key: const ValueKey('dropdown_open'),
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xff9CA3AF),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        minutesOptions.length,
                        (index) {
                          final minutes = minutesOptions[index];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () => selectMinutes(minutes),
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  color: widget.selectedMinutes == minutes
                                      ? const Color(0xFFE5F0FA)
                                      : Colors.white,
                                  child: Text(
                                    '$minutes ${'minutes'.tr()}',
                                  ),
                                ),
                              ),
                              if (index != minutesOptions.length - 1)
                                const Divider(
                                  height: 2,
                                  thickness: 2,
                                  color: Color(0xffF3F4F6),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                : const SizedBox(
                    key: ValueKey('dropdown_closed'),
                    width: double.infinity,
                  ),
          ),
        ),
      ],
    );
  }
}