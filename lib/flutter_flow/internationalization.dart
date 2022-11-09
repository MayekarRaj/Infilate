import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.toString());

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  {
    "trainingvids": {
      'en': "Watch Training Videos",
      'hi': "प्रशिक्षण वीडियो देखें"
    }
  },
  // LoginScreen
  {
    'vloztxa1': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
    },
    '4xakabw2': {
      'en': 'Please Enter Your Details',
      'hi': 'कृपया अपना विवरण दर्ज करें',
    },
    'ver7y0hr': {
      'en': 'Enter your Location',
      'hi': 'अपनी स्थिति दर्ज़ करें',
    },
    '7nsm5g2x': {
      'en': 'Enter City Location',
      'hi': 'शहर का स्थान दर्ज करें',
    },
    'mfytym34': {
      'en': 'Enter your phone',
      'hi': 'अपना फ़ोन दर्ज करें',
    },
    'lftlm4an': {
      'en': '+91',
      'hi': '+91',
    },
    'hihgzgen': {
      'en': '+91',
      'hi': '+91',
    },
    'upbgmjz3': {
      'en': 'Enter Phone Number',
      'hi': 'फोन नंबर दर्ज',
    },
    'manb6a3d': {
      'en': 'or',
      'hi': 'या',
    },
    'lkclc1fx': {
      'en': 'Use Google',
      'hi': 'गूगल का प्रयोग करें',
    },
    '9cudaprj': {
      'en': 'SUBMIT',
      'hi': 'प्रस्तुत',
    },
    '41lbtfhd': {
      'en': 'By clicking here start you agree to our',
      'hi': 'यहां क्लिक करके आप हमारी सहमति देते हैं start',
    },
    '7uj9iyrs': {
      'en': 'Privacy Policy and terms',
      'hi': 'गोपनीयता नीति और शर्तें',
    },
    '5dzhu8b6': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // OnboardingSwiping
  {
    'hzhs96li': {
      'en': 'Welcome',
      'hi': 'स्वागत',
    },
    'vcek1wn0': {
      'en': 'Be your own Boss',
      'hi': 'अपने बॉस खुद बनें',
    },
    '9g2nvqwq': {
      'en':
          'Start your Bussiness with Zero Investment\nby sell over 30+ products',
      'hi':
          '30+ से अधिक उत्पादों को बेचकर जीरो इन्वेस्टमेंट के साथ अपना व्यवसाय शुरू करें',
    },
    '35ktjnks': {
      'en': 'Earn over ₹5000',
      'hi': '₹5000 से अधिक कमाएं',
    },
    'fsntpm9o': {
      'en': 'Be your own Boss',
      'hi': 'अपने बॉस खुद बनें',
    },
    'e4u92moa': {
      'en':
          'Start your Bussiness with Zero Investment\nby sell over 30+ products',
      'hi':
          '30+ से अधिक उत्पादों को बेचकर जीरो इन्वेस्टमेंट के साथ अपना व्यवसाय शुरू करें',
    },
    'u0zajf9s': {
      'en': 'Refer and Earn',
      'hi': 'देखें और कमाएं',
    },
    'v3bx4f9v': {
      'en': 'Be your own Boss',
      'hi': 'अपने बॉस खुद बनें',
    },
    'ec1riq89': {
      'en':
          'Start your Bussiness with Zero Investment\nby sell over 30+ products',
      'hi':
          '30+ से अधिक उत्पादों को बेचकर जीरो इन्वेस्टमेंट के साथ अपना व्यवसाय शुरू करें',
    },
    'l4395yk2': {
      'en': 'Next',
      'hi': 'अगला',
    },
    'qneit94e': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // CreateProfile
  {
    'bu3wx6e9': {
      'en': 'Skip',
      'hi': 'छोड़ें',
    },
    'nnuj19bk': {
      'en': 'Create Profile',
      'hi': 'प्रोफ़ाइल बनाने',
    },
    '2w2bjmh5': {
      'en': 'Enter Your Details',
      'hi': 'अपना विवरण दर्ज करें',
    },
    'abktgq9b': {
      'en': 'Enter your name',
      'hi': 'अपना नाम दर्ज करें',
    },
    'c2hrfi91': {
      'en': 'Name',
      'hi': 'नाम',
    },
    'uq0348kr': {
      'en': 'Enter your email',
      'hi': 'अपना ईमेल दर्ज करें',
    },
    '4suypdt4': {
      'en': 'Email',
      'hi': 'ईमेल',
    },
    'ryp4ojli': {
      'en': 'Select Date of Birth',
      'hi': 'जन्म तिथि चुनें',
    },
    '48b7mm04': {
      'en': 'DD',
      'hi': 'डीडी',
    },
    'is7cenko': {
      'en': 'MM',
      'hi': 'मिमी',
    },
    'exw4dzcw': {
      'en': 'YYYY',
      'hi': 'YYYY',
    },
    'yz5htb51': {
      'en': 'NEXT',
      'hi': 'अगला',
    },
    '4jg7wwvk': {
      'en': 'Skip',
      'hi': 'छोड़ें',
    },
    '86r8eqze': {
      'en': 'Create Profile',
      'hi': 'प्रोफ़ाइल बनाने',
    },
    '2dhntyga': {
      'en': 'Enter Your Details',
      'hi': 'अपना विवरण दर्ज करें',
    },
    'v6mxa3w8': {
      'en': 'Enter your education',
      'hi': 'अपनी शिक्षा दर्ज करें',
    },
    'xloxn6j4': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
    },
    'zko74fje': {
      'en': 'Not Selected',
      'hi': 'नहीं चुने गए',
    },
    'h488pwyx': {
      'en': 'Select income',
      'hi': 'आय का चयन करें',
    },
    'ze3p56nq': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
    },
    'xbplci7x': {
      'en': 'Not Selected',
      'hi': 'नहीं चुने गए',
    },
    'aj2utydv': {
      'en': 'NEXT',
      'hi': 'अगला',
    },
    'htlvyell': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // MainScreen
  {
    '690a8txe': {
      'en': 'Available Balance',
      'hi': 'उपलब्ध शेष राशि',
    },
    '1i0ql7te': {
      'en': '100.00',
      'hi': '100.00',
    },
    'y8esvdau': {
      'en': 'Add Lead',
      'hi': 'लीड जोड़ें',
    },
    'e783uiim': {
      'en': '₹',
      'hi': '₹',
    },
    '31owcit1': {
      'en': 'Paid Earning',
      'hi': 'भुगतान की गई कमाई',
    },
    '6c2x8uho': {
      'en': '700.00',
      'hi': '700.00',
    },
    'zofhzris': {
      'en': '₹',
      'hi': '₹',
    },
    'mmirbshk': {
      'en': 'Pending Earning',
      'hi': 'लंबित आय',
    },
    '1ahjxx0b': {
      'en': '400.00',
      'hi': '400.00',
    },
    'db3hdi0e': {
      'en': '12',
      'hi': '12',
    },
    '6bq78k07': {
      'en': 'Total Leads',
      'hi': 'कुल लीड',
    },
    '1tyxj5r7': {
      'en': 'Add Lead',
      'hi': 'लीड जोड़ें',
    },
    'qxjqel10': {
      'en': '04',
      'hi': '04',
    },
    '03kx3rqb': {
      'en': 'Leads \nin Process',
      'hi': 'प्रक्रिया में अग्रणी',
    },
    'ou3cs2en': {
      'en': '08',
      'hi': '08',
    },
    'qvjke30w': {
      'en': 'Leads \nin Process',
      'hi': 'प्रक्रिया में अग्रणी',
    },
    'ki0jxole': {
      'en': 'Complete Your Daily Challenges\n& Earn Rewards and Cash',
      'hi': 'अपनी दैनिक चुनौतियों को पूरा करें और पुरस्कार और नकद कमाएं',
    },
    'xo87eubl': {
      'en': 'Get Started with training Video',
      'hi': 'प्रशिक्षण वीडियो के साथ आरंभ करें',
    },
    'nqlzt6ba': {
      'en': '30:00 Left',
      'hi': '30:00 बायाँ',
    },
    'syez0b39': {
      'en': 'Sell and Earn',
      'hi': 'बेचो और कमाओ',
    },
    'crjol4et': {
      'en': 'more',
      'hi': 'अधिक',
    },
    '2476mxe2': {
      'en': 'Credit Card',
      'hi': 'क्रेडिट कार्ड',
    },
    'flf84yn1': {
      'en': 'Top Selling Brands',
      'hi': 'सबसे अधिक बिकने वाले ब्रांड',
    },
    'eqxzxlau': {
      'en': 'Niyox \nSavings',
      'hi': 'Niyox बचत',
    },
    'd48nr2cy': {
      'en': 'Earn ₹450',
      'hi': '₹450 कमाएं',
    },
    '5wo70lw9': {
      'en': '00:30 min Left',
      'hi': '00:30 मिनट बाएँ',
    },
    'xcj0whng': {
      'en': 'What\'s new ✨',
      'hi': 'नया क्या है',
    },
    'vaih1ol4': {
      'en': 'What People are saying',
      'hi': 'लोग क्या कह रहे हैं',
    },
    'o8jtokzk': {
      'en': 'Jayesh\nKummar',
      'hi': 'जयेश कुमारी',
    },
    'yruanjkk': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu vitae at ipsum nunc, integer fermentum pretium, non. ',
      'hi':
          'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट। आर्कु विटे और इप्सम ननक, इंटीजर फेरमेंटम प्रीटियम, नॉन।',
    },
    '495s9mfe': {
      'en': '4.0',
      'hi': '4.0',
    },
    'ooybr9kb': {
      'en': '24 July 2022',
      'hi': '24 जुलाई 2022',
    },
    'r03lf2xb': {
      'en': 'Jayesh\nKummar',
      'hi': 'जयेश कुमारी',
    },
    'w0zrpk6m': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu vitae at ipsum nunc, integer fermentum pretium, non. ',
      'hi':
          'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट। आर्कु विटे और इप्सम ननक, इंटीजर फेरमेंटम प्रीटियम, नॉन।',
    },
    'i662bj01': {
      'en': '4.0',
      'hi': '4.0',
    },
    'u4dnzycx': {
      'en': '24 July 2022',
      'hi': '24 जुलाई 2022',
    },
    'blqfzjxe': {
      'en': 'Home',
      'hi': 'घर',
    },
    'o6q525sl': {
      'en': 'Lead',
      'hi': 'प्रमुख',
    },
    'jrl3fhfs': {
      'en': 'Refferal',
      'hi': 'रेफ़रल',
    },
    'yoe8pgmq': {
      'en': 'Traning',
      'hi': 'ट्रैनिंग',
    },
    '2wx7bhps': {
      'en': 'Hello,',
      'hi': 'नमस्ते,',
    },
    'ovh0gizv': {
      'en': 'Yash! ',
      'hi': 'यश!',
    },
    'zqiy4vyi': {
      'en': 'Affiliate',
      'hi': 'संबद्ध',
    },
    'vt0gihmr': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // KYCDetails01
  {
    'kgihoniq': {
      'en': 'KYC',
      'hi': 'केवाईसी',
    },
    'p7ytwxdh': {
      'en': 'Please Complete Your KYC for Payment withdraw\nand more benifits',
      'hi': 'भुगतान निकासी और अधिक लाभों के लिए कृपया अपना केवाईसी पूरा करें',
    },
    '78a1nf2j': {
      'en': 'Mandatory Doucments ',
      'hi': 'अनिवार्य दस्तावेज',
    },
    'puw5c0rd': {
      'en': 'Skip',
      'hi': 'छोड़ें',
    },
    'ypkrrnmx': {
      'en': 'SUBMIT',
      'hi': 'प्रस्तुत',
    },
    'pbytmpyw': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // KYCDetails02
  {
    'j071oqdq': {
      'en': 'KYC Details',
      'hi': 'केवाईसी विवरण',
    },
    'wiv0s3q2': {
      'en': 'Enter your KYC details',
      'hi': 'अपना केवाईसी विवरण दर्ज करें',
    },
    'mvawgbcj': {
      'en': 'Pan Card Number',
      'hi': 'पैन कार्ड नंबर',
    },
    'f8m1o7ll': {
      'en': 'AS85420S58',
      'hi': 'AS85420S58',
    },
    '1h2olxcq': {
      'en': 'Aadhar Card Number',
      'hi': 'आधार कार्ड नंबर',
    },
    'nwwokd0y': {
      'en': '9852 6525 7852',
      'hi': '9852 6525 7852',
    },
    'l6urhqog': {
      'en': 'Upload Photos',
      'hi': 'तस्वीरें अपलोड करें',
    },
    'sse52flg': {
      'en': 'Add PAN Image here',
      'hi': 'यहां पैन छवि जोड़ें',
    },
    'rwlgwnrf': {
      'en': 'Add Aadhar Image here',
      'hi': 'यहां आधार इमेज जोड़ें',
    },
    '3o4lwnpc': {
      'en': 'Your Doucments are 100% safe',
      'hi': 'आपके दस्तावेज़ 100% सुरक्षित हैं',
    },
    '3bqaamd9': {
      'en': 'SUBMIT',
      'hi': 'प्रस्तुत',
    },
    'zczhm2ip': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Profile2
  {
    '7gos272n': {
      'en': 'No bank has been added yet',
      'hi': 'अभी तक कोई बैंक नहीं जोड़ा गया है',
    },
    'bavmjvbu': {
      'en': 'XXXXXXXXXX5241',
      'hi': 'XXXXXXXXXX5241',
    },
    'bkiipwia': {
      'en': 'Select Bank',
      'hi': 'बैंक चुनें',
    },
    '1ucqhnd4': {
      'en': 'Account No',
      'hi': 'खाता नंबर',
    },
    'paymx0oo': {
      'en': 'XXXXXXXXXX2514',
      'hi': 'XXXXXXXXXX2514',
    },
    't1bnjrwc': {
      'en': 'Confirm Account No',
      'hi': 'खाता संख्या की पुष्टि करें',
    },
    'ppjd8vym': {
      'en': 'XXXXXXXXXX2514',
      'hi': 'XXXXXXXXXX2514',
    },
    'yv77b6lt': {
      'en': 'IFSC',
      'hi': 'आईएफएससी',
    },
    'nhrhb6ik': {
      'en': 'BOB2105',
      'hi': 'बीओबी2105',
    },
    '2858af2z': {
      'en': 'Submit',
      'hi': 'प्रस्तुत करना',
    },
    'xtce4j4w': {
      'en': 'Banking',
      'hi': 'बैंकिंग',
    },
    'c6ay9dha': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Profile
  {
    '9q4b6d1p': {
      'en': 'Yash Pandey',
      'hi': 'यश पांडेय',
    },
    'xezmftrc': {
      'en': 'Uni-Code',
      'hi': 'यूनी-कोड',
    },
    'e9nrn3cg': {
      'en': ' INFI0258',
      'hi': 'INFI0258',
    },
    'uscs28ok': {
      'en': '+91 9022334455',
      'hi': '+91 9022334455',
    },
    't7ea88q8': {
      'en': 'yashpandey@gmail.com',
      'hi': 'यशपांडे@gmail.com',
    },
    'auzi9zz8': {
      'en': '₹736.20',
      'hi': '₹736.20',
    },
    'j2gwih2y': {
      'en': 'Avaibale Balance',
      'hi': 'अवाइबले बैलेंस',
    },
    'qhbc6bdz': {
      'en': 'Change Uni-Code',
      'hi': 'यूनी-कोड बदलें',
    },
    'mpw4ka2u': {
      'en': 'Banking',
      'hi': 'बैंकिंग',
    },
    'holb7w5p': {
      'en': 'Not Linked',
      'hi': 'असंबंधित',
    },
    '26y04wmn': {
      'en': 'KYC Details',
      'hi': 'केवाईसी विवरण',
    },
    'eftemp6o': {
      'en': 'Not Completed',
      'hi': 'पूरा नहीं हुआ',
    },
    'z1f9lio5': {
      'en': 'Change Language',
      'hi': 'भाषा बदलो',
    },
    'oxsnvzxo': {
      'en': 'English',
      'hi': 'अंग्रेज़ी',
    },
    '57t3k58p': {
      'en': 'Privacy Policy',
      'hi': 'गोपनीयता नीति',
    },
    'zyf6u9z4': {
      'en': 'Terms and Conditions',
      'hi': 'नियम और शर्तें',
    },
    'le4anqro': {
      'en': 'Switch to Infuluncer',
      'hi': 'इन्फ्लुएंसर पर स्विच करें',
    },
    'pqxozfrm': {
      'en': 'Logout',
      'hi': 'लॉग आउट',
    },
    'jfg78ecs': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
    },
    'krtn59t3': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ProfileKYCdetails
  {
    'ap1tgxkm': {
      'en': 'KYC Details',
      'hi': 'केवाईसी विवरण',
    },
    'qa6ne65j': {
      'en': 'Enter your KYC details',
      'hi': 'अपना केवाईसी विवरण दर्ज करें',
    },
    'ctafgx4j': {
      'en': 'PAN Card Number',
      'hi': 'पैन कार्ड नंबर',
    },
    'tmjzrkg4': {
      'en': 'AS85420S58',
      'hi': 'AS85420S58',
    },
    'rj5uvyl3': {
      'en': 'Aadhar Card Number',
      'hi': 'आधार कार्ड नंबर',
    },
    '2jl0bzna': {
      'en': '9852 6525 7852',
      'hi': '9852 6525 7852',
    },
    'pocsbaaj': {
      'en': 'Upload Photos',
      'hi': 'तस्वीरें अपलोड करें',
    },
    'uivrxwog': {
      'en': 'Add PAN Image here',
      'hi': 'यहां पैन छवि जोड़ें',
    },
    'g2eti3b1': {
      'en': 'Add Aadhar Image here',
      'hi': 'यहां आधार इमेज जोड़ें',
    },
    'k23o6hxq': {
      'en': 'Submit',
      'hi': 'प्रस्तुत करना',
    },
    'quvy8960': {
      'en': 'KYC Details',
      'hi': 'केवाईसी विवरण',
    },
    '3w4h8r2f': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Wallet
  {
    'y6x7bj82': {
      'en': 'Wallet',
      'hi': 'बटुआ',
    },
    'klqm6gjq': {
      'en': 'Available Balance',
      'hi': 'उपलब्ध शेष राशि',
    },
    '4m7hbe3r': {
      'en': '100.00',
      'hi': '100.00',
    },
    'check_rewards': {
      'en': 'Check Rewards',
      'hi': 'लॉग इन करें',
    },
    'wza3rcku': {
      'en': 'Add Lead',
      'hi': 'लीड जोड़ें',
    },
    'grzxkw0f': {
      'en': '₹',
      'hi': '₹',
    },
    'ha418jie': {
      'en': 'Paid Earning',
      'hi': 'भुगतान की गई कमाई',
    },
    '7txrwrla': {
      'en': '700.00',
      'hi': '700.00',
    },
    '712i1fbe': {
      'en': '₹',
      'hi': '₹',
    },
    'vq094jwh': {
      'en': 'Pending Earning',
      'hi': 'लंबित आय',
    },
    'gfr3no2x': {
      'en': '400.00',
      'hi': '400.00',
    },
    '9mr7hu35': {
      'en': 'Add Lead',
      'hi': 'लीड जोड़ें',
    },
    '1dwh0zft': {
      'en': 'Withdraw',
      'hi': 'वापस लेना',
    },
    'tqdehsx4': {
      'en': 'Complete your KYC to withdrawn',
      'hi': 'वापस लेने के लिए अपना केवाईसी पूरा करें',
    },
    'vqje4vk4': {
      'en': '      Payout      ',
      'hi': 'भुगतान',
    },
    'ov68xzkr': {
      'en': '      Refferal      ',
      'hi': 'रेफ़रल',
    },
    'hrhlpgx5': {
      'en': '      History      ',
      'hi': 'इतिहास',
    },
    'p5cydnoe': {
      'en': '      Payout      ',
      'hi': 'भुगतान',
    },
    'kuc4275t': {
      'en': 'Search',
      'hi': 'खोज',
    },
    '603163qg': {
      'en': 'Recent',
      'hi': 'हालिया',
    },
    '73l2tmuz': {
      'en': 'Yash Ganesh Pandey',
      'hi': 'यश गणेश पाण्डेय',
    },
    'tr4l13hg': {
      'en': 'Paytm',
      'hi': 'Paytm',
    },
    'caz9qf1y': {
      'en': '+₹360.00',
      'hi': '+₹360.00',
    },
    '12lw68ky': {
      'en': 'Suraj Kamble',
      'hi': 'सूरज कांबले',
    },
    'a7nk6z6f': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    'jdfrrnsj': {
      'en': '+₹360.00',
      'hi': '+₹360.00',
    },
    'nxdz9rx0': {
      'en': 'Suraj Kamble',
      'hi': 'सूरज कांबले',
    },
    'pk1tzvxr': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    'jrf4htua': {
      'en': '+₹360.00',
      'hi': '+₹360.00',
    },
    'ltap2psn': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // VoucherRewards
  {
    'q2vrbzu2': {
      'en': 'Voucher & Rewards',
      'hi': 'वाउचर और पुरस्कार',
    },
    'vt12p9fc': {
      'en': 'Complete Your Daily Challenges',
      'hi': 'अपनी दैनिक चुनौतियों को पूरा करें',
    },
    'ojuw0ou0': {
      'en': '30:00 Left',
      'hi': '30:00 बायाँ',
    },
    'c2jl2vdp': {
      'en': 'Vouchers & Rewards',
      'hi': 'वाउचर और पुरस्कार',
    },
    'tillv95r': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // VoucherRewards2
  {
    'jxrapkiy': {
      'en': 'Voucher & Rewards',
      'hi': 'वाउचर और पुरस्कार',
    },
    'f0yd5fqg': {
      'en': 'Zomato',
      'hi': 'ज़ोमैटो',
    },
    'e5ya7cmm': {
      'en': 'Expires on : 01 Aug 2022',
      'hi': 'समाप्ति तिथि : 01 अगस्त 2022',
    },
    '1ho0quig': {
      'en': 'Get 50% OFF On Food  \nOrder Online',
      'hi': 'खाद्य आदेश ऑनलाइन पर 50% की छूट प्राप्त करें',
    },
    'gbla4vpr': {
      'en': 'Upto ₹150 on minium order of ₹159\non zomato',
      'hi': 'Zomato . पर ₹159 के मिनियम ऑर्डर पर ₹150 तक',
    },
    'mdxpfoam': {
      'en': 'W4sw85sxcA...',
      'hi': 'W4sw85sxcA...',
    },
    'lbu7nv1q': {
      'en': 'Copy',
      'hi': 'प्रतिलिपि',
    },
    'jkjbs07j': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // SellEarn2
  {
    'dqb1egzb': {
      'en': 'Sell & Earn',
      'hi': 'बेचो और कमाओ',
    },
    'vgjkhxkb': {
      'en': 'Top Credit Cards',
      'hi': 'शीर्ष क्रेडिट कार्ड',
    },
    '1y3pq6ar': {
      'en': 'Axis Bank Credit Card',
      'hi': 'एक्सिस बैंक क्रेडिट कार्ड',
    },
    'qem71t53': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    'y8ktbw8j': {
      'en': 'Bank of Baroda Credit Card',
      'hi': 'बैंक ऑफ बड़ौदा क्रेडिट कार्ड',
    },
    'kl9zb1r1': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    '39ppmpji': {
      'en': 'Kotak 811 Credit Bank',
      'hi': 'कोटक 811 क्रेडिट बैंक',
    },
    '7rd6dkat': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    'mcc9gpq2': {
      'en': 'SBI Credit Card',
      'hi': 'एसबीआई क्रेडिट कार्ड',
    },
    'huetk5a1': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    'lhhssbfo': {
      'en': 'Bajaj EMI Credit Bank',
      'hi': 'बजाज ईएमआई क्रेडिट बैंक',
    },
    'qxd6lgxc': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    'dxp2vy8z': {
      'en': 'ICICI Credit Card',
      'hi': 'आईसीआईसीआई क्रेडिट कार्ड',
    },
    '0o9qdq0i': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    'r7ir2i7v': {
      'en': 'HDFC bank Credit Card',
      'hi': 'एचडीएफसी बैंक क्रेडिट कार्ड',
    },
    'pus8nbp6': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    'vfdnrnp5': {
      'en': 'Frist IDFC Bank Cerdit Card',
      'hi': 'फ्रिस्ट आईडीएफसी बैंक सेर्डिट कार्ड',
    },
    'wvrz8tc6': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    '6v13wdrg': {
      'en': 'Fi Credit Card',
      'hi': 'फाई क्रेडिट कार्ड',
    },
    't313fffh': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    'q35lhumv': {
      'en': 'Slice Credit Card',
      'hi': 'स्लाइस क्रेडिट कार्ड',
    },
    'tr5defnz': {
      'en': 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
      'hi': 'लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट।',
    },
    'etl63rbs': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Sellnearndetail
  {
    't3jwyjut': {
      'en': 'Sell & Earn',
      'hi': 'बेचो और कमाओ',
    },
    'w7gcgg5d': {
      'en': 'Add Customers',
      'hi': 'ग्राहक जोड़ें',
    },
    'yoppjwuz': {
      'en': 'Share',
      'hi': 'शेयर करना',
    },
    'jhnpwtc6': {
      'en': 'Profit',
      'hi': 'फायदा',
    },
    'dzmb8mpw': {
      'en': 'Details',
      'hi': 'विवरण',
    },
    'l16g0lwm': {
      'en': 'How to Perform',
      'hi': 'कैसे प्रदर्शन करें',
    },
    'j167fppr': {
      'en': 'How it works?',
      'hi': 'यह काम किस प्रकार करता है?',
    },
    '2d0g4xv3': {
      'en':
          '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio velit asuspendisse vitae. \n\n2. Sed consectetur non platea tellus lectus. Neque, maecenas tincidunt sodales nec. \n\n3. Facilisis vehicula odio tincidunt sed urna blandit et. Mus sodales tortor molestie.\n\n4. vsed vestibulum nulla. Sit suscipit amet tempus nunc eget ultricies. Vel massa, aenean molestie fermentum. Nulla purus feugiat lectus a, euismod erat proin cursus. Sit rhoncus neque nisi quis eget vivamus.',
      'hi':
          '1. लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट। ओडियो वेलिट एसेंडिसे विटे। 2. सेड consectetur गैर प्लेटिया टेलस लेक्टस। नेक, मैकेनास टिनसीडंट सोडालेस एनईसी। 3. फैसिलिसिस व्हीकल ओडियो टिनसीडंट सेड urna ब्लैंडिट एट। मुस सोडालेस टॉर्चर मोलेस्टी। 4. बनाम वेस्टिबुलम नाला। सस्पिट एमेट टेम्पस ननक इगेट अल्ट्रीसीज बैठें। वेल मस्सा, ऐनियन मोलेस्टी फेरमेंटम। नुल्ला पुरुस फ्यूगिएट लेक्टस ए, ईयूइसमॉड एरेट प्रोइन कर्सस। सिट रोंकस नेक निसी क्विस एगेट विवामस।',
    },
    'n56hufaw': {
      'en': 'Terms and Conditions',
      'hi': 'नियम और शर्तें',
    },
    'mat1qtyl': {
      'en':
          '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio velit asuspendisse vitae. \n\n2. Sed consectetur non platea tellus lectus. Neque, maecenas tincidunt sodales nec. \n\n3. Facilisis vehicula odio tincidunt sed urna blandit et. Mus sodales tortor molestie.\n\n4. vsed vestibulum nulla. Sit suscipit amet tempus nunc eget ultricies. Vel massa, aenean molestie fermentum. Nulla purus feugiat lectus a, euismod erat proin cursus. Sit rhoncus neque nisi quis eget vivamus.',
      'hi':
          '1. लोरेम इप्सम डोलर सिट एमेट, कॉन्सेक्टेटूर एडिपिसिसिंग एलीट। ओडियो वेलिट एसेंडिसे विटे। 2. सेड consectetur गैर प्लेटिया टेलस लेक्टस। नेक, मैकेनास टिनसीडंट सोडालेस एनईसी। 3. फैसिलिसिस व्हीकल ओडियो टिनसीडंट सेड urna ब्लैंडिट एट। मुस सोडालेस टॉर्चर मोलेस्टी। 4. बनाम वेस्टिबुलम नाला। सस्पिट एमेट टेम्पस ननक इगेट अल्ट्रीसीज बैठें। वेल मस्सा, ऐनियन मोलेस्टी फेरमेंटम। नुल्ला पुरुस फ्यूगिएट लेक्टस ए, ईयूइसमॉड एरेट प्रोइन कर्सस। सिट रोंकस नेक निसी क्विस एगेट विवामस।',
    },
    '5f1p6ycq': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // SellEarn
  {
    'iliqrbuu': {
      'en': 'Sell & Earn',
      'hi': 'बेचो और कमाओ',
    },
    'kscblcjt': {
      'en': 'Select Categories',
      'hi': 'श्रेणियाँ चुनें',
    },
    'l15gveip': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Register_Screen
  {
    'v0v6727c': {
      'en': 'Please wait we are almost done!',
      'hi': 'कृपया प्रतीक्षा करें हम लगभग कर चुके हैं!',
    },
    '39eo0kw4': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Register_Screen02
  {
    'w72b7lsv': {
      'en': 'Your Unique ID',
      'hi': 'आपकी विशिष्ट आईडी',
    },
    '92y409kz': {
      'en': 'INFI0258',
      'hi': 'INFI0258',
    },
    'qe5tigr0': {
      'en': 'Save',
      'hi': 'बचाना',
    },
    '60vihgnq': {
      'en': 'Share your visitng card with your\nfriends and family.\nor',
      'hi':
          'अपने विजिटिंग कार्ड को अपने दोस्तों और परिवार के साथ साझा करें। या',
    },
    '8e42nme5': {
      'en': 'Click on Create pin to Generate M-Pin',
      'hi': 'एम-पिन जेनरेट करने के लिए क्रिएट पिन पर क्लिक करें',
    },
    'uucze3ja': {
      'en': 'Creat M-Pin',
      'hi': 'एम-पिन बनाएं',
    },
    '658om19t': {
      'en': 'Share now',
      'hi': 'अब साझा करें',
    },
    '8k69l0u5': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Managelead
  {
    'wck0b4bj': {
      'en': 'Button',
      'hi': 'बटन',
    },
    'sgmfy3u3': {
      'en': 'Manage Lead',
      'hi': 'लीड प्रबंधित करें',
    },
    'kd940jto': {
      'en': 'All',
      'hi': 'सभी',
    },
    'zpmsrkzm': {
      'en': 'In Process',
      'hi': 'इस प्रक्रिया में',
    },
    'osv95djb': {
      'en': 'Complete',
      'hi': 'पूरा',
    },
    'iuq2l2mt': {
      'en': 'Rejection',
      'hi': 'अस्वीकार',
    },
    '5plshm0l': {
      'en': 'Paytm',
      'hi': 'Paytm',
    },
    'x51kets0': {
      'en': 'HDFC',
      'hi': 'एचडीएफसी',
    },
    'w1q4z58e': {
      'en': 'Fi',
      'hi': 'फाई',
    },
    'fjg0jpuk': {
      'en': 'ICICI',
      'hi': 'आईसीआईसीआई',
    },
    '1a3wh8xh': {
      'en': 'Bank Of Baroda',
      'hi': 'बैंक ऑफ बड़ौदा',
    },
    '8kuwkns5': {
      'en': 'Search',
      'hi': 'खोज',
    },
    'fw2nne7k': {
      'en': 'Recent',
      'hi': 'हालिया',
    },
    'cax8aqlc': {
      'en': 'Yash Ganesh Pande',
      'hi': 'यश गणेश पांडे',
    },
    '4q6ts9de': {
      'en': 'Success',
      'hi': 'सफलता',
    },
    '706ftvs9': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    '9gplf9fd': {
      'en': '+₹360.00',
      'hi': '+₹360.00',
    },
    'd4bhrzvx': {
      'en': '26 July 2022',
      'hi': '26 जुलाई 2022',
    },
    'ijswfjou': {
      'en': 'Darshan',
      'hi': 'दर्शन',
    },
    '2ng8k3l1': {
      'en': 'Rejected',
      'hi': 'अस्वीकृत',
    },
    'mg89y7lr': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    'ek3j81as': {
      'en': 'Oops! Your lead got rejected.',
      'hi': 'उफ़! आपका नेतृत्व अस्वीकार कर दिया गया।',
    },
    '3s409s4b': {
      'en': 'Murdhul',
      'hi': 'मुर्धुली',
    },
    'ms9amn1x': {
      'en': 'Success',
      'hi': 'सफलता',
    },
    'ng9as6ys': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    'h9g9419d': {
      'en': '+₹250.00',
      'hi': '+₹250.00',
    },
    'i5rw1hsw': {
      'en': 'Kartik',
      'hi': 'कार्तिक',
    },
    'vz54xegi': {
      'en': 'In-Process',
      'hi': 'इस प्रक्रिया में',
    },
    '5ve325q7': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    'h4raxaeu': {
      'en': 'We will update you in 1-2 days.',
      'hi': 'हम आपको 1-2 दिनों में अपडेट कर देंगे।',
    },
    '4f7gjv3k': {
      'en': '08 July 2022',
      'hi': '08 जुलाई 2022',
    },
    '4m5defdo': {
      'en': 'Pratham Mule',
      'hi': 'प्रथम मुले',
    },
    'mwjtik2i': {
      'en': 'Success',
      'hi': 'सफलता',
    },
    'hh71og3x': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    'i0z4dgga': {
      'en': '+₹265.00',
      'hi': '+₹265.00',
    },
    'ap3em318': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Managelead02
  {
    'a8pc8935': {
      'en': 'Button',
      'hi': 'बटन',
    },
    'uobi68en': {
      'en': 'Manage Lead',
      'hi': 'लीड प्रबंधित करें',
    },
    'ozn4oxop': {
      'en': 'All',
      'hi': 'सभी',
    },
    'iqf6l0pk': {
      'en': 'In Process',
      'hi': 'इस प्रक्रिया में',
    },
    'xjcqt48t': {
      'en': 'Complete',
      'hi': 'पूरा',
    },
    'a6eqh7si': {
      'en': 'Rejection',
      'hi': 'अस्वीकार',
    },
    'p25cdiew': {
      'en': 'Paytm',
      'hi': 'Paytm',
    },
    'ock27kz9': {
      'en': 'HDFC',
      'hi': 'एचडीएफसी',
    },
    '8ozxilke': {
      'en': 'Fi',
      'hi': 'फाई',
    },
    'uugdrxa9': {
      'en': 'ICICI',
      'hi': 'आईसीआईसीआई',
    },
    'xuy1ev0s': {
      'en': 'Bank Of Baroda',
      'hi': 'बैंक ऑफ बड़ौदा',
    },
    'ctko5moo': {
      'en': 'Search',
      'hi': 'खोज',
    },
    'n8431jny': {
      'en': 'Recent',
      'hi': 'हालिया',
    },
    'o9jg5ayy': {
      'en': 'Shyam',
      'hi': 'श्याम',
    },
    'hr5ef411': {
      'en': 'In-Process',
      'hi': 'इस प्रक्रिया में',
    },
    'j6csi227': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    'ook86mis': {
      'en': 'We will update you in 1-2 days.',
      'hi': 'हम आपको 1-2 दिनों में अपडेट कर देंगे।',
    },
    'ir8s495m': {
      'en': '26 July 2022',
      'hi': '26 जुलाई 2022',
    },
    'bqtaqiau': {
      'en': 'Mayur Dhumal',
      'hi': 'मयूर धूमाली',
    },
    'xv87ctld': {
      'en': 'In-Process',
      'hi': 'इस प्रक्रिया में',
    },
    'pe3laa8q': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    '53dnhkgt': {
      'en': 'We will update you in 1-2 days.',
      'hi': 'हम आपको 1-2 दिनों में अपडेट कर देंगे।',
    },
    'l9uz02wn': {
      'en': 'Pratik Mathur',
      'hi': 'प्रतीक माथुरी',
    },
    '03zbosrp': {
      'en': 'In-Process',
      'hi': 'इस प्रक्रिया में',
    },
    'wgrkvg3s': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    'jan7qqxo': {
      'en': 'We will update you in 1-2 days.',
      'hi': 'हम आपको 1-2 दिनों में अपडेट कर देंगे।',
    },
    'dxqtdphb': {
      'en': 'Madhaur Reddy',
      'hi': 'माधौर रेड्डी',
    },
    'tqkcx19z': {
      'en': 'In-Process',
      'hi': 'इस प्रक्रिया में',
    },
    'lenhy7f7': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    '1fq16bwn': {
      'en': 'We will update you in 1-2 days.',
      'hi': 'हम आपको 1-2 दिनों में अपडेट कर देंगे।',
    },
    '64bbjo5x': {
      'en': '08 July 2022',
      'hi': '08 जुलाई 2022',
    },
    'cpp7kke2': {
      'en': 'Aditya Varma',
      'hi': 'आदित्य वर्मा',
    },
    '0ezcq9m1': {
      'en': 'In-Process',
      'hi': 'इस प्रक्रिया में',
    },
    'gxy4t2ak': {
      'en': 'Paytm Money',
      'hi': 'पेटीएम मनी',
    },
    'zl1m7guv': {
      'en': 'We will update you in 1-2 days.',
      'hi': 'हम आपको 1-2 दिनों में अपडेट कर देंगे।',
    },
    '62t0kzwb': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Support
  {
    '88mlvksi': {
      'en': 'Support',
      'hi': 'सहायता',
    },
    'dc9qgam6': {
      'en': 'How can \nwe Help you?',
      'hi': 'हम आपकी कैसे मदद कर सकते हैं?',
    },
    '4rnc1h9u': {
      'en': 'Chat with us',
      'hi': 'हम से बात करे',
    },
    'j6eencd4': {
      'en': 'Email us',
      'hi': 'हमे ईमेल करे',
    },
    'tqxscuxr': {
      'en': 'Call us',
      'hi': 'हमें कॉल करें',
    },
    '568lkmuw': {
      'en': 'FAQ',
      'hi': 'सामान्य प्रश्न',
    },
    's9ab21g6': {
      'en': 'What is infilate app',
      'hi': 'इनफिलेट ऐप क्या है',
    },
    'ag14yt5u': {
      'en': 'What is your name',
      'hi': 'तुम्हारा नाम क्या हे',
    },
    '5eln7y79': {
      'en': 'What sample question?',
      'hi': 'क्या नमूना प्रश्न?',
    },
    'l9lzyucd': {
      'en': 'All new sample questions',
      'hi': 'सभी नए नमूना प्रश्न',
    },
    '8yibxidf': {
      'en': 'DONE',
      'hi': 'किया हुआ',
    },
    'uf6z36dv': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ReferandEarn1
  {
    'wmdl6anw': {
      'en': 'Refer and Earn',
      'hi': 'देखें और कमाएं',
    },
    '1msdamx0': {
      'en': 'more',
      'hi': 'अधिक',
    },
    'bmixdkj7': {
      'en': '12',
      'hi': '12',
    },
    'b30xqnyu': {
      'en': 'My Refferal',
      'hi': 'मेरा रेफ़रल',
    },
    'rq9qmezx': {
      'en': '₹520',
      'hi': '₹520',
    },
    'exchgjpi': {
      'en': 'Referaal Income',
      'hi': 'रेफ़रल आय',
    },
    'rmnqeg6i': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ReferandEarn2
  {
    'qbyuv0t5': {
      'en': 'Refer and Earn',
      'hi': 'देखें और कमाएं',
    },
    '0hcl9up3': {
      'en': '     My Referral     ',
      'hi': 'मेरा रेफरल',
    },
    'qx3qtqku': {
      'en': '     Referral Income     ',
      'hi': 'रेफरल आय',
    },
    'j6oknz87': {
      'en': 'Search',
      'hi': 'खोज',
    },
    'qtqqh7pe': {
      'en': 'Recent',
      'hi': 'हालिया',
    },
    '0hwc9te1': {
      'en': 'Yash Ganesh Pande',
      'hi': 'यश गणेश पांडे',
    },
    'z01imo98': {
      'en': 'Success',
      'hi': 'सफलता',
    },
    'cjao3nll': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    'xm39bl5z': {
      'en': '+₹360.00',
      'hi': '+₹360.00',
    },
    '0homzzmf': {
      'en': '26 July 2022',
      'hi': '26 जुलाई 2022',
    },
    '0gchs5y4': {
      'en': 'Darshan',
      'hi': 'दर्शन',
    },
    'k6i5962c': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    'freg3ago': {
      'en': '+₹450.00',
      'hi': '+₹450.00',
    },
    'k2mfk0vo': {
      'en': 'Murdhul',
      'hi': 'मुर्धुली',
    },
    'cpblq00z': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    'x7wdikgf': {
      'en': '+₹250.00',
      'hi': '+₹250.00',
    },
    'dl7nrkq0': {
      'en': 'Darshan',
      'hi': 'दर्शन',
    },
    'zi68g554': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    'ddz0pyzq': {
      'en': '+₹100.00',
      'hi': '+₹100.00',
    },
    'wlfdwjs1': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ReferandEarn3
  {
    'm3gv9w5y': {
      'en': 'Refer and Earn',
      'hi': 'देखें और कमाएं',
    },
    'zyd86398': {
      'en': '     My Referral     ',
      'hi': 'मेरा रेफरल',
    },
    'ryjqmxzt': {
      'en': '     Referral Income     ',
      'hi': 'रेफरल आय',
    },
    '4ev7afb2': {
      'en': 'Search',
      'hi': 'खोज',
    },
    'd7l19c48': {
      'en': 'Recent',
      'hi': 'हालिया',
    },
    '8xzcqdgc': {
      'en': 'Saurabh',
      'hi': 'सौरभ',
    },
    '4itv4la9': {
      'en': 'Success',
      'hi': 'सफलता',
    },
    'ja5fyes4': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    'kdxg7bfo': {
      'en': '+₹360.00',
      'hi': '+₹360.00',
    },
    '9bxaidr9': {
      'en': '26 July 2022',
      'hi': '26 जुलाई 2022',
    },
    'scbq06g5': {
      'en': 'Tanish',
      'hi': 'तनिषो',
    },
    '33pe4fz0': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    '5fygdw30': {
      'en': '+₹450.00',
      'hi': '+₹450.00',
    },
    'alecq73l': {
      'en': 'Murdhul',
      'hi': 'मुर्धुली',
    },
    '5vrz1bv5': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    'byhhtgze': {
      'en': '+₹250.00',
      'hi': '+₹250.00',
    },
    'mj5x23l4': {
      'en': 'Kartik',
      'hi': 'कार्तिक',
    },
    'xtszxfub': {
      'en': 'Link',
      'hi': 'संपर्क',
    },
    's7qe45vn': {
      'en': '+₹100.00',
      'hi': '+₹100.00',
    },
    'q276vyc2': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Traning
  {
    'ki0iibc5': {
      'en': 'Button',
      'hi': 'बटन',
    },
    '1iyb49ay': {
      'en': 'Traning',
      'hi': 'ट्रैनिंग',
    },
    'pacorhva': {
      'en': '        Academy        ',
      'hi': 'अकादमी',
    },
    'pn6ybhl6': {
      'en': '        Content        ',
      'hi': 'विषय',
    },
    '0cmk3082': {
      'en': 'Courses',
      'hi': 'पाठ्यक्रम',
    },
    'evl4pgp2': {
      'en': 'Webinar',
      'hi': 'वेबिनार',
    },
    'q2yn7hty': {
      'en': 'more',
      'hi': 'अधिक',
    },
    'y8wkd0ic': {
      'en': 'Recommendation',
      'hi': 'अनुशंसा',
    },
    'ra6b7u8x': {
      'en': '        Academy        ',
      'hi': 'अकादमी',
    },
    '1d6zbqk6': {
      'en': '        Content        ',
      'hi': 'विषय',
    },
    'viff1nb4': {
      'en': 'Categories',
      'hi': 'श्रेणियाँ',
    },
    'egyowpo5': {
      'en': 'Bank',
      'hi': 'बैंक',
    },
    'j8dqce1j': {
      'en': 'Credit',
      'hi': 'श्रेय',
    },
    '6yh7es6t': {
      'en': 'Demat',
      'hi': 'डीमेट',
    },
    '1p4lnvar': {
      'en': 'Greeting',
      'hi': 'शुभकामना',
    },
    'v2ikduv0': {
      'en': 'Trending',
      'hi': 'रुझान',
    },
    '12nbgdl8': {
      'en': 'more',
      'hi': 'अधिक',
    },
    '600igk9d': {
      'en': 'Happy Fathers\nDay',
      'hi': 'पिता दिवस की शुभकामना',
    },
    '9r1sravv': {
      'en': 'Happy Raksha\nBandhan',
      'hi': 'हैप्पी रक्षा बंधन',
    },
    'c7wrhgyj': {
      'en': 'Happy World\nPopulation Da...',
      'hi': 'हैप्पी वर्ल्ड पॉपुलेशन डे...',
    },
    '9h1wl9gz': {
      'en': 'Happy Brothers\nDay',
      'hi': 'हैप्पी ब्रदर्स डे',
    },
    'xyanglvn': {
      'en': 'World Blood\nDonar Day',
      'hi': 'विश्व रक्तदान दिवस',
    },
    'qpliyby5': {
      'en': 'World  Cancer \nDay',
      'hi': 'विश्व कैंसर दिवस',
    },
    '4ym4h40v': {
      'en': 'Latest',
      'hi': 'नवीनतम',
    },
    'vyn3et4u': {
      'en': 'more',
      'hi': 'अधिक',
    },
    '742fma99': {
      'en': 'Happy Fathers\nDay',
      'hi': 'पिता दिवस की शुभकामना',
    },
    'lwwdt334': {
      'en': 'Happy Raksha\nBandhan',
      'hi': 'हैप्पी रक्षा बंधन',
    },
    '6eu7oy2k': {
      'en': 'Happy World\nPopulation Da...',
      'hi': 'हैप्पी वर्ल्ड पॉपुलेशन डे...',
    },
    '2cxdexvf': {
      'en': 'Happy Brothers\nDay',
      'hi': 'हैप्पी ब्रदर्स डे',
    },
    'eoglrhn5': {
      'en': 'World Blood\nDonar Day',
      'hi': 'विश्व रक्तदान दिवस',
    },
    '19ttfifs': {
      'en': 'World  Cancer \nDay',
      'hi': 'विश्व कैंसर दिवस',
    },
    'c4bncskd': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ReferAndEarn
  {
    'm7p7zqll': {
      'en': 'Refer and Earn',
      'hi': 'देखें और कमाएं',
    },
    '61pgkvwe': {
      'en': 'Refer infilate app to your friends and family\nand earn Rewards',
      'hi':
          'अपने दोस्तों और परिवार के लिए इनफिलेट ऐप देखें और पुरस्कार अर्जित करें',
    },
    'pa6ua98p': {
      'en': 'Earn upto ₹500',
      'hi': '₹500 . तक कमाएं',
    },
    'peskllrx': {
      'en': '     My Referral     ',
      'hi': 'मेरा रेफरल',
    },
    'j45f2aea': {
      'en': '     Referral Income     ',
      'hi': 'रेफरल आय',
    },
    '1mwmwnvn': {
      'en': 'Search',
      'hi': 'खोज',
    },
    'w62tyic3': {
      'en': 'Recent',
      'hi': 'हालिया',
    },
    'yha7imun': {
      'en': 'Ramesh',
      'hi': 'रमेश',
    },
    '4kmtu68j': {
      'en': 'Success',
      'hi': 'सफलता',
    },
    'bnqvjcd5': {
      'en': 'by Aiffilate',
      'hi': 'द्वारा एफिलेट',
    },
    'ryqv0ear': {
      'en': '+₹360.00',
      'hi': '+₹360.00',
    },
    'chpizbs1': {
      'en': 'Search',
      'hi': 'खोज',
    },
    'r8elgav1': {
      'en': 'Recent',
      'hi': 'हालिया',
    },
    '329higyc': {
      'en': 'Saurabh',
      'hi': 'सौरभ',
    },
    '27jr3z11': {
      'en': 'Success',
      'hi': 'सफलता',
    },
    'vd1c42dh': {
      'en': 'by Aiffilate',
      'hi': 'द्वारा एफिलेट',
    },
    '78rwi5mh': {
      'en': '+₹360.00',
      'hi': '+₹360.00',
    },
    'a1pq22z6': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // SelectLanguage
  {
    'kklctnid': {
      'en': 'Choose Language',
      'hi': 'भाषा चुनें',
    },
    'l6wqbxfi': {
      'en': 'Verify',
      'hi': 'सत्यापित करना',
    },
  },
  // OTPVerification
  {
    'tefq31ax': {
      'en': 'Verification',
      'hi': 'सत्यापन',
    },
    'ti4sbxuk': {
      'en': 'Enter 6 digit code we sent',
      'hi': 'हमारे द्वारा भेजा गया 6 अंकों का कोड दर्ज करें',
    },
    '8hjv6a0d': {
      'en': ' Resend Code',
      'hi': 'पुन: कोड भेजे',
    },
    '8uoqj9vm': {
      'en': 'Verify',
      'hi': 'सत्यापित करना',
    },
  },
  // CreatePin
  {
    'c59fihfd': {
      'en': 'Create Pin',
      'hi': 'पिन बनाएं',
    },
    'igb03sqe': {
      'en': '1',
      'hi': '1',
    },
    'tc4m9cmq': {
      'en': '7',
      'hi': '7',
    },
    'si90ox0p': {
      'en': '0',
      'hi': '0',
    },
    '85lr8ivq': {
      'en': '3',
      'hi': '3',
    },
    'slnu0kqo': {
      'en': 'Please Create your M-pin for your\nUnique ID INFI0258',
      'hi': 'कृपया अपनी विशिष्ट आईडी INFI0258 के लिए अपना एम-पिन बनाएं',
    },
    'sobxzug7': {
      'en': 'Auto Generate',
      'hi': 'स्वत: उत्पन्न',
    },
    '7zaqnuvu': {
      'en': 'Done',
      'hi': 'पूर्ण',
    },
  },
  // seaa
  {
    '9tcglqs4': {
      'en': 'What is infilate app?',
      'hi': 'इनफिलेट ऐप क्या है?',
    },
    '2ybschfg': {
      'en': 'All new sample questions?',
      'hi': 'सभी नए नमूना प्रश्न?',
    },
    'ic4wimw0': {
      'en': 'What sample question?',
      'hi': 'क्या नमूना प्रश्न?',
    },
    'vht2gav8': {
      'en': 'Why you are here?',
      'hi': 'आप यहाँ क्यों हैं?',
    },
  },
  // Joinus
  {
    '9uvqpj3b': {
      'en': 'Join Us',
      'hi': 'हमसे जुड़ें',
    },
    '6a2tbcqn': {
      'en': 'Website',
      'hi': 'वेबसाइट',
    },
  },
  // Miscellaneous
  {
    '1psho48o': {
      'en': '',
      'hi': '',
    },
    '4se5ze63': {
      'en': '',
      'hi': '',
    },
    'b97cn5mq': {
      'en': '',
      'hi': '',
    },
    'ccrdi3lp': {
      'en': '',
      'hi': '',
    },
    '15kax0ku': {
      'en': '',
      'hi': '',
    },
    '19ixo36y': {
      'en': '',
      'hi': '',
    },
    '594i53g6': {
      'en': '',
      'hi': '',
    },
    '2gav8r3a': {
      'en': '',
      'hi': '',
    },
    '56oj17sd': {
      'en': '',
      'hi': '',
    },
    '1lq1qa1k': {
      'en': '',
      'hi': '',
    },
    'kn2uimxv': {
      'en': '',
      'hi': '',
    },
    't8dsxyn8': {
      'en': '',
      'hi': '',
    },
    'nxp2q794': {
      'en': '',
      'hi': '',
    },
    'rkhdpppi': {
      'en': '',
      'hi': '',
    },
    'qhpssb6h': {
      'en': '',
      'hi': '',
    },
    't48z18se': {
      'en': '',
      'hi': '',
    },
    '88da12nt': {
      'en': '',
      'hi': '',
    },
    'u77gzhx2': {
      'en': '',
      'hi': '',
    },
    '21vac2k0': {
      'en': '',
      'hi': '',
    },
    'v0x70mmm': {
      'en': '',
      'hi': '',
    },
    'bhhhfed7': {
      'en': '',
      'hi': '',
    },
    '4ruu74gu': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
