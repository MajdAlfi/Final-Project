import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageDropdown extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      elevation: 10,
      value: Provider.of<languages>(context).selectedLanguage,
      onChanged: (newValue) {
        Provider.of<languages>(context, listen: false).changeLanguage(newValue);
      },
      items: Provider.of<languages>(context).lang.map((language) {
        return DropdownMenuItem<String>(
          value: language,
          child: Text(language == "Arabic"
              ? "عربي"
              : language == "Kurdish"
                  ? "کوردی"
                  : "English"),
        );
      }).toList(),
    );
  }
}
