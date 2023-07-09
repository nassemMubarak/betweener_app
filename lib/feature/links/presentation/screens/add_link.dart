import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/core/widgets/elevation_button_widget.dart';
import 'package:betweener_app/core/widgets/text_form_field_and_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddLink extends StatelessWidget {
  AddLink({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE7E5F1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          'Add Link',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              80.height(),
              TextFormFieldAndLabelWidget(
                controller: titleController,
                label: 'title',
                hintText: 'Snapchat',
                textInputType: TextInputType.name,
                validate: (p0) {},
              ),
              20.height(),
              TextFormFieldAndLabelWidget(
                controller: linkController,
                label: 'link',
                hintText: 'http:\\www.Example.com',
                textInputType: TextInputType.name,
                validate: (p0) {},
              ),
              41.height(),
              SizedBox(
                width: 138.w,
                height: 50.h,
                child: ElevatedButtonWidget(
                  text: 'SAVE',
                  textColor: const Color(0xff784E00),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
