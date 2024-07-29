import 'package:user_management/common/widgets/custom_form_field.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/utils/validators.dart';

class UserSection extends StatelessWidget {
  const UserSection({
    required this.nameController,
    required this.surnameController,
    super.key,
  });
  final TextEditingController nameController;
  final TextEditingController surnameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomFormField(
                validator: (query) => Validators.name(query, context),
                label: context.l10n.name,
                controller: nameController,
              ),
            ),
            gapW16,
            Expanded(
              flex: 2,
              child: CustomFormField(
                validator: (query) => Validators.name(query, context),
                label: context.l10n.surName,
                controller: surnameController,
              ),
            ),
            const Spacer(flex: 4),
          ],
        ),
        gapH12,
      ],
    );
  }
}
