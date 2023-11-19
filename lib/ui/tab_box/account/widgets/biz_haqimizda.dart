import 'package:flutter/material.dart';

class BizHaqimizda extends StatelessWidget {
  const BizHaqimizda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biz haqimizda'),
      ),
      body: Text('''
Uy tozalash: Uy tozalash xizmatlari, uy va appartamentlarni tozalash, suysoq va sanitariya xizmatlarini o'z ichiga oladi.Ofis va korxona tozalash: Ish joylari uchun maxsus xizmatlar, ofis mebelini tozalash, bosim va kopir mashinalarini tozalash, asbob-uskunalarini tez-tez tozalashni o'z ichiga oladi.Yirik tashkilotlar uchun xizmatlar: Boshqa katta tashkilotlar uchun, masalan, istiqomat markazlari yoki tijorat markazlari, maxsus xizmatlar taklif etiladi. Bu xizmatlar odatda mutaxassislar tomonidan bajariladi.Viloyat hujum hizmatlari: Viloyatlar yoki mahalliy hududlar uchun xizmatlar, hududlararo hujumlar, xususan, mehnat yoki hodisalar bo'yicha tez-tez tibbiy yordamni o'z ichiga oladi.Holat tozalash: Boshqa hizmatlar orqali muvaffaqiyatli bo'lmagan joylarni tozalashni taklif etadi.Bu xizmatlar odatda vakolatli va malakali xodimlar tomonidan amalga oshiriladi. Har bir tozalash ishchi, mahsulotlarni va vositalarni to'g'ri va sodda ko'rish, nazorat qilish va joylarni sifatli va toza saqlash bo'yicha tayyorlangan. Xizmat ko'rsatuvchilar ko'pincha o'zlarining jihozlarini olib keladilar, lekin ba'zi holatlarda mijozlar o'z jihozlarini taqdim etishlari talab qilinadi.
''')
    );
  }
}