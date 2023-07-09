import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/core/widgets/elevation_button_widget.dart';
import 'package:betweener_app/core/widgets/text_form_field_and_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
          'Edit User Info',
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
              40.height(),
              Center(
                child: Container(
                  height: 187.h,
                  width: 187.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/dummy_image/person.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              30.height(),
              TextFormFieldAndLabelWidget(
                controller: nameController..text = 'John Doe',
                label: 'name',
                hintText: '',
                textInputType: TextInputType.name,
                validate: (p0) {},
              ),
              20.height(),
              TextFormFieldAndLabelWidget(
                controller: emailController..text = 'example@gmail.com',
                label: 'email',
                hintText: '',
                textInputType: TextInputType.name,
                validate: (p0) {},
              ),
              20.height(),
              TextFormFieldAndLabelWidget(
                controller: phoneController..text = '+97000000000',
                label: 'phone',
                hintText: '',
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
