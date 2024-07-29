import 'package:user_management/common/widgets/custom_form_field.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/ui/group/add_or_edit_group/cubit/add_or_edit_group_cubit.dart';
import 'package:user_management/src/ui/group/cubit/group_cubit.dart';
import 'package:user_management/utils/validators.dart';
import 'package:uuid/uuid.dart';

class AddOrEditGroupDialog extends HookWidget {
  const AddOrEditGroupDialog({
    super.key,
    this.editedGroup,
  });

  final GroupModel? editedGroup;

  @override
  Widget build(BuildContext context) {
    final globalKey = useMemoized(
      GlobalKey<FormState>.new,
    );
    final decryptionsController = useTextEditingController()
      ..text = editedGroup?.description ?? '';
    final nameController = useTextEditingController()
      ..text = editedGroup?.name ?? '';

    return AlertDialog(
      title: Text(context.l10n.addGroup),
      content: Form(
        key: globalKey,
        child: BlocConsumer<AddOrEditGroupCubit, AddOrEditGroupState>(
          listener: (_, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.l10n(context)),
                  ),
                );
              },
              success: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.l10n.groups),
                  ),
                );
                context.read<GroupCubit>().fetchGroups().then(
                      (_) => context.pop(),
                    );
              },
            );
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFormField(
                  label: context.l10n.groupName,
                  controller: nameController,
                  validator: (query) => Validators.standard(query, context),
                ),
                gapH16,
                CustomFormField(
                  maxLine: 5,
                  minLine: 4,
                  label: context.l10n.description,
                  controller: decryptionsController,
                  validator: (query) => Validators.none(query, context),
                ),
              ],
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(context.l10n.cancel),
        ),
        BlocBuilder<AddOrEditGroupCubit, AddOrEditGroupState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const CircularProgressIndicator(),
              orElse: () => TextButton(
                onPressed: () async {
                  final newOrEditedGroup = GroupModel(
                    uid: editedGroup?.uid ?? const Uuid().v4(),
                    name: nameController.text,
                    description: decryptionsController.text,
                    createdAt: DateTime.now(),
                  );
                  if (editedGroup != null) {
                    await context.read<AddOrEditGroupCubit>().editGroup(
                          groupUsers: newOrEditedGroup,
                        );
                    return;
                  }
                  await context.read<AddOrEditGroupCubit>().addGroup(
                        groupUsers: newOrEditedGroup,
                      );
                },
                child: Text(context.l10n.add),
              ),
            );
          },
        ),
      ],
    );
  }
}
