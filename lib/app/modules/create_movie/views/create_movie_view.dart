import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_movie_controller.dart';

class CreateMovieView extends GetView<CreateMovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateMovieView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
              validator: controller.validateTitle,
              textInputAction: TextInputAction.next,
              onChanged: controller.onTitleChanged,
            ),
            TextFormField(
              maxLines: 5,
              minLines: 2,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              validator: controller.validateDescription,
              //textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              onChanged: controller.onDescriptionChanged,
            ),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Rating',
              ),
              validator: controller.validateRating,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onChanged: controller.onRatingChanged,
            ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     hintText: 'Created Date',
            //   ),
            //   onChanged: controller.onCreatedDtChanged,

            // ),
            ListTile(
              onTap: controller.onCreatedDtChanged,
              title: Text('Tarikh'),
              subtitle: Obx(
                () => Text(
                  //controller.tarikh.value.toString(),
                  controller.selectDate,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Image',
              ),
              validator: controller.validateUrl,
              keyboardType: TextInputType.url,
              onChanged: controller.onImageChanged,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: '',
            onPressed: controller.onSubmit,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.onPadam,
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
