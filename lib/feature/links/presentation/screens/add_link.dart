import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/core/widgets/elevation_button_widget.dart';
import 'package:betweener_app/core/widgets/text_form_field_and_label_widget.dart';
import 'package:betweener_app/feature/links/domain/entities/link.dart';
import 'package:betweener_app/feature/links/presentation/bolc/link_update/link_update_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddLink extends StatelessWidget {
  String username;
  AddLink({required this.username, Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    return null;
                  },
                ),
                41.height(),
                BlocBuilder<LinkUpdateBloc, LinkUpdateState>(
                  builder: (context, state) {
                    if (state is LinkUpdateSuccessState) {
                      Future.delayed(
                        const Duration(microseconds: 100),
                        () => Navigator.pop(context),
                      );
                    } else if (state is LinkUpdateLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox(
                      width: 138.w,
                      height: 50.h,
                      child: ElevatedButtonWidget(
                        text: 'SAVE',
                        textColor: const Color(0xff784E00),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LinkUpdateBloc>(context).add(AddLinkUpdateEvent(
                              context: context,
                              link: Link(title: titleController.text, link: linkController.text, username: username, isActive: 1),
                            ));
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
