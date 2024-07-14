import 'dart:core';

class Question {
  String question;
  final List<String> options;
  int answerIndex;
  Question({
    required this.question,
    required this.options,
    required this.answerIndex,
  });
}

final data = [
  Question(
    question:
        "ربنا عمل علينا واجبات وحمول لازم نشيلها.. منها اننا أحيانا بنقتل.. أنا مؤمن أن من يقتل يقتل.. وعارف أني هموت مقتول بس ده هو الثمن اللي لازم ادفعه",
    options: ["الإرهاب والكباب", "أرض الخوف", "احنا بتوع الأتوبيس"],
    answerIndex: 1,
  ),
  Question(
    question: "اقتناعي الشخصي أو عدمه لا يغير من الحقيقة في شيء",
    options: ["الكيف", "اللمبي", "احنا بتوع الأتوبيس"],
    answerIndex: 2,
  ),
  Question(
    question:
        "أنا مش في خدمة الوطن.. أنا في خدمة الباشا سيادة اللوا، وحرم الباشا سيادة اللوا، والعيال البشوات ولاد سيادة اللوا",
    options: ["الإرهاب والكباب", "الكيف", "النمر الأسود"],
    answerIndex: 0,
  ),
  Question(
    question:
        "الحجات بتيجي أول ما بنبطل ندور عليها أو نستناها.. المشكلة بقى هل لما هتيجي هنكون لسه جوانا نفس الشغف؟",
    options: ["الإنس والجن", "النمر الأسود", "طيور الظلام"],
    answerIndex: 1,
  ),
  Question(
    question: "اتسرقنا بكل الأشكال يا حسن!",
    options: ["اللعب مع الكبار", "الحب فوق هضبة الهرم", "طيور الظلام"],
    answerIndex: 0,
  ),
  Question(
    question: "كويس إن أبو الهول والأهرام لسه ما تسرقوش",
    options: ["اللعب مع الكبار", "الحب فوق هضبة الهرم", "طيور الظلام"],
    answerIndex: 0,
  ),
  Question(
    question:
        "لازم كل حاجة في بلدنا تبقى حجارة عشان ما تتسرقش.. حتى الحب والروح الحلوة اتسرقوا يا علي",
    options: ["اللعب مع الكبار", "الحب فوق هضبة الهرم", "طيور الظلام"],
    answerIndex: 0,
  ),
  Question(
    question: "شوفي يا قطة",
    options: ["حافية على جسر الذهب", "تيتو", "سلام يا صاحبي"],
    answerIndex: 0,
  ),
  Question(
    question: "أنا بابا يالا",
    options: ["حافية على جسر الذهب", "تيتو", "سلام يا صاحبي"],
    answerIndex: 1,
  ),
  Question(
    question: "سلام يا صاحبي",
    options: ["تيتو", "سلام يا صاحبي", "حافية على جسر الذهب"],
    answerIndex: 1,
  ),
  Question(
    question: "أنا عملت كل حاجة غلط ممكن تتخيلها",
    options: ["عبود ع الحدود", "تيتو", "الناظر"],
    answerIndex: 1,
  ),
  Question(
    question: "عايز تحتفل بالالتصاق يا صايع يا ملتصق",
    options: ["تيتو", "عبود ع الحدود", "سلام يا صاحبي"],
    answerIndex: 1,
  ),
  Question(
    question: "جبت الترنك معاك",
    options: ["عبود ع الحدود", "الناظر", "تيتو"],
    answerIndex: 1,
  ),
  Question(
    question: "يا عزيزي كلنا لصوص",
    options: ["الناظر", "يا عزيزي كلنا لصوص", "عبود ع الحدود"],
    answerIndex: 1,
  ),
  Question(
    question: "الله يرحمها أم مختار كانت غالية علينا أوي",
    options: ["يا عزيزي كلنا لصوص", "اللمبي", "عبود ع الحدود"],
    answerIndex: 1,
  ),
  Question(
    question: "أيوه، قولي حاجة من اللي ربنا كتبها علينا",
    options: ["اللمبي", "صعيدي في الجامعة الأمريكية", "يا عزيزي كلنا لصوص"],
    answerIndex: 1,
  ),
  Question(
    question: "أحلى من الشرف مفيش",
    options: ["صعيدي في الجامعة الأمريكية", "أحبك يا حسن", "اللمبي"],
    answerIndex: 1,
  ),
  Question(
    question: "هاروح اتحزم وأجيلك",
    options: ["أحبك يا حسن", "سيدة القصر", "اللمبي"],
    answerIndex: 1,
  ),
  Question(
    question: "ادي كل واحد مربع واداني أربع مربعات",
    options: ["سيدة القصر", "عبود ع الحدود", "أحبك يا حسن"],
    answerIndex: 1,
  ),
  Question(
    question: "أقولك فين ولا تزعلش",
    options: ["عبود ع الحدود", "أخطر رجل في العالم", "سيدة القصر"],
    answerIndex: 1,
  ),
  Question(
    question: "اوعي يغرك جسمك",
    options: ["أخطر رجل في العالم", "الناظر", "عبود ع الحدود"],
    answerIndex: 1,
  ),
  Question(
    question: "هنرقص دانس يا روح أمك",
    options: ["الناظر", "الفرن", "أخطر رجل في العالم"],
    answerIndex: 1,
  ),
  Question(
    question: "انت مش ابني، انت لقيط",
    options: ["طير إنت", "الخطايا", "الناظر"],
    answerIndex: 1,
  ),
  Question(
    question: "أنا قلت كلمتي مش ممكن تنزل الأرض أبداً",
    options: ["الناظر", "ابن حميدو", "الخطايا"],
    answerIndex: 1,
  ),
  Question(
    question: "هاروح اتحزم وأجيلك",
    options: ["ابن حميدو", "سيدة القصر", "الناظر"],
    answerIndex: 1,
  ),
  Question(
    question: "انت مش ابني، انت لقيط",
    options: ["سيدة القصر", "الخطايا", "الناظر"],
    answerIndex: 1,
  ),
  Question(
    question: "زكريا الدرديري مدرس رياضيات وفرنساوي",
    options: ["الخطايا", "الناظر", "اللمبي"],
    answerIndex: 1,
  ),
  Question(
    question: "فتشني فتش",
    options: ["الناظر", "ابن حميدو", "الخطايا"],
    answerIndex: 1,
  ),
  Question(
    question: "يا ناس يا لوكال يا شعبيين",
    options: ["طير إنت", "أتش دبور", "اللمبي"],
    answerIndex: 1,
  ),
  Question(
    question: "ست أنا مش شايف قدامي أيتها ست",
    options: ["سكر هانم", "الناظر", "ابن حميدو"],
    answerIndex: 0,
  ),
  Question(
    question: "ماما .. ياروح أمك",
    options: ["اشاعة حب", "النمر الأسود", "الكيف"],
    answerIndex: 0,
  ),
  Question(
    question: "انت جاي تعزي ولا جاي تهزر؟ لأ أنا جاي أهزر",
    options: ["الكيف", "النمر الأسود", "اشاعة حب"],
    answerIndex: 0,
  ),
  Question(
    question: "كابتن كابتن هو كله ضرب ضرب مفيش شتيمة",
    options: ["صعيدي في الجامعة الأمريكية", "اللعب مع الكبار", "الناظر"],
    answerIndex: 2,
  ),
  Question(
    question: "دنا بدهبزه ودهرزه عشان يبرعش ويحنكش ويبقى اخر طعطعه",
    options: ["الكيف", "اللمبي", "النمر الأسود"],
    answerIndex: 0,
  ),
  Question(
    question: "قولي عملك ايه كرشي، كرشي اللي انت ناسيه قولي",
    options: ["اللمبي", "عبود ع الحدود", "النمر الأسود"],
    answerIndex: 1,
  ),
  Question(
    question: "انسان الغاب طويل الناب",
    options: ["ابن حميدو", "النمر الأسود", "الكيف"],
    answerIndex: 0,
  ),
  Question(
    question: "الإنسان دعيف",
    options: ["ابراهيم الأبيض", "اللمبي", "أحبك يا حسن"],
    answerIndex: 0,
  ),
  Question(
      question: "ويل للعالم إذا انحرف المتعلمون وتبهيظ المثقفون",
      options: [
        "النمر الأسود",
        "اللعب مع الكبار",
        "البيضة والحجر",
      ],
      answerIndex: 2),
  Question(
      question: "يمان واطي انت",
      options: ["طير إنت", "ظرف طارق", "زكي شان"],
      answerIndex: 1),
  Question(
    question: "احنا في زمن المسخ",
    options: ["عمارة يعقوبيان", "الجزيرة", "خارج علي القانون"],
    answerIndex: 0,
  ),
  Question(
    question: "من النهاردة مفيش حكومة أنا الحكومة",
    options: ["الجزيرة", "الكيف", "خارج علي القانون"],
    answerIndex: 0,
  ),
  Question(
    question: "الجواز مش للغلابة اللي زينا",
    options: ["الحب فوق هضبة الهرم", "تيتو", "الإنسان يعيش مرة واحدة"],
    answerIndex: 0,
  ),
  Question(
    question:
        "في بلدنا ابن الضابط لازم يطلع ضابط و ابن تاجر المخدرات لازم يطلع تاجر مخدرات",
    options: ["خارج علي القانون", "عمارة يعقوبيان", "الحب فوق هضبة الهرم"],
    answerIndex: 0,
  ),
  Question(
    question:
        "انا عندي حبوب للضحك و حبوب للكلام و حبوب للسعادة بس ماعنديش حبوب للحزن عشان ده موجود طبيعي",
    options: [
      "الإنسان يعيش مرة واحدة",
      "الحب فوق هضبة الهرم",
      "خارج علي القانون"
    ],
    answerIndex: 0,
  ),
  Question(
    question: "اللي يشوف البلد دي من فوق غير اللي يشوفها من تحت",
    options: ["طيور الظلام", "عمارة يعقوبيان", "الجزيرة"],
    answerIndex: 0,
  ),
  Question(
    question: "مشكلة ابويا انه مش قادر يصدق انه اعمى",
    options: ["الكيت كات", "الإنسان يعيش مرة واحدة", "الحب فوق هضبة الهرم"],
    answerIndex: 0,
  ),
  Question(
    question: "عاش خاين ومات كافر",
    options: ["خيانة مشروعة", "عمارة يعقوبيان", "بئر الخيانة"],
    answerIndex: 2,
  ),
  Question(
    question: "كلنا فاسدون لا استثني احدا حتى بالصمت العاجز",
    options: ["ضد الحكومة", "طيور الظلام", "الحب فوق هضبة الهرم"],
    answerIndex: 0,
  ),
  Question(
    question: "الكنز في الرحلة.. في الناس اللي بتقابلهم بتحبهم وبيحبوك",
    options: ["تيتو", "خارج علي القانون", "عمارة يعقوبيان"],
    answerIndex: 0,
  ),
  Question(
    question: "الحكومة مالهاش دراع عشان تتلوي منه",
    options: ["الارهاب والكباب", "الخطايا", "طيور الظلام"],
    answerIndex: 0,
  ),
  Question(
    question: "انت فاتك قطر الجواز؟ انا فاتتني قطارات كتير",
    options: ["المنسي", "ضد الحكومة", "تيتو"],
    answerIndex: 0,
  ),
  Question(
    question:
        "احنا صغيرين قوي ياسيد.. لا يا امي احنا كبار بس مش عارفين نشوف نفسينا",
    options: [
      "اضحك خللي الصورة تطلع حلوة",
      "عمارة يعقوبيان",
      "الحب فوق هضبة الهرم"
    ],
    answerIndex: 0,
  ),
  Question(
    question: "انا زعلانه أوى من الدنيا يا فاطمة",
    options: ["عن العشق والهوى", "طيور الظلام", "ضد الحكومة"],
    answerIndex: 0,
  ),
  Question(
    question: "انا امي بتتخن من الجوع",
    options: ["حين ميسرة", "عمارة يعقوبيان", "الحب فوق هضبة الهرم"],
    answerIndex: 0,
  ),
  Question(
    question: "شعبي يقول عليا ايه متواطيء معاكم",
    options: ["أيام السادات", "الحب فوق هضبة الهرم", "بئر الخيانة"],
    answerIndex: 0,
  ),
  Question(
    question: "انا حلمي كان صغير و فضل يصغر يصغر لحد ما اختفي و مابقتش اشوفه",
    options: ["عبود على الحدود", "عمارة يعقوبيان", "الكيت كات"],
    answerIndex: 0,
  ),
  Question(
    question: "عاوز تبقى نضيف الفلوس هي اللي هتخليك نضيف",
    options: ["تيتو", "خارج علي القانون", "عمارة يعقوبيان"],
    answerIndex: 0,
  ),
  Question(
    question: "محدش بينجرح قوي غير لما بيحب قوي",
    options: ["أحلام عمرنا", "ضد الحكومة", "حين ميسرة"],
    answerIndex: 0,
  ),
  Question(
    question:
        "كانت أيام ما تتعوضش كان عندنا قوة وقلب عشان كنا رجالة ووقفنا وقفة رجالة وأخرتها دي النتيجة اللي وصلنالها قاعدن بنشكي ونولول زي النسوان",
    options: ["الأرض", "المنسي", "عمارة يعقوبيان"],
    answerIndex: 0,
  ),
  Question(
    question: "انا بقيت زى الجزيرة اقرب واحد ليا علي البر التاني",
    options: ["الجزيرة", "الحب فوق هضبة الهرم", "المشبوه"],
    answerIndex: 0,
  ),
  Question(
    question:
        "في ناس بتنفخ في النار لكن انا عايز افكرهم ان الديمقراطية لها أنياب",
    options: ["أيام السادات", "عمارة يعقوبيان", "بئر الخيانة"],
    answerIndex: 0,
  ),
  Question(
    question:
        "دورى على اللى تعرفي تعيشي معاه، مش ماتعرفيش تستغني عنه، وصدقيني محدش بيموت من الحب",
    options: ["السلم و التعبان", "الحب فوق هضبة الهرم", "أيام السادات"],
    answerIndex: 0,
  ),
  Question(
    question:
        "كلهم كدابين وكلهم عارفين انهم كدابين وكلهم عارفين اننا عارفين انهم كدابين، وبرضو مستمرين ف الكدب",
    options: ["الحب فوق هضبة الهرم", "عمارة يعقوبيان", "خارج علي القانون"],
    answerIndex: 0,
  ),
  Question(
    question:
        "بقيت أحس إني محكوم عليا بالوحدة، متعلق في الهوا لا قادر أمسك حاجة بإيديا ولا في أرض تحتيا",
    options: ["أرض الخوف", "عمارة يعقوبيان", "ضد الحكومة"],
    answerIndex: 0,
  ),
  Question(
    question:
        "انا حاسس ان ربنا بيعذبني في الدنيا عشان شايل لي فرحة كبيرة قوي في الاخرة",
    options: ["الاخوة الاعداء", "عمارة يعقوبيان", "الحب فوق هضبة الهرم"],
    answerIndex: 0,
  ),
  Question(
    question: "كلكم عايزين تبقوا فتوات؟ امال مين اللي حينضرب؟",
    options: ["الشيطان يعظ", "عمارة يعقوبيان", "ضد الحكومة"],
    answerIndex: 0,
  ),
  Question(
    question: "الحشيش لو حلال ادينا بنشربه و لو حرام ادينا بنحرقه",
    options: ["الكيف", "عمارة يعقوبيان", "العار"],
    answerIndex: 2,
  ),
  Question(
    question: "ده النيل و ده الهرم دي مصر ياعبلة",
    options: ["الصعود الي الهاوية", "الحب فوق هضبة الهرم", "ضد الحكومة"],
    answerIndex: 0,
  ),
  Question(
    question: "انا مش تبع حد انا رئيس جمهورية نفسي",
    options: ["اتش دبور", "ظرف طارق", "مطب صناعي "],
    answerIndex: 1,
  ),
  Question(
    question: "يارب...انت عارف بقا",
    options: ["اللي بالي بالك", "اللمبي", "الناظر"],
    answerIndex: 1,
  ),
  Question(
    question: "انا محترم مع المحترم وقليل الادب مع ابن المضايقة",
    options: ["لا تراجع ولا استسلام", "طير انت", "اتش دبور"],
    answerIndex: 2,
  ),
  Question(
    question: "إيه اللي جاب القلعة جنب البحر",
    options: ["اللمبي", "صايع بحر", "عوكل"],
    answerIndex: 2,
  ),
  Question(
    question: "الجرأة حلوة مفيش كلام",
    options: ["الكيت كات", "ابراهيم الابيض", "الكيف"],
    answerIndex: 1,
  ),
  Question(
    question: "روح يا شيخ ... وتعالى بسرعة",
    options: ["اللي بالي بالك", "اللمبي", "اللمبي 8 جيجا"],
    answerIndex: 1,
  ),
  Question(
    question: "لقد انتابتني القشعريرة",
    options: ["اتش دبور", "طير انت", "لا تراجع ولا استسلام"],
    answerIndex: 1,
  ),
  Question(
    question: "ما خلاص يوحش بقا",
    options: ["فول الصين العظيم", "رمضان مبروك ابو العلمين حمودة", "عوكل"],
    answerIndex: 0,
  ),
  Question(
    question: "انت فاجئتني بالموضوع دا",
    options: ["مطب صناعي", "لخمة راس", "خارج عن القانون "],
    answerIndex: 1,
  ),
  Question(
    question: "معنديش جيب ورا",
    options: ["تتح", "اللمبي", "الناظر"],
    answerIndex: 1,
  ),
  Question(
    question: "احنا نعمله كشف علامة",
    options: ["تتح", "الحرب العالمية التالتة", "بنات العم"],
    answerIndex: 1,
  ),
  Question(
    question: "الاسطى زينهم هيرقص",
    options: ["تتح", "عن العشق والهوى", "الفرح"],
    answerIndex: 2,
  ),
  Question(
    question: "الصياعة انك تعور متموتش",
    options: ["الالماني", "تيتو", "ابراهيم الابيض"],
    answerIndex: 2,
  ),
  Question(
    question: "كمال اخويا الكبير ....ماجد ابن الناس",
    options: ["الالماني", "الحريفة", "فوي فوي فوي"],
    answerIndex: 1,
  ),

  Question(
    question: " اوعى القطر ياعم الحاج",
    options: ["االلمبي", "بوحة", "عوكل"],
    answerIndex: 1,
  ),

  Question(
    question: "كداب كدب الإبل",
    options: ["االلمبي", "بوحة", "عوكل"],
    answerIndex: 1,
  ),

  Question(
    question: "لقد أخذ مني السنجة يا سيدي",
    options: ["االلمبي", "عوكل", "بوحة"],
    answerIndex: 1,
  ),

  Question(
    question: "هتقولهم لى نيللي نيللي هقولهم لك شيريهان شيريهان",
    options: ["االلمبي", "الناظر", "اللي بالي بالك"],
    answerIndex: 1,
  ),
  Question(
    question: "حازم حازم",
    options: ["شقة مصر الجديدة", "الباشا تلميذ", "اللي بالي بالك"],
    answerIndex: 1,
  ),

  Question(
    question: "ياناس محدش ياخد .... ابني ويديني بداله مروحة",
    options: ["مطب صناعي", "ميدو مشاكل", "طلق صناعي"],
    answerIndex: 1,
  ),

  Question(
    question: "خاف يا عيد",
    options: [" العيال هربت", " عيال حبيبة", "طلق صناعي"],
    answerIndex: 1,
  ),

  Question(
    question: "يا ناس هموت يا ناس",
    options: [" اللي بالي بالك ", " غبي منه فيه", " اللمبي"],
    answerIndex: 1,
  ),

  Question(
    question: " أحسن حاجة إن الحشيش ده مفيهوش بذر",
    options: ["الكيف ", "جعلتني مجرما", " العار"],
    answerIndex: 1,
  ),

  Question(
    question: "ارحم امي العيانة",
    options: ["جعلتني مجرما ", "عسل اسود", " غبي منه فيه"],
    answerIndex: 1,
  ),

  Question(
    question: "أنا ديفيد كوهين السفير الإسرائيلى",
    options: ["ليلة سقوط بغداد", "السفارة ف العمارة", "الفيل ف المنديل"],
    answerIndex: 1,
  ),

  Question(
    question: "دارت يا صيع",
    options: ["ياباني اصلي", "بنك الحظ", "الفيل ف المنديل"],
    answerIndex: 1,
  ),

  Question(
    question: " باب اي يبرطوشي ",
    options: ["المشبوه", "المتسول", "الحريف"],
    answerIndex: 1,
  ),

  Question(
    question: " طخه بس متموتوش يبوي ",
    options: ["المشبوه", "البحث عن فضيحة", "بوبوس"],
    answerIndex: 1,
  ),

  Question(
    question: " هو اي دا اللي اتنين سنتي ",
    options: ["اسد واربع قطط", "محامي خلع", "نمس بوند"],
    answerIndex: 1,
  ),

  Question(
    question: " المطوة بتاعتنا لكن الفلوس مش بتاعتنا",
    options: ["اسد واربع قطط", "غبي منه فيه", " عايز حقي"],
    answerIndex: 1,
  ),

  Question(
    question: " اتجوزتني نصب يا صابر وكمان مافيش شقة",
    options: ["اسد واربع قطط", "عايز حقي", " حين ميسرة"],
    answerIndex: 1,
  ),

  Question(
    question: " إحنا اللي فهمنا يا سبع الليل",
    options: ["احترس من الخط", "البريء", " حين ميسرة"],
    answerIndex: 1,
  ),

  Question(
    question: " بحبك يا ستاموني مهما الناس لاموني",
    options: ["احترس من الخط", "الكيف", " العار"],
    answerIndex: 1,
  ),

  Question(
    question: " آه يا حوستي السودة يا أنا ياما",
    options: ["  ضربة شمس", "جري الوحوش", "  حبيبي دئما"],
    answerIndex: 1,
  ),

  //the new data added
  Question(
    question: "الليلة يا عمدة.. هي حبكت",
    options: ["أحبك يا حسن", "ابن حميدو", "الزوجة الثانية"],
    answerIndex: 2,
  ),

  Question(
    question: "هو بعينه وغباوته ووشه العكر",
    options: ["أحبك يا حسن", "ابن حميدو", "إسماعيل ياسين في الأسطول"],
    answerIndex: 2,
  ),
  Question(
    question: "قطيعة ماحدش بياكولها بالساهل",
    options: ["أحبك يا حسن", "ابن حميدو", "ريا وسكينة"],
    answerIndex: 2,
  ),
  Question(
    question: "ماتبسطهاش أكتر من كده",
    options: ["أحبك يا حسن", "شارع الحب", "ريا وسكينة"],
    answerIndex: 1,
  ),
  Question(
    question: "يالك من شنقيط",
    options: ["السفيرة عزيزة", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),

  Question(
    question: "بوز جزمتك يدل على أنوثة طاغية",
    options: ["مطار الحب", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "الله ينكد عليك وعلى عمرك يا مصيبة",
    options: ["سلفنى تلاتة جنيه", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "اسألينى أنا.. أمك مدوباهم اتنين",
    options: ["حماتى ملاك", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "تعالى فتشنى فتش",
    options: ["ابن حميدو", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "يا صفايح الزبدة السايحة يا براميل القشطة النايحة",
    options: ["لو كنت غنى", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "وإنت تشيل هم بكره ليه مش يمكن ربنا ياخدك",
    options: ["رصيف نمرة خمسة", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "يجب أن يرسلوا الملايات اللف والطرح للمحاربين القدماء في باريس",
    options: ["إشاعة حب", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "عشان بختى أنا، بتاع الكلب يلبس باشا والباشا يلبس لى جناينى",
    options: ["غزل البنات", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "أنا اللى جبت ده كله لنفسى",
    options: ["الحفيد", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "بلدى طنطا وأنا أحب أعيش أونطا",
    options: ["لصوص لكن ظرفاء", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "الدنيا مليانة ناس حلوة بس الحظ بيحدف علينا بهايم",
    options: ["الفرن", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "أنا بدور على شغل 24 ساعة لدرجة إنى مش فاضى أشتغل",
    options: ["وش إجرام", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "هو كله ضرب ضرب مافيش شتيمة",
    options: ["الناظر", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "عايز تحتفل بالالتصاق يا صايع يا ملتصق",
    options: ["عبود على الحدود", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "إيه اللى جاب القلعة جنب البحر",
    options: ["عوكل", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "يا ترى الحمام فاضى ولا أتصرف في أي درج",
    options: ["ظرف طارق", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "نحن نختلف عن الآخرين خالص",
    options: ["محطة مصر", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "هنا إنت على الأرض إنما فوق مافيش غير نسوان زنانة وعيال فرافير",
    options: ["فتح عينك", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question:
        "بيقولك جمجمتو لوز اللوز والشاسيه بتاعها حنين هتطبع معانا على أي قالب وبسرعة",
    options: ["لا تراجع ولا استسلام", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "الارتباط ده عايز طاقة مش موجودة عندى أصلًا",
    options: ["اللى مالوش كبير", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "ماشى يا خال هأقتله وأديلك رنة",
    options: ["عسكر في المعسكر", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question:
        "هو ده الإتوبيس اللى هيودينا الرحلة.. ده مايوديناش الناصية اللى جاية",
    options: ["عايز حقى", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question:
        "أنا ممكن أتجوز واحدة غلطت مرة قبلى لكن أتجوز واحدة غلطت مع سكان القاهرة وضواحيها وعلى المقيمين خارجها مراعاة فروق التوقيت",
    options: ["حاحا وتفاحة", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "شكلك فاهم يا نصة",
    options: ["غبى منه فيه", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "يا ناس يا لوكال يا شعبيين",
    options: ["إتش دبور", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "طاعة الوالدين أهم من طاعة الأب والأم",
    options: ["مسرح مصر", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),
  Question(
    question: "إحنا شعب انتصر ف حرب ٧٣ سنة ٦ أكتوبر",
    options: ["كلمنى شكرًا", "شارع الحب", "ريا وسكينة"],
    answerIndex: 0,
  ),

  Question(
    question: "يعم هي ناقصة شعر انت مشعر لوحدك",
    options: ["اللي بالي بالك", " بوشكاش", "عمر وسلمى"],
    answerIndex: 1,
  ),

  
  

  Question(
    question: "متقلوش اوي ف الاكل يولاد عشان تقدروا تلعبوا الماتش",
    options: ["التجربة الدنماركية", " بوشكاش", "الحريفة"],
    answerIndex: 1,
  ),

   Question(
    question: "يجدع يجدع",
    options: ["احترس من الخط", " فول الصين العظيم", "عندليب الدقي"],
    answerIndex: 1,
  ),

  Question(
    question: "الكيلو خمستلاف وميتين",
    options: ["المصلحة", " فول الصين العظيم", "غبي منه فيه"],
    answerIndex: 1,
  ),

  Question(
    question: "اعمل نفسك ميت اعمل نفسك ميت",
    options: ["اللمبي", "الناظر", "غبي منه فيه"],
    answerIndex: 1,
  ),

  
  
  Question(
    question: "ارمي اي يعم دا الضنا غالي",
    options: ["اوعا وشك", "ابو علي", "سيد العاطفي"],
    answerIndex: 1,
  ),

  
  Question(
    question: "اهو كيفي كدا",
    options: ["ف محطة مصر", "ابو علي", "الكيف"],
    answerIndex: 1,
  ),

   
  Question(
    question: "اي يجدع انت الكلام الماسخ اللي بتجوله ده",
    options: ["واحد صعيدي", "الياشا تلميذ", "كتكوت"],
    answerIndex: 1,
  ),
   
  Question(
    question: "ده لفظ يقوله دكتور محترم.. عيب على المعطف اللي انت لابسه!",
    options: ["واحد صعيدي", "طير انت", "كتكوت"],
    answerIndex: 1,
  ),

  
  Question(
    question: "ميس ريم ده اسم مركب؟ ولا الوالد اسمه ريم؟",
    options: ["ابو علي", "حراميه في كي جي تو", "حراميه في تايلاند"],
    answerIndex: 1,
  ),

  Question(
    question: "مين بره الفوطة",
    options: ["زكي شان", "ظرف طارق", "مطب صناعي"],
    answerIndex: 1,
  ),

  
  Question(
    question: "الله يكون في عونك يا سامية",
    options: ["غش الزوجية", "غبي منه فيه", "محامي خلع"],
    answerIndex: 1,
  ),

  
  Question(
    question: "إحنا بقينا بنتعلق أكتر ما بنستحمى؟",
    options: ["عندليب الدقي", "وش اجرام", "يا انا يا خالتي"],
    answerIndex: 1,
  ),
    
  Question(
    question: "اهرب يا ياسين.. اهرب ربنا معاك",
    options: ["واحد من الناس", "حرب ايطاليا", "تيتو"],
    answerIndex: 1,
  ),
   
  Question
  (
    question:"ابعد عن حيحا",
    options: ["تتح", "امير الظلام", "طيور الظلام"],
    answerIndex: 1,
  ),

  Question(
    question:"مابيعرفش يوجفها ما بيعرفش يوجفها",
    options: ["المتسول", "بطل من ورق", "المشبوه"],
    answerIndex: 1,
  ),
  Question(
    question:"ايه الليل اللى هجم ده؟",
    options: ["اللمبي 8 جيجا", "اللي بالي بالك", "اللمبي"],
    answerIndex: 1,
  ),

  Question(
    question:"أنا حطاك في دماغي، وبراقبك",
    options: ["الفار الطباخ", "شركة المرعبين المحدودة", "بيتر بان"],
    answerIndex: 1,
  ),
  
  Question(
    question:"صعبان عليا حالكم وانتو ماشيين وراها زي الغنم!",
    options: ["شركة المرعبين المحدودة","سنووايت والأقزام السبعة", "بيتر بان"],
    answerIndex: 1,
  ),
];
