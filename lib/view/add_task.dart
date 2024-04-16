import 'package:flutter/material.dart';
import 'package:flutter_todo/common/widgets/buttons.dart';
import 'package:flutter_todo/common/widgets/textfields.dart';
import 'package:flutter_todo/common/widgets/texts.dart';
import 'package:flutter_todo/view/cat_selector.dart';
import 'package:flutter_todo/viewmodel/add_task_viewmodel.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final Function updateTasks;

  const AddTaskBottomSheet({super.key, required this.updateTasks});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final AddTaskViewModel _viewModel = AddTaskViewModel();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16),
        child: Form(
          key: _viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              semiBoldText('Task Title', fontSize: 14, align: TextAlign.start),
              const SizedBox(height: 8),
              basicFormField(
                hint: 'Task Title',
                validator: _viewModel.validateRequired,
                onChanged: _viewModel.updateTitle,
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  semiBoldText('Category', fontSize: 14),
                  const SizedBox(width: 24),
                  SizedBox(
                    height: 50,
                    child: CategorySelector(
                      chooseCat: (iconPath) {
                        setState(() {});
                        _viewModel.updateCat(iconPath);
                        print(iconPath);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              fullWidthButton(
                child: boldText('Save', color: Colors.white),
                onPressed: () {
                  /// Create the new Task
                  if (_viewModel.addTask()) {
                    widget.updateTasks(context);
                  }
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
