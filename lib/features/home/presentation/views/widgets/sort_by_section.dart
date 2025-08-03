import 'package:ecommerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce/core/enum/sort_option.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/core/widgets/radio_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortBySection extends StatefulWidget {
  const SortBySection({super.key});

  @override
  _SortBySectionState createState() => _SortBySectionState();
}


class _SortBySectionState extends State<SortBySection> {
  SortOption? _selectedOption = SortOption.priceAsc;

  void _onChanged(SortOption? option) {
    if (option == null) return;
    setState(() {
      _selectedOption = option;
    });
    context.read<ProductsCubit>().sortBy(option);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'ترتيب حسب :',
          textAlign: TextAlign.right,
          style: TextStyles.bold19,
        ),
        const SizedBox(height: 8),
        RadioOptionTile<SortOption>(
          title: 'السعر (الأقل إلى الأعلى)',
          value: SortOption.priceAsc,
          groupValue: _selectedOption,
          onChanged: _onChanged,
        ),
        RadioOptionTile<SortOption>(
          title: 'السعر (الأعلى إلى الأقل)',
          value: SortOption.priceDesc,
          groupValue: _selectedOption,
          onChanged: _onChanged,
        ),
        RadioOptionTile<SortOption>(
          title: 'الأبجدية',
          value: SortOption.alphabetical,
          groupValue: _selectedOption,
          onChanged: _onChanged,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
