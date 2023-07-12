import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/core/widgets/elevation_button_widget.dart';
import 'package:betweener_app/core/widgets/text_form_field_and_label_widget.dart';
import 'package:betweener_app/feature/links/domain/entities/link.dart';
import 'package:betweener_app/feature/links/presentation/bolc/link_update/link_update_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditLink extends StatelessWidget {
  Link link;
  late final TextEditingController titleController;
  late final TextEditingController linkController;
  final _formKey = GlobalKey<FormState>();

  EditLink({
    required this.link,
    Key? key,
  }) : super(key: key) {
    titleController = TextEditingController()..text = link.title;
    linkController = TextEditingController()..text = link.link;
  }

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
          'Edit',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                80.height(),
                TextFormFieldAndLabelWidget(
                  controller: titleController,
                  label: 'title',
                  hintText: 'Snapchat',
                  textInputType: TextInputType.name,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the title';
                    }
                    link.title = titleController.text;
                    return null;
                  },
                ),
                20.height(),
                TextFormFieldAndLabelWidget(
                  controller: linkController,
                  label: 'link',
                  hintText: 'http:\\www.Example.com',
                  textInputType: TextInputType.name,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the link';
                    }
                    link.link = linkController.text;
                    return null;
                  },
                ),
                41.height(),
                SizedBox(
                  width: 138.w,
                  height: 50.h,
                  child: ElevatedButtonWidget(
                    text: 'SAVE',
                    textColor: const Color(0xff784E00),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<LinkUpdateBloc>(context).add(EditLinkUpdateEvent(
                          context: context,
                          link: link,
                        ));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
