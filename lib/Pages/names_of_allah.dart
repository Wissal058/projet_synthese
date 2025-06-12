import 'package:flutter/material.dart';

void main() {
  runApp(const NamesOfAllahApp());
}

class NamesOfAllahApp extends StatelessWidget {
  const NamesOfAllahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          elevation: 4,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const NamesOfAllahScreen(),
    );
  }
}

class NamesOfAllahScreen extends StatelessWidget {
  const NamesOfAllahScreen({super.key});

  final List<Map<String, String>> names = const [
    {
      'ar': 'الرَّحْمَنُ',
      'en': 'Ar-Rahman',
      'fr': 'Le Tout Miséricordieux',
      'def_ar': 'الذي وسعت رحمته كل شيء',
      'def_fr': 'Celui dont la miséricorde englobe toute chose',
    },
    {
      'ar': 'الرَّحِيمُ',
      'en': 'Ar-Raheem',
      'fr': 'Le Très Miséricordieux',
      'def_ar': 'الذي ينعم برحمته على المؤمنين',
      'def_fr': 'Celui qui accorde Sa miséricorde aux croyants',
    },
    {
      'ar': 'الْمَلِكُ',
      'en': 'Al-Malik',
      'fr': 'Le Roi',
      'def_ar': 'المالك لكل شيء والمتصرف فيه',
      'def_fr': 'Le Souverain absolu de toute chose',
    },
    {
      'ar': 'الْقُدُّوسُ',
      'en': 'Al-Quddus',
      'fr': 'Le Saint',
      'def_ar': 'المنزه عن كل نقص والمطهر من كل عيب',
      'def_fr': 'Celui qui est exempt de tout défaut et purifié de toute imperfection'
    },
    {
      'ar': 'السَّلاَمُ',
      'en': 'As-Salam',
      'fr': 'La Paix',
      'def_ar': 'السالم من النقائص والعيوب والآفات',
      'def_fr': 'Celui qui est exempt de tout défaut et source de paix'
    },
    {
      'ar': 'الْمُؤْمِنُ',
      'en': 'Al-Mu\'min',
      'fr': 'Le Fidèle',
      'def_ar': 'المصدق لرسله بالمعجزات والمؤمن عباده من الظلم',
      'def_fr': 'Celui qui donne la sécurité et protège Ses serviteurs de l\'injustice'
    },
    {
      'ar': 'الْمُهَيْمِنُ',
      'en': 'Al-Muhaymin',
      'fr': 'Le Dominateur',
      'def_ar': 'المسيطر على خلقه والرقيب عليهم والحفيظ لهم',
      'def_fr': 'Celui qui domine Sa création, la surveille et la préserve'
    },
    {
      'ar': 'الْعَزِيزُ',
      'en': 'Al-Azeez',
      'fr': 'Le Puissant',
      'def_ar': 'الغالب الذي لا يُغلب والقوي الذي لا يُقهر',
      'def_fr': 'Le Tout-Puissant qui ne peut être vaincu ni dominé'
    },
    {
      'ar': 'الْجَبَّارُ',
      'en': 'Al-Jabbar',
      'fr': 'Le Contraignant',
      'def_ar': 'الذي يجبر الكسر ويقهر الجبابرة بعظمته وسلطانه',
      'def_fr': 'Celui qui répare ce qui est brisé et soumet les tyrans par Sa grandeur'
    },
    {
      'ar': 'الْمُتَكَبِّرُ',
      'en': 'Al-Mutakabbir',
      'fr': 'Le Superbe',
      'def_ar': 'المتعظم عن صفات المخلوقين والمتعالي عن النقائص',
      'def_fr': 'Celui qui transcende les attributs des créatures et s\'élève au-dessus des imperfections'
    },
    {
      'ar': 'الْخَالِقُ',
      'en': 'Al-Khaaliq',
      'fr': 'Le Créateur',
      'def_ar': 'الذي أوجد الأشياء من العدم وقدرها بحكمته',
      'def_fr': 'Celui qui fait exister les choses du néant et les détermine par Sa sagesse'
    },
    {
      'ar': 'الْبَارِئُ',
      'en': 'Al-Bari',
      'fr': 'Le Créateur Parfait',
      'def_ar': 'الذي خلق الخلق بريئاً من التفاوت والنقص',
      'def_fr': 'Celui qui crée la création exempte de disparité et d\'imperfection'
    },
    {
      'ar': 'الْمُصَوِّرُ',
      'en': 'Al-Musawwir',
      'fr': 'Le Formateur',
      'def_ar': 'الذي صور المخلوقات وشكلها على ما أراد',
      'def_fr': 'Celui qui donne forme aux créatures selon Sa volonté'
    },
    {
      'ar': 'الْغَفَّارُ',
      'en': 'Al-Ghaffar',
      'fr': 'Le Grand Pardonneur',
      'def_ar': 'الذي يغفر الذنوب مهما كثرت ويستر العيوب',
      'def_fr': 'Celui qui pardonne les péchés si nombreux soient-ils et voile les défauts'
    },
    {
      'ar': 'الْقَهَّارُ',
      'en': 'Al-Qahhar',
      'fr': 'Le Dominateur Suprême',
      'def_ar': 'الغالب لكل شيء والقاهر لجميع الخلق بقدرته',
      'def_fr': 'Celui qui domine toute chose et soumet toute la création par Sa puissance'
    },
    {
      'ar': 'الْوَهَّابُ',
      'en': 'Al-Wahhab',
      'fr': 'Le Donateur',
      'def_ar': 'الذي يعطي العطايا الجزيلة بلا مقابل ولا حساب',
      'def_fr': 'Celui qui accorde Ses dons généreux sans contrepartie ni compte'
    },
    {
      'ar': 'الرَّزَّاقُ',
      'en': 'Ar-Razzaq',
      'fr': 'Le Pourvoyeur',
      'def_ar': 'الذي يرزق جميع المخلوقات ويكفل أقواتها',
      'def_fr': 'Celui qui pourvoit à la subsistance de toutes les créatures'
    },
    {
      'ar': 'الْفَتَّاحُ',
      'en': 'Al-Fattah',
      'fr': 'Celui qui Ouvre',
      'def_ar': 'الذي يفتح أبواب الرحمة والرزق والنصر لعباده',
      'def_fr': 'Celui qui ouvre les portes de la miséricorde, de la subsistance et de la victoire'
    },
    {
      'ar': 'اَلْعَلِيْمُ',
      'en': 'Al-Alim',
      'fr': 'L\'Omniscient',
      'def_ar': 'الذي يعلم كل شيء ظاهراً وباطناً',
      'def_fr': 'Celui qui connaît toute chose, apparente et cachée'
    },
    {
      'ar': 'الْقَابِضُ',
      'en': 'Al-Qabid',
      'fr': 'Celui qui Resserre',
      'def_ar': 'الذي يقبض الأرزاق والأرواح والقلوب بحكمته',
      'def_fr': 'Celui qui resserre les subsistances, les âmes et les cœurs par Sa sagesse'
    },
    {
      'ar': 'الْبَاسِطُ',
      'en': 'Al-Basit',
      'fr': 'Celui qui Étend',
      'def_ar': 'الذي يبسط الرزق والرحمة والخير على عباده',
      'def_fr': 'Celui qui étend la subsistance, la miséricorde et le bien sur Ses serviteurs'
    },
    {
      'ar': 'الْخَافِضُ',
      'en': 'Al-Khafid',
      'fr': 'Celui qui Abaisse',
      'def_ar': 'الذي يخفض المتكبرين والظالمين ويضع المتجبرين',
      'def_fr': 'Celui qui abaisse les orgueilleux et les injustes, et humilie les tyrans'
    },
    {
      'ar': 'الرَّافِعُ',
      'en': 'Ar-Rafi',
      'fr': 'Celui qui Élève',
      'def_ar': 'الذي يرفع المؤمنين بالطاعة والإحسان إلى أعلى الدرجات',
      'def_fr': 'Celui qui élève les croyants par l\'obéissance et la bienfaisance aux plus hauts degrés'
    },
    {
      'ar': 'الْمُعِزُّ',
      'en': 'Al-Mu\'izz',
      'fr': 'Celui qui Honore',
      'def_ar': 'الذي يعز من يشاء من عباده ويكرمهم',
      'def_fr': 'Celui qui honore qui Il veut parmi Ses serviteurs et les ennoblit'
    },
    {
      'ar': 'الْمُذِلُّ',
      'en': 'Al-Mudhill',
      'fr': 'Celui qui Avilit',
      'def_ar': 'الذي يذل الكافرين والمعاندين والمتكبرين',
      'def_fr': 'Celui qui avilit les mécréants, les obstinés et les orgueilleux'
    },
    {
      'ar': 'السَّمِيعُ',
      'en': 'As-Sami',
      'fr': 'L\'Audient',
      'def_ar': 'الذي يسمع كل الأصوات ظاهرها وخفيها',
      'def_fr': 'Celui qui entend tous les sons, apparents et cachés'
    },
    {
      'ar': 'الْبَصِيرُ',
      'en': 'Al-Baseer',
      'fr': 'Le Clairvoyant',
      'def_ar': 'الذي يرى كل شيء ظاهراً وباطناً لا تخفى عليه خافية',
      'def_fr': 'Celui qui voit toute chose apparente et cachée, rien ne Lui échappe'
    },
    {
      'ar': 'الْحَكَمُ',
      'en': 'Al-Hakam',
      'fr': 'Le Juge',
      'def_ar': 'الذي يحكم بين الناس بالعدل والحق',
      'def_fr': 'Celui qui juge entre les gens avec justice et vérité'
    },
    {
      'ar': 'الْعَدْلُ',
      'en': 'Al-Adl',
      'fr': 'Le Juste',
      'def_ar': 'الذي لا يظلم أحداً ولا يجور في حكمه',
      'def_fr': 'Celui qui n\'opprime personne et n\'est pas injuste dans Son jugement'
    },
    {
      'ar': 'اللَّطِيفُ',
      'en': 'Al-Lateef',
      'fr': 'Le Bienveillant',
      'def_ar': 'الذي يعلم دقائق الأمور ويوصل الخير لعباده بلطف',
      'def_fr': 'Celui qui connaît les subtilités et fait parvenir le bien à Ses serviteurs avec douceur'
    },
    {
      'ar': 'الْخَبِيرُ',
      'en': 'Al-Khabeer',
      'fr': 'Le Parfaitement Informé',
      'def_ar': 'الذي يعلم بواطن الأمور وخفايا الصدور',
      'def_fr': 'Celui qui connaît l\'intime des choses et les secrets des cœurs'
    },
    {
      'ar': 'الْحَلِيمُ',
      'en': 'Al-Haleem',
      'fr': 'Le Longanime',
      'def_ar': 'الذي لا يعجل بالعقوبة ويمهل العاصين للتوبة',
      'def_fr': 'Celui qui ne Se hâte pas de punir et accorde un délai aux pécheurs pour se repentir'
    },
    {
      'ar': 'الْعَظِيمُ',
      'en': 'Al-Azeem',
      'fr': 'L\'Immense',
      'def_ar': 'الذي له العظمة المطلقة في ذاته وصفاته وأفعاله',
      'def_fr': 'Celui qui possède la grandeur absolue dans Son essence, Ses attributs et Ses actes'
    },
    {
      'ar': 'الْغَفُورُ',
      'en': 'Al-Ghafoor',
      'fr': 'Le Pardonneur',
      'def_ar': 'الذي يغفر الذنوب ويعفو عن السيئات',
      'def_fr': 'Celui qui pardonne les péchés et efface les mauvaises actions'
    },
    {
      'ar': 'الشَّكُورُ',
      'en': 'Ash-Shakoor',
      'fr': 'Le Reconnaissant',
      'def_ar': 'الذي يقبل اليسير من العمل ويجازي عليه الكثير',
      'def_fr': 'Celui qui accepte le peu d\'œuvre et le récompense généreusement'
    },
    {
      'ar': 'الْعَلِيُّ',
      'en': 'Al-Aliyy',
      'fr': 'Le Très-Haut',
      'def_ar': 'المتعالي عن جميع المخلوقات بذاته وقدره',
      'def_fr': 'Celui qui transcende toutes les créatures par Son essence et Sa valeur'
    },
    {
      'ar': 'الْكَبِيرُ',
      'en': 'Al-Kabeer',
      'fr': 'Le Grand',
      'def_ar': 'الذي له الكبرياء والعظمة في كل شيء',
      'def_fr': 'Celui qui possède la majesté et la grandeur en toute chose'
    },
    {
      'ar': 'الْحَفِيظُ',
      'en': 'Al-Hafiz',
      'fr': 'Le Gardien',
      'def_ar': 'الذي يحفظ خلقه ويحوطهم برعايته وعنايته',
      'def_fr': 'Celui qui préserve Sa création et l\'entoure de Sa protection et de Sa sollicitude'
    },
    {
      'ar': 'المُقِيتُ',
      'en': 'Al-Muqeet',
      'fr': 'Le Nourricier',
      'def_ar': 'الذي يطعم خلقه ويرزقهم ويقوت أبدانهم وأرواحهم',
      'def_fr': 'Celui qui nourrit Sa création, la sustente et fortifie les corps et les âmes'
    },
    {
      'ar': 'الْحَسِيبُ',
      'en': 'Al-Haseeb',
      'fr': 'Celui qui Suffit',
      'def_ar': 'الذي يكفي عبده المتوكل عليه ويحاسب الخلق',
      'def_fr': 'Celui qui suffit à Son serviteur qui se confie à Lui et qui rend compte à la création'
    },
    {
      'ar': 'الْجَلِيلُ',
      'en': 'Al-Jaleel',
      'fr': 'Le Majestueux',
      'def_ar': 'الذي له الجلال والعظمة والكبرياء',
      'def_fr': 'Celui qui possède la majesté, la grandeur et la magnificence'
    },
    {
      'ar': 'الْكَرِيمُ',
      'en': 'Al-Kareem',
      'fr': 'Le Généreux',
      'def_ar': 'الذي لا ينفد عطاؤه ولا يبخل على عباده',
      'def_fr': 'Celui dont les dons ne tarissent pas et qui n\'est jamais avare envers Ses serviteurs'
    },
    {
      'ar': 'الرَّقِيبُ',
      'en': 'Ar-Raqeeb',
      'fr': 'Le Surveillant',
      'def_ar': 'الذي يراقب أعمال العباد ولا تخفى عليه خافية',
      'def_fr': 'Celui qui surveille les actes des serviteurs et à qui rien n\'échappe'
    },
    {
      'ar': 'الْمُجِيبُ',
      'en': 'Al-Mujeeb',
      'fr': 'Celui qui Exauce',
      'def_ar': 'الذي يجيب دعوة الداعين ويلبي نداء المضطرين',
      'def_fr': 'Celui qui exauce l\'invocation de ceux qui L\'invoquent et répond à l\'appel des nécessiteux'
    },
    {
      'ar': 'الْوَاسِعُ',
      'en': 'Al-Wasi',
      'fr': 'L\'Ample',
      'def_ar': 'الذي وسع كل شيء رحمة وعلماً وقدرة',
      'def_fr': 'Celui qui englobe toute chose par Sa miséricorde, Sa science et Sa puissance'
    },
    {
      'ar': 'الْحَكِيمُ',
      'en': 'Al-Hakeem',
      'fr': 'Le Sage',
      'def_ar': 'الذي يضع كل شيء في موضعه بحكمة بالغة',
      'def_fr': 'Celui qui place chaque chose à sa place avec une sagesse parfaite'
    },
    {
      'ar': 'الْوَدُودُ',
      'en': 'Al-Wadud',
      'fr': 'Le Bien-Aimant',
      'def_ar': 'الذي يحب عباده الصالحين ويحبونه',
      'def_fr': 'Celui qui aime Ses serviteurs pieux et qui est aimé d\'eux'
    },
    {
      'ar': 'الْمَجِيدُ',
      'en': 'Al-Majeed',
      'fr': 'Le Glorieux',
      'def_ar': 'الذي له المجد الكامل والشرف العظيم',
      'def_fr': 'Celui qui possède la gloire parfaite et l\'honneur suprême'
    },
    {
      'ar': 'الْبَاعِثُ',
      'en': 'Al-Ba\'ith',
      'fr': 'Celui qui Ressuscite',
      'def_ar': 'الذي يبعث الموتى ويحيي الأرض بعد موتها',
      'def_fr': 'Celui qui ressuscite les morts et fait revivre la terre après sa mort'
    },
    {
      'ar': 'الشَّهِيدُ',
      'en': 'Ash-Shaheed',
      'fr': 'Le Témoin',
      'def_ar': 'الذي يشهد على كل شيء ولا يغيب عن علمه شيء',
      'def_fr': 'Celui qui témoigne de toute chose et de qui rien n\'échappe à la connaissance'
    },
    {
      'ar': 'الْحَقُّ',
      'en': 'Al-Haqq',
      'fr': 'La Vérité',
      'def_ar': 'الذي هو الحق المبين والثابت الذي لا يتغير',
      'def_fr': 'Celui qui est la Vérité évidente et constante qui ne change pas'
    },
    {
      'ar': 'الْوَكِيلُ',
      'en': 'Al-Wakeel',
      'fr': 'Le Garant',
      'def_ar': 'الذي يتولى أمور عباده ويكفيهم ما أهمهم',
      'def_fr': 'Celui qui prend en charge les affaires de Ses serviteurs et leur suffit dans leurs préoccupations'
    },
    {
      'ar': 'الْقَوِيُّ',
      'en': 'Al-Qawiyy',
      'fr': 'Le Fort',
      'def_ar': 'الذي له القوة الكاملة التي لا تنفد ولا تضعف',
      'def_fr': 'Celui qui possède la force parfaite qui ne s\'épuise ni ne faiblit'
    },
    {
      'ar': 'الْمَتِينُ',
      'en': 'Al-Mateen',
      'fr': 'Le Ferme',
      'def_ar': 'الذي له القوة الشديدة والثبات الذي لا يتزعزع',
      'def_fr': 'Celui qui possède la force intense et la fermeté inébranlable'
    },
    {
      'ar': 'الْوَلِيُّ',
      'en': 'Al-Waliyy',
      'fr': 'Le Protecteur',
      'def_ar': 'الذي يتولى عباده المؤمنين بالحفظ والنصرة',
      'def_fr': 'Celui qui prend sous Sa protection Ses serviteurs croyants par la sauvegarde et le secours'
    },
    {
      'ar': 'الْحَمِيدُ',
      'en': 'Al-Hameed',
      'fr': 'Le Digne de Louange',
      'def_ar': 'الذي له الحمد الكامل في ذاته وصفاته وأفعاله',
      'def_fr': 'Celui qui mérite la louange parfaite dans Son essence, Ses attributs et Ses actes'
    },
    {
      'ar': 'الْمُحْصِي',
      'en': 'Al-Muhsee',
      'fr': 'Celui qui Dénombre',
      'def_ar': 'الذي أحصى كل شيء عدداً ولا يفوته شيء',
      'def_fr': 'Celui qui dénombre toute chose et à qui rien n\'échappe'
    },
    {
      'ar': 'الْمُبْدِئُ',
      'en': 'Al-Mubdi',
      'fr': 'Celui qui Commence',
      'def_ar': 'الذي بدأ خلق كل شيء وأنشأه من العدم',
      'def_fr': 'Celui qui a commencé la création de toute chose et l\'a créée du néant'
    },
    {
      'ar': 'الْمُعِيدُ',
      'en': 'Al-Mueed',
      'fr': 'Celui qui Refait',
      'def_ar': 'الذي يعيد الخلق بعد فنائهم للبعث والحساب',
      'def_fr': 'Celui qui recrée la création après leur anéantissement pour la résurrection et le jugement'
    },
    {
      'ar': 'الْمُحْيِي',
      'en': 'Al-Muhyi',
      'fr': 'Celui qui Donne la Vie',
      'def_ar': 'الذي يحيي الموتى ويخرج الحي من الميت',
      'def_fr': 'Celui qui donne la vie aux morts et fait sortir le vivant du mort'
    },
    {
      'ar': 'الْمُمِيتُ',
      'en': 'Al-Mumeet',
      'fr': 'Celui qui Donne la Mort',
      'def_ar': 'الذي يميت الأحياء ويخرج الميت من الحي',
      'def_fr': 'Celui qui donne la mort aux vivants et fait sortir le mort du vivant'
    },
    {
      'ar': 'الْحَيُّ',
      'en': 'Al-Hayy',
      'fr': 'Le Vivant',
      'def_ar': 'الذي له الحياة الكاملة الأزلية الأبدية',
      'def_fr': 'Celui qui possède la vie parfaite, éternelle et perpétuelle'
    },
    {
      'ar': 'الْقَيُّومُ',
      'en': 'Al-Qayyoom',
      'fr': 'L\'Subsistant par Soi',
      'def_ar': 'الذي يقوم بنفسه ولا يحتاج إلى غيره ويقوم به كل شيء',
      'def_fr': 'Celui qui subsiste par Lui-même, n\'a besoin de rien et par qui toute chose subsiste'
    },
    {
      'ar': 'الْوَاجِدُ',
      'en': 'Al-Waajid',
      'fr': 'Celui qui Trouve',
      'def_ar': 'الذي لا يعوزه شيء ويجد كل ما يريده',
      'def_fr': 'Celui à qui rien ne manque et qui trouve tout ce qu\'Il veut'
    },
    {
      'ar': 'الْمَاجِدُ',
      'en': 'Al-Maajid',
      'fr': 'Le Noble',
      'def_ar': 'الذي له الشرف والكرم والعطاء الواسع',
      'def_fr': 'Celui qui possède l\'honneur, la générosité et le don immense'
    },
    {
      'ar': 'الْواحِدُ',
      'en': 'Al-Waahid',
      'fr': 'L\'Unique',
      'def_ar': 'الذي لا شريك له في ذاته وصفاته وأفعاله',
      'def_fr': 'Celui qui n\'a pas d\'associé dans Son essence, Ses attributs et Ses actes'
    },
    {
      'ar': 'الأَحَدُ',
      'en': 'Al-Ahad',
      'fr': 'L\'Un',
      'def_ar': 'الذي تفرد بالوحدانية المطلقة ولا يقبل التجزئة',
      'def_fr': 'Celui qui est unique dans l\'unicité absolue et n\'accepte aucune division'
    },
    {
      'ar': 'الصَّمَدُ',
      'en': 'As-Samad',
      'fr': 'Le Soutien Absolu',
      'def_ar': 'السيد الذي يُقصَد في الحوائج كلها',
      'def_fr': 'Le Maître absolu vers qui tout le monde se tourne pour les besoins',
    },
    {
      'ar': 'الْقَادِرُ',
      'en': 'Al-Qaadir',
      'fr': 'Le Tout-Puissant',
      'def_ar': 'الذي لا يعجزه شيء في الأرض ولا في السماء',
      'def_fr': 'Celui qui est capable de tout, sans limite ni faiblesse',
    },
    {
      'ar': 'الْمُقْتَدِرُ',
      'en': 'Al-Muqtadir',
      'fr': 'Le Tout-Determinateur',
      'def_ar': 'الذي يخلق ما يشاء على وجه الإتقان والقدرة',
      'def_fr': 'Celui qui détermine et exécute toute chose avec toute puissance et précision',
    },
    {
      'ar': 'الْمُقَدِّمُ',
      'en': 'Al-Muqaddim',
      'fr': 'Le Précurseur',
      'def_ar': 'الذي يُقدِّم الأشياء قبل وقوعها',
      'def_fr': 'Celui qui avance les choses avant leur occurrence',
    },
    {
      'ar': 'الْمُؤَخِّرُ',
      'en': 'Al-Mu\'akhkhir',
      'fr': 'Le Retardateur',
      'def_ar': 'الذي يؤخر الأشياء بعد وقوعها',
      'def_fr': 'Celui qui retarde les choses après leur occurrence',
    },
    {
      'ar': 'الأوَّلُ',
      'en': 'Al-Awwal',
      'fr': 'Le Premier',
      'def_ar': 'الذي لا يسبقه شيء وهو الباقي بعد فناء كل شيء',
      'def_fr': 'Celui qui ne précède rien et qui subsiste après la disparition de toute chose',
    },
    {
      'ar': 'الآخِرُ',
      'en': 'Al-Akhir',
      'fr': 'Le Dernier',
      'def_ar': 'الذي لا يبقى بعده شيء وهو الأول قبل كل شيء',
      'def_fr': 'Celui qui ne suit rien et qui est premier avant toute chose',
    },
    {
      'ar': 'الظَّاهِرُ',
      'en': 'Az-Zaahir',
      'fr': 'L’Évident',
      'def_ar': 'الذي لا يخفى شيء عليه وهو ظاهر على كل شيء',
      'def_fr': 'Celui dont rien n’est caché, Il est évident sur toute chose',
    },
    {
      'ar': 'الْبَاطِنُ',
      'en': 'Al-Baatin',
      'fr': 'Le Caché',
      'def_ar': 'الذي لا يراه العباد وهو فوق كل شيء',
      'def_fr': 'Celui que les serviteurs ne voient pas et qui est au-dessus de toute chose',
    },
    {
      'ar': 'الْوَالِي',
      'en': 'Al-Waali',
      'fr': 'Le Gouverneur',
      'def_ar': 'الذي يتولى الأمور كلها ويدبرها',
      'def_fr': 'Celui qui gère et administre toutes choses',
    },
    {
      'ar': 'الْمُتَعَالِي',
      'en': 'Al-Muta\'ali',
      'fr': 'Le Très-Haut',
      'def_ar': 'الذي تعالى عن مشابهة خلقه',
      'def_fr': 'Celui qui est au-dessus de toute ressemblance avec Ses créatures',
    },
    {
      'ar': 'الْبَرُّ',
      'en': 'Al-Barr',
      'fr': 'La Source de Toute Bonté',
      'def_ar': 'الذي يحيي العباد بفضله ويرحمهم',
      'def_fr': 'Celui qui vivifie les serviteurs par Sa grâce et leur fait miséricorde',
    },
    {
      'ar': 'التَّوَّابُ',
      'en': 'At-Tawwab',
      'fr': 'L’Accueillant au Repentir',
      'def_ar': 'الذي يتوب على عباده ويغفر ذنوبهم',
      'def_fr': 'Celui qui accepte le repentir de Ses serviteurs et pardonne leurs péchés',
    },
    {
      'ar': 'الْمُنْتَقِمُ',
      'en': 'Al-Muntaqim',
      'fr': 'Le Vengeur',
      'def_ar': 'الذي يعاقب الظالمين',
      'def_fr': 'Celui qui punit les injustes',
    },
    {
      'ar': 'العَفُوُّ',
      'en': 'Al-Afuw',
      'fr': 'Le Pardonneur',
      'def_ar': 'الذي يعفو عن الذنوب ويصفح عنها',
      'def_fr': 'Celui qui pardonne les fautes et efface les péchés',
    },
    {
      'ar': 'الرَّؤُوفُ',
      'en': "Ar-Ra'oof",
      'fr': 'Le Très Compatissant',
      'def_ar': 'الذي يرحم عباده برحمة عظيمة',
      'def_fr': 'Celui qui fait preuve d’une immense miséricorde envers Ses serviteurs',
    },
    {
      'ar': 'مَالِكُ الْمُلْكِ',
      'en': 'Malik-ul-Mulk',
      'fr': 'Le Souverain de la Royauté',
      'def_ar': 'المالك لكل شيء في الملكوت',
      'def_fr': 'Le propriétaire absolu de tout dans la royauté',
    },
    {
      'ar': 'ذُو الْجَلَالِ وَالْإِكْرَامِ',
      'en': 'Dhu-l-Jalali wa-l-Ikram',
      'fr': 'Le Possesseur de la Majesté et de la Générosité',
      'def_ar': 'الذي يجمع بين الجلال والعظمة والكرم والعطاء',
      'def_fr': 'Celui qui réunit majesté, grandeur, générosité et bienfaisance',
    },
    {
      'ar': 'الْمُقْسِطُ',
      'en': 'Al-Muqsit',
      'fr': 'L’Équitable',
      'def_ar': 'الذي يعدل بين خلقه ويعطي كل ذي حق حقه',
      'def_fr': 'Celui qui établit la justice entre Ses créatures et donne à chacun son dû',
    },
    {
      'ar': 'الْجَامِعُ',
      'en': 'Al-Jami',
      'fr': 'Le Rassembleur',
      'def_ar': 'الذي يجمع الخلق ليوم القيامة',
      'def_fr': 'Celui qui rassemble les êtres pour le Jour du Jugement',
    },
    {
      'ar': 'الْغَنِيُّ',
      'en': 'Al-Ghaniyy',
      'fr': 'Le Riche, l’Indépendant',
      'def_ar': 'الذي لا يحتاج إلى أحد وهو الغني بذاته',
      'def_fr': 'Celui qui ne dépend de personne et est riche par Lui-même',
    },
    {
      'ar': 'الْمُغْنِي',
      'en': 'Al-Mughni',
      'fr': 'L’Enrichisseur',
      'def_ar': 'الذي يغني العباد عن غيره',
      'def_fr': 'Celui qui enrichit les serviteurs et les dispense de tout besoin',
    },
    {
      'ar': 'الْمَانِعُ',
      'en': 'Al-Mani',
      'fr': 'Le Défenseur',
      'def_ar': 'الذي يمنع الضرر والبلاء',
      'def_fr': 'Celui qui empêche le mal et le malheur',
    },
    {
      'ar': 'الضَّارُّ',
      'en': 'Ad-Darr',
      'fr': 'Le Nuisible',
      'def_ar': 'الذي يقدر على إلحاق الضرر',
      'def_fr': 'Celui qui a le pouvoir de causer le tort',
    },
    {
      'ar': 'النَّافِعُ',
      'en': 'An-Nafi',
      'fr': 'L’Apporteur de Bien',
      'def_ar': 'الذي ينفع الخلق ويجلب لهم الخير',
      'def_fr': 'Celui qui fait du bien aux créatures et leur apporte le bien',
    },
    {
      'ar': 'النُّورُ',
      'en': 'An-Nur',
      'fr': 'La Lumière',
      'def_ar': 'الذي يضيء الكون بنوره',
      'def_fr': 'Celui qui illumine l’univers par Sa lumière',
    },
    {
      'ar': 'الْهَادِي',
      'en': 'Al-Hadi',
      'fr': 'Le Guide',
      'def_ar': 'الذي يهدي الخلق إلى الطريق الصحيح',
      'def_fr': 'Celui qui guide les créatures vers le droit chemin',
    },
    {
      'ar': 'الْبَدِيعُ',
      'en': 'Al-Badi',
      'fr': 'L’Incomparable Créateur',
      'def_ar': 'الذي خلق الأشياء بلا مثال سابق',
      'def_fr': 'Celui qui a créé les choses sans modèle antérieur',
    },
    {
      'ar': 'الْبَاقِي',
      'en': 'Al-Baqi',
      'fr': 'L’Éternel',
      'def_ar': 'الذي يبقى ولا يفنى',
      'def_fr': 'Celui qui demeure et ne périt jamais',
    },
    {
      'ar': 'الْوَارِثُ',
      'en': 'Al-Warith',
      'fr': 'L’Héritier',
      'def_ar': 'الذي يرث الأرض والسماوات بعد الفناء',
      'def_fr': 'Celui qui hérite la terre et les cieux après leur disparition',
    },
    {
      'ar': 'الرَّشِيدُ',
      'en': 'Ar-Rasheed',
      'fr': 'Le Guide Parfait',
      'def_ar': 'الذي يهدى الخلق إلى الصراط المستقيم',
      'def_fr': 'Celui qui guide les créatures vers le droit chemin parfait',
    },
    {
      'ar': 'الصَّبُورُ',
      'en': 'As-Saboor',
      'fr': 'Le Très Patient',
      'def_ar': 'الذي يصبر على أذى العباد ويدخر لهم الثواب',
      'def_fr': 'Celui qui supporte la douleur causée par Ses serviteurs et leur réserve la récompense',
    },



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Les 99 Noms d\'Allah'),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'أسماء الله الحسنى',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D47A1),
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (final name in names) ...[
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Text(
                                name['ar']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      name['fr']!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      name['def_ar']!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      name['def_fr']!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Fermer'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            name['ar']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            name['en']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      ),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber,
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 20),
                const Text(
                  'Appuyez sur un nom pour voir sa signification',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}