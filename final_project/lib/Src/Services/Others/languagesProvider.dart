import 'package:flutter/material.dart';

class languages with ChangeNotifier {
  List<String> lang = [
    'English',
    'Arabic',
    'Kurdish',
  ];
  String selectedLanguage = 'English';
  void changeLanguage(newLang) {
    selectedLanguage = newLang;
    notifyListeners();
  }

  String tGoal() {
    if (selectedLanguage == "Arabic") {
      return "هدف";
    } else if (selectedLanguage == "Kurdish") {
      return "ئامێر";
    } else
      return "Goal";
  }

  String tTotalPoint() {
    if (selectedLanguage == "Arabic") {
      return "النقاط الإجمالية";
    } else if (selectedLanguage == "Kurdish") {
      return "نمرەی گشتی";
    } else
      return "Total Points";
  }

  String tActionCompleted() {
    if (selectedLanguage == "Arabic") {
      return "اكتمل المهمة";
    } else if (selectedLanguage == "Kurdish") {
      return "کاری تەواو بوو";
    } else
      return "Action Completed";
  }

  String tSupportedProject() {
    if (selectedLanguage == "Arabic") {
      return "المشروع المدعوم";
    } else if (selectedLanguage == "Kurdish") {
      return "پرۆژەی پشتگیرکراو";
    } else
      return "Supported Project";
  }

  String tPlease() {
    if (selectedLanguage == "Arabic") {
      return "يرجى الحصول على النقاط لإظهار التحليل";
    } else if (selectedLanguage == "Kurdish") {
      return "تکایە نمرە جیاکراوی پێبکە بۆ نیشاندانی دەسنیشان";
    } else
      return "Please gain points to show analysis";
  }

  String tRank() {
    if (selectedLanguage == "Arabic") {
      return "المرتبة";
    } else if (selectedLanguage == "Kurdish") {
      return "پلە";
    } else
      return "Rank";
  }

  String tProjects() {
    if (selectedLanguage == "Arabic") {
      return "مشاريع";
    } else if (selectedLanguage == "Kurdish") {
      return "پرۆژەکان";
    } else
      return "Projects";
  }

  String tNatureFacts() {
    if (selectedLanguage == "Arabic") {
      return "حقائق طبيعية";
    } else if (selectedLanguage == "Kurdish") {
      return "زانیارییەکانی سروشت";
    } else
      return "Nature Facts";
  }

  String tTopProjects() {
    if (selectedLanguage == "Arabic") {
      return "أفضل المشاريع";
    } else if (selectedLanguage == "Kurdish") {
      return "باشترین پرۆژەکان ";
    } else
      return "Top Projects";
  }

  String tOverView() {
    if (selectedLanguage == "Arabic") {
      return "ملخص";
    } else if (selectedLanguage == "Kurdish") {
      return "کورتکراو";
    } else
      return "Overview";
  }

  String tSupportProject() {
    if (selectedLanguage == "Arabic") {
      return "دعم المشروع";
    } else if (selectedLanguage == "Kurdish") {
      return "پشتگیریکردن";
    } else
      return "Support Project";
  }

  String tSupportedAlready() {
    if (selectedLanguage == "Arabic") {
      return "تم دعمها بالفعل";
    } else if (selectedLanguage == "Kurdish") {
      return "پاڵپشتی پێشتر کراوە";
    } else
      return "Supported Already";
  }

  String tReducePaper() {
    if (selectedLanguage == "Arabic") {
      return "تقليل إهدار الورق";
    } else if (selectedLanguage == "Kurdish") {
      return "کەمکردنی پەڕە";
    } else
      return "Reduce Paper Wastage";
  }

  String tAvoidDisposable() {
    if (selectedLanguage == "Arabic") {
      return "تجنب استخدام زجاجات المياه والأكواب القابلة للتصرف";
    } else if (selectedLanguage == "Kurdish") {
      return "بەکارهێنانی بووتە و پەیالەی یەکبارە بەجێ دەبینی";
    } else
      return "Avoid Using Disposable Water Bottles and Cups";
  }

  String tTurnOffLights() {
    if (selectedLanguage == "Arabic") {
      return "إطفاء الأنوار";
    } else if (selectedLanguage == "Kurdish") {
      return "کوژاندنەوەی گلۆبەکان";
    } else
      return "Turn Off Lights";
  }

  String tUseEnergySaving() {
    if (selectedLanguage == "Arabic") {
      return "استخدم لمبات ذات توفير للطاقة";
    } else if (selectedLanguage == "Kurdish") {
      return "لامپەی پارەدانی هێزی بەکاربهێنە";
    } else
      return "Use Energy-Saving Lightbulbs";
  }

  String tKeepACompostBin() {
    if (selectedLanguage == "Arabic") {
      return "احتفظ بصندوق التسميد";
    } else if (selectedLanguage == "Kurdish") {
      return "تەندروستی چەپکە تیا بکە";
    } else
      return "Keep a Compost Bin";
  }

  String tCarpool() {
    if (selectedLanguage == "Arabic") {
      return "التنقل المشترك بالسيارة";
    } else if (selectedLanguage == "Kurdish") {
      return "ئاوانی هاوشێوەیی لەگەڵ ڕێگە پێدان";
    } else
      return "Carpool";
  }

  String tSwapBaths() {
    if (selectedLanguage == "Arabic") {
      return "استبدال الحمامات بالدش";
    } else if (selectedLanguage == "Kurdish") {
      return "گۆڕانکاری ڕووی یان مانگاکە بۆ دوش";
    } else
      return "Swap Baths for Showers";
  }

  String tShop() {
    if (selectedLanguage == "Arabic") {
      return "تسوق باستخدام أكياس تسوق قابلة لإعادة الاستخدام";
    } else if (selectedLanguage == "Kurdish") {
      return "کرینی باکسەی خریدی کە دووبارە بەکاربەرەن";
    } else
      return "Shop with Re-Usable Shopping Bags";
  }

  String tUseCloth() {
    if (selectedLanguage == "Arabic") {
      return "استخدم مناديل القماش بدلاً من المناديل الورقية";
    } else if (selectedLanguage == "Kurdish") {
      return "کرینی باکسەی خریدی کە دووبارە بەکاربەرەن";
    } else
      return "Use Cloth Napkins Instead of Paper Ones";
  }

  String tRepurpose() {
    if (selectedLanguage == "Arabic") {
      return "عادة استخدام وإعادة تدوير";
    } else if (selectedLanguage == "Kurdish") {
      return "دوبارە کاربەرەوە و بازیافت بکە";
    } else
      return "Repurpose and Recycle";
  }

  String tPoint() {
    if (selectedLanguage == "Arabic") {
      return "نقطة";
    } else if (selectedLanguage == "Kurdish") {
      return "نمرە";
    } else
      return "Points";
  }
}
