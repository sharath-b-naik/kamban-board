import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';

import '../../../../../core/translations/translations.dart';
import '../../../../../widgets/app_buttons.dart';

Future<bool?> showLanguageChangeDialog(BuildContext context) async {
  String? selectedLang;
  Locale? selectedLocale;

  return showDialog<bool?>(
    context: context,
    barrierColor: Colors.black38,
    builder: (context) {
      return Dialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: StatefulBuilder(builder: (context, stateSetter) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          context.tr(AppLocalizations.language),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => GoRouter.of(context).pop(false),
                        child: const Icon(
                          Icons.cancel,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...[
                    {'locale': const Locale('en', 'US'), 'lang': 'English'},
                    {'locale': const Locale('hi', 'IN'), 'lang': 'Hindi'},
                  ].map(
                    (item) {
                      final lang = item['lang'] as String;
                      final locale = item['locale'] as Locale;

                      return Row(
                        children: [
                          Radio(
                            value: lang,
                            groupValue: selectedLang,
                            onChanged: (value) {
                              selectedLang = lang;
                              selectedLocale = locale;
                              stateSetter(() {});
                            },
                          ),
                          Text(
                            lang,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  AppButton(
                    onTap: () {
                      if (selectedLocale == null) return;
                      context.setLocale(selectedLocale!);
                      context.pop();
                    },
                    isEnable: true,
                    textButton: context.tr(AppLocalizations.update),
                  )
                ],
              );
            }),
          ),
        ),
      );
    },
  );
}
