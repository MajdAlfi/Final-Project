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
    print(selectedLanguage);
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

  String tDone() {
    if (selectedLanguage == "Arabic") {
      return "تم";
    } else if (selectedLanguage == "Kurdish") {
      return "تەواو";
    } else
      return "Done";
  }

  String tCancel() {
    if (selectedLanguage == "Arabic") {
      return "إلغاء";
    } else if (selectedLanguage == "Kurdish") {
      return "ڕەتکردن";
    } else
      return "Cancel";
  }

  String tNotLogIn() {
    if (selectedLanguage == "Arabic") {
      return "أنت غير مسجل دخول، هل تريد تسجيل الدخول لحفظ تقدمك؟";
    } else if (selectedLanguage == "Kurdish") {
      return "تۆ نەچوویتە ژوورەوە، دەتەوێت بچیتە ژوورەوە بۆ ئەوەی پێشکەوتنەکانت پاشەکەوت بکەیت؟";
    } else
      return "Your currently not logged in do you want to login to store your progress?";
  }

  String tSkip() {
    if (selectedLanguage == "Arabic") {
      return "يتخطى";
    } else if (selectedLanguage == "Kurdish") {
      return "بازدان";
    } else
      return "Skip";
  }

  String tLogin() {
    if (selectedLanguage == "Arabic") {
      return "تسجيل الدخول";
    } else if (selectedLanguage == "Kurdish") {
      return "چونه‌ ژووره‌وه‌";
    } else
      return "Login";
  }

  String tAddProject() {
    if (selectedLanguage == "Arabic") {
      return "أضف المشروع";
    } else if (selectedLanguage == "Kurdish") {
      return "زیادکردنی پڕۆژە";
    } else
      return "Add Project";
  }

  String tAddAction() {
    if (selectedLanguage == "Arabic") {
      return "أضف العمل";
    } else if (selectedLanguage == "Kurdish") {
      return "زیادکردنی کردار";
    } else
      return "Add Action";
  }

  String tSorry() {
    if (selectedLanguage == "Arabic") {
      return "عذرا ، تحتاج إلى تسجيل الدخول لتحميل مشروع";
    } else if (selectedLanguage == "Kurdish") {
      return "ببورە، پێویستە بچیتە ژوورەوە بۆ بارکردنی پڕۆژەیەک";
    } else
      return "Sorry, you need to log in to upload a project";
  }

  String tPleaseFill() {
    if (selectedLanguage == "Arabic") {
      return "يرجى ملء البيانات المطلوبة";
    } else if (selectedLanguage == "Kurdish") {
      return "تکایە داتای پێویست پڕبکەرەوە";
    } else
      return "Please fill in the required Data";
  }

  String tEmail() {
    if (selectedLanguage == "Arabic") {
      return "بريد إلكتروني";
    } else if (selectedLanguage == "Kurdish") {
      return "ئیمەیڵ";
    } else
      return "Email";
  }

  String tPassword() {
    if (selectedLanguage == "Arabic") {
      return "كلمة المرور";
    } else if (selectedLanguage == "Kurdish") {
      return "پاسۆرد";
    } else
      return "Password";
  }

  String tCreateAccount() {
    if (selectedLanguage == "Arabic") {
      return "إنشاء حساب";
    } else if (selectedLanguage == "Kurdish") {
      return "دروستکردنی ئەکاونت";
    } else
      return "Create Account";
  }

  String tNext() {
    if (selectedLanguage == "Arabic") {
      return "التالي";
    } else if (selectedLanguage == "Kurdish") {
      return "دواتر";
    } else
      return "Next";
  }

  String tFinish() {
    if (selectedLanguage == "Arabic") {
      return "انتهى";
    } else if (selectedLanguage == "Kurdish") {
      return "ته واو";
    } else
      return "Finish";
  }

  String tYourProject() {
    if (selectedLanguage == "Arabic") {
      return "مشاريعك";
    } else if (selectedLanguage == "Kurdish") {
      return "پرۆژەکانت";
    } else
      return "Your Project";
  }

  String tConfirmPassword() {
    if (selectedLanguage == "Arabic") {
      return "تأكيد كلمة المرور";
    } else if (selectedLanguage == "Kurdish") {
      return "ووشەی نھێنی  دووبارە بكەوە";
    } else
      return "COnfirm Password";
  }

  String tName() {
    if (selectedLanguage == "Arabic") {
      return "اسم";
    } else if (selectedLanguage == "Kurdish") {
      return "ناو";
    } else
      return "Name";
  }

  String tNotMatchPassword() {
    if (selectedLanguage == "Arabic") {
      return "يبدو أن تأكيد كلمة المرور الخاص بك غير مطابق. حاول مرة اخرى";
    } else if (selectedLanguage == "Kurdish") {
      return "وا دیارە پشتڕاستکردنەوەی وشەی نهێنی تۆ یەک ناگرێتەوە. تكایە دوبارە هەوڵ بدەوە";
    } else
      return "It looks like your password confirmation doesn't match. Please try again";
  }

  String tSignUp() {
    if (selectedLanguage == "Arabic") {
      return "تسجيل";
    } else if (selectedLanguage == "Kurdish") {
      return "تۆمارکردن";
    } else
      return "Sign Up";
  }

  String tAlready() {
    if (selectedLanguage == "Arabic") {
      return "لديك حساب بالفعل؟";
    } else if (selectedLanguage == "Kurdish") {
      return "پێشتر ئەکاونتت هەیە؟";
    } else
      return "Already have an Account?";
  }

  String tYouDidntSupport() {
    if (selectedLanguage == "Arabic") {
      return "أنت لم تدعم أي مشاريع";
    } else if (selectedLanguage == "Kurdish") {
      return "تۆ پشتگیری هیچ پڕۆژەیەکت نەکرد";
    } else
      return "You didnt support any projects";
  }

  String tYouDontHaveAnyProject() {
    if (selectedLanguage == "Arabic") {
      return "ليس لديك أي مشاريع";
    } else if (selectedLanguage == "Kurdish") {
      return "تۆ هیچ پڕۆژەیەکت نییە";
    } else
      return "You dont have any projects";
  }

  String tChoosePicture() {
    if (selectedLanguage == "Arabic") {
      return "الرجاء اختيار صورة لمشروعك";
    } else if (selectedLanguage == "Kurdish") {
      return "تکایە وێنەیەک بۆ پڕۆژەکەت هەڵبژێرە";
    } else
      return "please choose aa picture for your project";
  }

  String tTitle() {
    if (selectedLanguage == "Arabic") {
      return "عنوان";
    } else if (selectedLanguage == "Kurdish") {
      return "ناونیشان";
    } else
      return "Title";
  }

  String tSelectDate() {
    if (selectedLanguage == "Arabic") {
      return "حدد تاريخ";
    } else if (selectedLanguage == "Kurdish") {
      return "بەروار هەڵبژێرە";
    } else
      return "Select Date";
  }

  String tLocation() {
    if (selectedLanguage == "Arabic") {
      return "موقع";
    } else if (selectedLanguage == "Kurdish") {
      return "شوێن";
    } else
      return "Location";
  }

  String tPost() {
    if (selectedLanguage == "Arabic") {
      return "نشر";
    } else if (selectedLanguage == "Kurdish") {
      return "پۆستکردن";
    } else
      return "Post";
  }

  String tGallery() {
    if (selectedLanguage == "Arabic") {
      return "من معرض الصور";
    } else if (selectedLanguage == "Kurdish") {
      return "لە گەلەرییەوە";
    } else
      return "From Gallery";
  }

  String tSupport() {
    if (selectedLanguage == "Arabic") {
      return "دعم";
    } else if (selectedLanguage == "Kurdish") {
      return "پشتگیری";
    } else
      return "Support";
  }

  String tNote() {
    if (selectedLanguage == "Arabic") {
      return "هل أنت متأكد أنك تريد دعم قضية هذا المشروع؟ ملاحظة. سوف تكسب ١٠ نقاط من خلال دعم المشاريع";
    } else if (selectedLanguage == "Kurdish") {
      return "ئایا دڵنیای کە دەتەوێت پشتگیری لە دۆزی ئەم پڕۆژەیە بکەیت؟ زبور. بە پشتگیریکردنی پڕۆژەکان ١٠ خاڵ بەدەست دەهێنیت";
    } else
      return "Are you sure you want to support the cause of this Project? Ps. you will gain 10 Points by Supporting Projects";
  }

  String tSettings() {
    if (selectedLanguage == "Arabic") {
      return "إعدادات";
    } else if (selectedLanguage == "Kurdish") {
      return "ڕێکخستن";
    } else
      return "Settings";
  }

  String tEditProfile() {
    if (selectedLanguage == "Arabic") {
      return "تعديل الملف الشخصي";
    } else if (selectedLanguage == "Kurdish") {
      return "دەستکاریکردنی پرۆفایل";
    } else
      return "Edit Profile";
  }

  String tAbout() {
    if (selectedLanguage == "Arabic") {
      return "حول التطبيق";
    } else if (selectedLanguage == "Kurdish") {
      return "سەبارەت بە ئەپڵیکەیشنەکە";
    } else
      return "About Application";
  }

  String tSelectLanguage() {
    if (selectedLanguage == "Arabic") {
      return "اختار اللغة";
    } else if (selectedLanguage == "Kurdish") {
      return "زمان هەڵبژێرە";
    } else
      return "Select Language";
  }

  String tSignOut() {
    if (selectedLanguage == "Arabic") {
      return "خروج";
    } else if (selectedLanguage == "Kurdish") {
      return "دەرچوون";
    } else
      return "Sign Out";
  }

  String tEditYourData() {
    if (selectedLanguage == "Arabic") {
      return "قم بتعديل بياناتك";
    } else if (selectedLanguage == "Kurdish") {
      return "دەستکاری داتاکانی خۆت بکە";
    } else
      return "Edit Your Data";
  }

  String tNewName() {
    if (selectedLanguage == "Arabic") {
      return "اسم جديد";
    } else if (selectedLanguage == "Kurdish") {
      return "ناوی نوێ";
    } else
      return "New Name";
  }

  String tWriteDescription() {
    if (selectedLanguage == "Arabic") {
      return "اكتب الوصف";
    } else if (selectedLanguage == "Kurdish") {
      return "وەسف بنووسە";
    } else
      return "Write Description";
  }

  String tSetGoal() {
    if (selectedLanguage == "Arabic") {
      return "حدد الهدف";
    } else if (selectedLanguage == "Kurdish") {
      return "ئامانج دابنێ";
    } else
      return "Set Goal";
  }

  String tEdit() {
    if (selectedLanguage == "Arabic") {
      return "تعديل";
    } else if (selectedLanguage == "Kurdish") {
      return "دەستکاریکردن";
    } else
      return "Edit";
  }

  String tLoginToUseFeature() {
    if (selectedLanguage == "Arabic") {
      return "يجب عليك تسجيل الدخول أولاً لاستخدام هذه الميزة";
    } else if (selectedLanguage == "Kurdish") {
      return "بۆ بەکارهێنانی ئەم تایبەتمەندییە دەبێت سەرەتا بچیتە ژوورەوە";
    } else
      return "You have to login first to use this feature";
  }

  String tAskLogin() {
    if (selectedLanguage == "Arabic") {
      return "قم بتسجيل الدخول للوصول إلى الميزات والمحتوى المخصص";
    } else if (selectedLanguage == "Kurdish") {
      return "چوونەژوورەوە بۆ دەستگەیشتن بە تایبەتمەندی و ناوەڕۆکی کەسی";
    } else
      return "Sign in to access personalized features and content";
  }
}
