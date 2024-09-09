import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateJobView extends StatefulWidget {
  const CreateJobView({super.key});

  @override
  State<CreateJobView> createState() => _CreateJobViewState();
}

class _CreateJobViewState extends State<CreateJobView> {
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        leading: UiHelpers.backButton(),
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: UiHelpers.appText(
          title: 'Create Job',
          fSize: 16,
          fweight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelpers.appText(
              title: 'Job Title',
              fSize: 15.5,
            ),
            Sp.y(1.3),
            UiHelpers.inputField(
                context: context, label: 'Type Tittle', padding: 1.1),
            Sp.y(1.3),
            UiHelpers.appText(
              title: 'Category',
              fSize: 15.5,
            ),
            Sp.y(1.3),
            UiHelpers.customDropdownField(
              hintText: 'Choose Category',
              items: [
                'Plumber',
                'Electrition',
                'Carpenter',
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
            ),
            Sp.y(1.3),
            UiHelpers.appText(
              title: 'Location',
              fSize: 15.5,
            ),
          ],
        ),
      ),
    );
  }
}
