import 'dart:ui';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/cubit/add_edit_cubit.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/widgets/address_section.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/widgets/post_code_section.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/widgets/user_section.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/widgets/user_title.dart';
import 'package:user_management/src/ui/users/cubit/users_cubit.dart';
import 'package:uuid/uuid.dart';

class AddOrUpdateUserDialog extends HookWidget {
  const AddOrUpdateUserDialog({
    super.key,
    this.editedUser,
  });

  ///This variable[editedUser] if null then we created user
  ///else we edited  existing user

  final UserModel? editedUser;
  @override
  Widget build(BuildContext context) {
    //controllers
    final nameController = useTextEditingController(
      text: editedUser?.name,
    );
    final surnameController = useTextEditingController(
      text: editedUser?.surName,
    );
    final cityController = useTextEditingController(
      text: editedUser?.city,
    );
    final streetController = useTextEditingController(
      text: editedUser?.street,
    );
    final postalCodeController = useTextEditingController(
      text: editedUser?.postalCode,
    );
    final houseNumberController = useTextEditingController(
      text: editedUser?.houseNumber,
    );
    final flatNumberController = useTextEditingController(
      text: editedUser?.flatNumber,
    );
    //form key
    final formKey = useMemoized(GlobalKey<FormState>.new);

    //size
    final size = MediaQuery.sizeOf(context);

    // send form(on Tap)
    void sendForm() {
      if (formKey.currentState!.validate()) {
        final newOrUpdatedUser = UserModel(
          uid: editedUser?.uid ?? const Uuid().v4(),
          name: nameController.text,
          surName: surnameController.text,
          city: cityController.text,
          street: streetController.text,
          houseNumber: houseNumberController.text,
          postalCode: postalCodeController.text,
          createdAt: DateTime.now(),
          flatNumber: flatNumberController.text,
        );
        if (editedUser != null) {
          context.read<AddEditCubit>().editUser(
                editedUser: newOrUpdatedUser,
              );
        } else {
          context.read<AddEditCubit>().addUser(newUser: newOrUpdatedUser);
        }
      }
    }

    return Material(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Center(
          child: Container(
            width: size.width * 0.8,
            height: size.height * 0.8,
            decoration: Ui.boxDecoration(context),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const UserTitle(),
                  gapH48,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
                    child: UserSection(
                      nameController: nameController,
                      surnameController: surnameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
                    child: PostCodeSection(
                      cityController: cityController,
                      streetController: streetController,
                      postalCodeController: postalCodeController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
                    child: AddressSection(
                      postalCodeController: postalCodeController,
                      cityController: cityController,
                      streetController: streetController,
                      houseNumberController: houseNumberController,
                      flatNumberController: flatNumberController,
                    ),
                  ),
                  gapH24,
                  sendButtonLogicWidget(sendForm),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BlocConsumer<AddEditCubit, AddEditState> sendButtonLogicWidget(
    void Function() sendForm,
  ) {
    return BlocConsumer<AddEditCubit, AddEditState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            _showScaffoldMsg(
              context,
              text: editedUser == null
                  ? context.l10n.userAdded
                  : context.l10n.userEdited,
            );
            context.read<UsersCubit>().fetchUsers().then(
                  (_) => context.pop(),
                );
          },
          error: (err) {
            _showScaffoldMsg(context, text: err.l10n(context));
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => FilledButton.icon(
            onPressed: sendForm,
            label: Text(
              editedUser == null ? context.l10n.addUser : context.l10n.userDit,
            ),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (err) => Column(
            children: [
              Text(
                err.l10n(context),
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.error,
                ),
              ),
              gapH24,
              FilledButton.icon(
                onPressed: sendForm,
                label: Text(
                  editedUser == null
                      ? context.l10n.addUser
                      : context.l10n.userDit,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void _showScaffoldMsg(BuildContext context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
      ),
    ),
  );
}
