import 'package:user_management/common/widgets/custom_form_field.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/utils/validators.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
    required this.postalCodeController,
    required this.cityController,
    required this.streetController,
    required this.houseNumberController,
    required this.flatNumberController,
    super.key,
  });
  final TextEditingController postalCodeController;
  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController houseNumberController;
  final TextEditingController flatNumberController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        gapH12,
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomFormField(
                validator: (query) => Validators.standard(query, context),
                label: context.l10n.city,
                controller: cityController,
              ),
            ),
            gapW16,
            Expanded(
              flex: 2,
              child: CustomFormField(
                validator: (query) => Validators.none(query, context),
                label: context.l10n.street,
                controller: streetController,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
        gapH12,
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomFormField(
                validator: (query) =>
                    Validators.houseNumber(query, context, isRequired: true),
                label: context.l10n.hauseNumber,
                controller: houseNumberController,
              ),
            ),
            gapW16,
            Expanded(
              flex: 2,
              child: CustomFormField(
                validator: (query) => Validators.houseNumber(query, context),
                label: context.l10n.flatNumber,
                controller: flatNumberController,
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
