class Info {
  static String name = "";
  static double height = 0;
  static double weight = 0;
  static String gender = "Nữ";
  static double brm = 0;
  static int age = 25;
  static int targetName;
  static double target = 0;
  static bool showResult = true;
  static int targetId = 0;

  @override
  String toString() {
    return 'name: $name, height: $height, weight: $weight, gender: $gender';
  }

  static int brmCalculate() {
    if (gender.contains('Nữ')) {
      return ((9.247 * weight) + (3.098 * height) - (4.330 * age) + 447.593)
          .round();
    }
    return ((9.247 * height) + (3.098 * weight) - (4.330 * age) + 447.593)
        .round();
  }

  static int kcalCalculate() {
    return (brmCalculate() * 1.2).round();
  }

  static double bmiCalculate() {
    var mheight = height / 100;
    return weight / (mheight * mheight);
  }

  static String bmiClassify(double bmi) {
    if (bmi < 18.5) {
      return "Gầy";
    } else if (bmi < 24.9) {
      return "Bình Thường";
    } else if (bmi < 29.9) {
      return "Thừa cân";
    }
    return "Béo phì";
  }

  static String targetClassify(int targetId) {
    if (targetId == 1) {
      return "tăng cân";
    } else if (targetId == 2) {
      return "giảm cân";
    }
    return "giữ cân";
  }
}

class Gender {
  static String gender = 'Nữ';
}

class Combo {
  static String title = "";
  static String price = "";

  static final List<String> names = <String>[
    'Diet Daily',
    'FitFood VN',
    'Diet Check',
    'Balme',
    'HealRes'
  ];

  static final List<String> address = <String>[
    '269 Liên Phường, q9',
    '17 Võ Văn Tần, q10',
    '183 Trần Nhật Duật, q1',
    '200 Nguyễn Thị Minh Khai, q1',
    '500 Hai Bà Trưng, q1'
  ];

  static final List<String> img = <String>[
    'assets/restaurant1.jpg',
    'assets/restaurant2.jpg',
    'assets/restaurant3.jpg',
    'assets/fitfoodvn.png',
    'assets/low-carb.jpg'
  ];
  static final List<String> imgCombos = <String>[
    'assets/fit1.jpg',
    'assets/fit2.jpg',
    'assets/fit3.jpg',
    'assets/food-set.png',
    'assets/food1.png'
  ];

  static final List<String> prices = <String>[
    '500k-700k',
    '700-1100k',
    '700k-900k',
    '900k-1300k',
    '700k-1300k'
  ];

  static final List<String> distances = <String>[
    '2km',
    '15km',
    '14km',
    '16km',
    '13km'
  ];

  static final List<String> titles = <String>[
    'Gói Fit 1',
    'Gói Fit 2',
    'Gói Fit 3',
    'Gói Fit FULL',
    'Gói FIT DASH',
  ];

  static final List<String> categories = <String>[
    'Dash Diet',
    'Eat Clean',
    'Paleo',
    'Low Carb',
    'Dash',
  ];

  static final List<String> calories = <String>[
    '2000 calories/tuần',
    '2100 calories/tuần',
    '2300 calories/tuần',
    '1995 calories/tuần',
    '1996 calories/tuần',
  ];
}
