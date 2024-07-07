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
    options: ["أرض الخوف", "الكيف", "اللمبي"],
    answerIndex: 0,
  ),
  Question(
    question: "لازم ندوش الدوشة بدوشة أدوش منها عشان ما تدوشناش",
    options: ["الكيف", "أرض الخوف", "الإنس والجن"],
    answerIndex: 1,
  ),
  Question(
    question: "اقتناعي الشخصي أو عدمه لا يغير من الحقيقة في شيء",
    options: ["الكيف", "اللمبي", "احنا بتوع الأتوبيس"],
    answerIndex: 2,
  ),
  Question(
    question:
        "أنا مش في خدة الوطن.. أنا في خدمة الباشا سيادة اللوا، وحرم الباشا سيادة اللوا، والعيال البشوات ولاد سيادة اللوا",
    options: ["الإرهاب والكباب", "الكيف", "النمر الأسود"],
    answerIndex: 0,
  ),
  Question(
    question:
        "الحجات بتيجي أول ما بنبطل ندور عليها أو نستناها.. المشكلة بقى هل لما هتيجي هنكون لسه جوانا نفس الشغف؟",
    options: ["النمر الأسود", "الإنس والجن", "احنا بتوع الأتوبيس"],
    answerIndex: 0,
  ),
  Question(
    question: "اتسرقنا بكل الأشكال يا حسن!",
    options: ["اللعب مع الكبار", "الحب فوق هضبة الهرم", "طيور الظلام"],
    answerIndex: 0,
  ),
  Question(
    question: "كويس إن أبو الهول والأهرام لسه ما تسرقوش",
    options: ["اللعب مع الكبار", "الحب فوق هضبة الهرم", "طيور الظلام"],
    answerIndex: 1,
  ),
  Question(
    question:
        "لازم كل حاجة في بلدنا تبقى حجارة عشان ما تتسرقش.. حتى الحب والروح الحلوة اتسرقوا يا علي",
    options: ["اللعب مع الكبار", "الحب فوق هضبة الهرم", "طيور الظلام"],
    answerIndex: 2,
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
    options: ["سلام يا صاحبي", "تيتو", "حافية على جسر الذهب"],
    answerIndex: 0,
  ),
  Question(
    question: "أنا عملت كل حاجة غلط ممكن تتخيلها",
    options: ["تيتو", "عبود ع الحدود", "الناظر"],
    answerIndex: 0,
  ),
  Question(
    question: "عايز تحتفل بالالتصاق يا صايع يا ملتصق",
    options: ["عبود ع الحدود", "تيتو", "سلام يا صاحبي"],
    answerIndex: 0,
  ),
  Question(
    question: "جبت الترنك معاك",
    options: ["الناظر", "عبود ع الحدود", "تيتو"],
    answerIndex: 0,
  ),
  Question(
    question: "يا عزيزي كلنا لصوص",
    options: ["يا عزيزي كلنا لصوص", "الناظر", "عبود ع الحدود"],
    answerIndex: 0,
  ),
  Question(
    question: "الله يرحمها أم مختار كانت غالية علينا أوي",
    options: ["اللمبي", "يا عزيزي كلنا لصوص", "عبود ع الحدود"],
    answerIndex: 0,
  ),
  Question(
    question: "أيوه، قولي حاجة من اللي ربنا كتبها علينا",
    options: ["صعيدي في الجامعة الأمريكية", "اللمبي", "يا عزيزي كلنا لصوص"],
    answerIndex: 0,
  ),
  Question(
    question: "أحلى من الشرف مفيش",
    options: ["أحبك يا حسن", "صعيدي في الجامعة الأمريكية", "اللمبي"],
    answerIndex: 0,
  ),
  Question(
    question: "هاروح اتحزم وأجيلك",
    options: ["سيدة القصر", "أحبك يا حسن", "اللمبي"],
    answerIndex: 0,
  ),
  Question(
    question: "ادي كل واحد مربع واداني أربع مربعات",
    options: ["عبود ع الحدود", "سيدة القصر", "أحبك يا حسن"],
    answerIndex: 0,
  ),
  Question(
    question: "أقولك فين ولا تزعلش",
    options: ["أخطر رجل في العالم", "عبود ع الحدود", "سيدة القصر"],
    answerIndex: 0,
  ),
  Question(
    question: "اوعي يغرك جسمك",
    options: ["الناظر", "أخطر رجل في العالم", "عبود ع الحدود"],
    answerIndex: 0,
  ),
  Question(
    question: "هنرقص دانس يا روح أمك",
    options: ["الفرن", "الناظر", "أخطر رجل في العالم"],
    answerIndex: 0,
  ),
  Question(
    question: "انت مش ابني، انت لقيط",
    options: ["الخطايا", "طير إنت", "الناظر"],
    answerIndex: 0,
  ),
  Question(
    question: "زكريا الدرديري مدرس رياضيات وفرنساوي",
    options: ["الناظر", "الخطايا", "الفرن"],
    answerIndex: 0,
  ),
  Question(
    question: "أنا قلت كلمتي مش ممكن تنزل الأرض أبداً",
    options: ["ابن حميدو", "الناظر", "الخطايا"],
    answerIndex: 0,
  ),
  Question(
    question: "هاروح اتحزم وأجيلك",
    options: ["سيدة القصر", "ابن حميدو", "الناظر"],
    answerIndex: 0,
  ),
  Question(
    question: "انت مش ابني، انت لقيط",
    options: ["الخطايا", "سيدة القصر", "الناظر"],
    answerIndex: 0,
  ),
  Question(
    question: "زكريا الدرديري مدرس رياضيات وفرنساوي",
    options: ["الناظر", "الخطايا", "سيدة القصر"],
    answerIndex: 0,
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
      answerIndex: 1)
];
