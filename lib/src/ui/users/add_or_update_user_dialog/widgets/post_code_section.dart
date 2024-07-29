import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:user_management/common/widgets/custom_form_field.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/postal_code_model.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/cubit/postal_code_cubit.dart';
import 'package:user_management/utils/validators.dart';

class PostCodeSection extends StatefulWidget {
  const PostCodeSection({
    required this.postalCodeController,
    required this.streetController,
    required this.cityController,
    super.key,
  });

  final TextEditingController postalCodeController;
  final TextEditingController streetController;
  final TextEditingController cityController;

  @override
  State<PostCodeSection> createState() => _PostCodeSectionState();
}

class _PostCodeSectionState extends State<PostCodeSection> {
  @override
  void initState() {
    super.initState();
    widget.postalCodeController.addListener(_onPostalCodeChanged);
  }

  void _onPostalCodeChanged() {
    context
        .read<PostalCodeCubit>()
        .getPostalCode(widget.postalCodeController.text);
  }

  @override
  void dispose() {
    widget.postalCodeController.removeListener(_onPostalCodeChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildPostalCodeField(context),
            gapW12,
            _buildPostalCodeDropdown(context),
            const Spacer(flex: 2),
          ],
        ),
      ],
    );
  }

  Widget _buildPostalCodeField(BuildContext context) {
    return Expanded(
      child: CustomFormField(
        textInputType: TextInputType.number,
        validator: (query) => Validators.postalCode(query, context),
        label: context.l10n.postCode,
        inputFormatters: [
          MaskedInputFormatter('##-###'),
        ],
        controller: widget.postalCodeController,
      ),
    );
  }

  Widget _buildPostalCodeDropdown(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<PostalCodeCubit, PostalCodeState>(
        builder: (context, state) {
          return state.when(
            noToManyAttempts: () => Text(
              context.l10n.toManyAttempts,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
            initial: () => _buildInitialText(context),
            error: _buildErrorText,
            loading: _buildLoadingIndicator,
            success: (postalCode) => _buildDropdown(postalCode, context),
          );
        },
      ),
    );
  }

  Widget _buildInitialText(BuildContext context) {
    return Text(context.l10n.pleaseFillPost);
  }

  Widget _buildErrorText() {
    return const Text('Niestety nie udało się znaleźć dopasowania');
  }

  Widget _buildLoadingIndicator() {
    return const CircularProgressIndicator.adaptive();
  }

  Widget _buildDropdown(
    List<PostalCodeModel> postalCode,
    BuildContext context,
  ) {
    return DropdownButtonFormField<PostalCodeModel>(
      padding: const EdgeInsets.only(bottom: 25),
      style: context.textTheme.bodySmall?.copyWith(
        color: context.colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 45),
        border: OutlineInputBorder(
          borderRadius: Ui.borderRadiusSmall,
        ),
        hintText: 'Wybierz z listy',
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        size: Sizes.p16,
      ),
      items: _buildDropdownItems(postalCode, context),
      onChanged: (value) {
        widget.cityController.text = value!.miejscowosc;
        if (value.ulica != null) {
          widget.streetController.text = value.ulica!;
        }
      },
      selectedItemBuilder: (context) {
        return postalCode.map((suggest) {
          return Text(
            ' ${suggest.miejscowosc} ${suggest.wojewodztwo}',
            overflow: TextOverflow.ellipsis,
          );
        }).toList();
      },
    );
  }

  List<DropdownMenuItem<PostalCodeModel>> _buildDropdownItems(
    List<PostalCodeModel> postalCode,
    BuildContext context,
  ) {
    return postalCode.map((suggest) {
      return DropdownMenuItem(
        value: suggest,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: RichText(
            text: TextSpan(
              children: [
                _buildRichTextSpan('${context.l10n.city}: ', context, true),
                _buildRichTextSpan('${suggest.miejscowosc}\n', context, false),
                _buildRichTextSpan('${context.l10n.state}: ', context, true),
                _buildRichTextSpan('${suggest.wojewodztwo}\n', context, false),
                if (suggest.ulica != null && suggest.ulica!.isNotEmpty) ...[
                  _buildRichTextSpan('${context.l10n.street} ', context, true),
                  _buildRichTextSpan('${suggest.ulica}\n', context, false),
                ],
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  TextSpan _buildRichTextSpan(String text, BuildContext context, bool isBold) {
    return TextSpan(
      text: text,
      style: context.textTheme.bodySmall?.copyWith(
        color: context.colorScheme.onSurface,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
