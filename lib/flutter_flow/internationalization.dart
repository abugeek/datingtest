import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ru', 'es', 'fr', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ruText = '',
    String? esText = '',
    String? frText = '',
    String? deText = '',
  }) =>
      [enText, ruText, esText, frText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home
  {
    '5c0ej8x7': {
      'en': 'Location',
      'de': 'Standort',
      'es': 'Ubicación',
      'fr': 'Emplacement',
      'ru': 'Расположение',
    },
    'utjzn3s2': {
      'en': 'London',
      'de': 'London',
      'es': 'Londres',
      'fr': 'Londres',
      'ru': 'Лондон',
    },
    '4squntd0': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
    },
  },
  // onboarding
  {
    'uw63ma8f': {
      'en': 'Find your partner with us',
      'de': 'Finden Sie Ihren Partner bei uns',
      'es': 'Encuentra a tu pareja con nosotros',
      'fr': 'Trouvez votre partenaire avec nous',
      'ru': 'Найдите своего партнера у нас',
    },
    'ummqvm6k': {
      'en': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
      'de': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
      'es': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
      'fr': 'Amet minim mollit non désertant sit aliqua dolor do amet sint.',
      'ru': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
    },
    'wg6ursos': {
      'en': 'Dating better than ever before',
      'de': 'Dating besser als je zuvor',
      'es': 'Las citas son mejores que nunca',
      'fr': 'Les rencontres sont meilleures que jamais',
      'ru': 'Знакомства лучше, чем когда-либо прежде',
    },
    'aw5zhtvf': {
      'en': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
      'de': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
      'es': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
      'fr': 'Amet minim mollit non désertant sit aliqua dolor do amet sint.',
      'ru': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
    },
    'ax8wbgg8': {
      'en': 'Find your perfect match',
      'de': 'Finden Sie Ihren perfekten Partner',
      'es': 'Encuentra tu pareja perfecta',
      'fr': 'Trouvez votre partenaire idéal',
      'ru': 'Найдите свою идеальную пару',
    },
    '39ra9bjv': {
      'en': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
      'de': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
      'es': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
      'fr': 'Amet minim mollit non désertant sit aliqua dolor do amet sint.',
      'ru': 'Amet minim mollit non deserunt sit aliqua dolor do amet sint.',
    },
    '03xbmjgo': {
      'en': 'Next',
      'de': 'Nächste',
      'es': 'Próximo',
      'fr': 'Suivant',
      'ru': 'Следующий',
    },
    '7kqzs5co': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
    },
  },
  // login
  {
    '51m22c74': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'ru': 'Войти',
    },
    'xhe8xx9b': {
      'en': 'Use the account below to sign in.',
      'de': 'Verwenden Sie zum Anmelden das unten stehende Konto.',
      'es': 'Utilice la cuenta a continuación para iniciar sesión.',
      'fr': 'Utilisez le compte ci-dessous pour vous connecter.',
      'ru': 'Для входа используйте указанную ниже учетную запись.',
    },
    't0a7v9vn': {
      'en': 'Email',
      'de': 'E-Mail',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'ru': 'Электронная почта',
    },
    'yhcfpw4k': {
      'en': '',
      'de': 'Textfeld',
      'es': 'Campo de texto',
      'fr': 'Champ de texte',
      'ru': 'Текстовое поле',
    },
    'z2hc64lg': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'ru': 'Пароль',
    },
    'ho65amb2': {
      'en': '',
      'de': 'Textfeld',
      'es': 'Campo de texto',
      'fr': 'Champ de texte',
      'ru': 'Текстовое поле',
    },
    'gef5wimk': {
      'en': 'Sign in',
      'de': 'anmelden',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'ru': 'Войти',
    },
    'jho9s95s': {
      'en': 'Or sign up with',
      'de': 'Oder registrieren Sie sich mit',
      'es': 'O regístrate con',
      'fr': 'Ou inscrivez-vous avec',
      'ru': 'Или зарегистрируйтесь с помощью',
    },
    'x64bnms3': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
      'ru': 'Продолжить с Google',
    },
    '5x768t2z': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
      'ru': 'Продолжить с Apple',
    },
    'a728gczu': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
    },
  },
  // edit_profile
  {
    'yys80dkz': {
      'en': 'Add Profile Details',
      'de': 'Profildetails hinzufügen',
      'es': 'Agregar detalles del perfil',
      'fr': 'Ajouter les détails du profil',
      'ru': 'Добавить данные профиля',
    },
    'tu2q0u6j': {
      'en': 'Please add your profile details here',
      'de': 'Bitte fügen Sie hier Ihre Profildetails hinzu',
      'es': 'Añade los detalles de tu perfil aquí',
      'fr': 'Veuillez ajouter les détails de votre profil ici',
      'ru': 'Пожалуйста, добавьте данные вашего профиля здесь',
    },
    'clghe221': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'ru': 'Имя',
    },
    '7ww5q6wb': {
      'en': 'Email',
      'de': 'E-Mail',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'ru': 'Электронная почта',
    },
    'la2h0zvx': {
      'en': 'Mobile Number',
      'de': 'Handynummer',
      'es': 'Número de teléfono móvil',
      'fr': 'Numéro de portable',
      'ru': 'Номер мобильного телефона',
    },
    'evyomx7u': {
      'en': 'Address',
      'de': 'Adresse',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
      'ru': 'Адрес',
    },
    'cpx11gyp': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'ru': 'Продолжать',
    },
    'xe8p3cfm': {
      'en': ' ',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'xw1irar3': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
    },
  },
  // select_gender
  {
    '72ytaipm': {
      'en': 'Select Gender',
      'de': 'Geschlecht auswählen',
      'es': 'Seleccione género',
      'fr': 'Sélectionnez le sexe',
      'ru': 'Выберите пол',
    },
    'ggnfzjae': {
      'en': 'Please select your gender',
      'de': 'Bitte wählen Sie Ihr Geschlecht',
      'es': 'Por favor seleccione su género',
      'fr': 'Veuillez sélectionner votre sexe',
      'ru': 'Пожалуйста, выберите ваш пол',
    },
    'ih27t18n': {
      'en': 'Male',
      'de': 'Männlich',
      'es': 'Masculino',
      'fr': 'Mâle',
      'ru': 'Мужской',
    },
    '0p3pyg35': {
      'en': 'Female',
      'de': 'Weiblich',
      'es': 'Femenino',
      'fr': 'Femelle',
      'ru': 'Женский',
    },
    'i0bpcek5': {
      'en': 'Non-binary',
      'de': 'Nicht-binär',
      'es': 'No binario',
      'fr': 'Non binaire',
      'ru': 'Небинарный',
    },
    '2ifyxtyq': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'ru': 'Продолжать',
    },
    '0crvx1l2': {
      'en': ' ',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'fueruwbv': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
    },
  },
  // select_interests
  {
    'nnje1eph': {
      'en': 'Select your Interest',
      'de': 'Wählen Sie Ihr Interesse',
      'es': 'Seleccione su interés',
      'fr': 'Sélectionnez votre intérêt',
      'ru': 'Выберите свой интерес',
    },
    'c5gl68qb': {
      'en':
          'Please a few of your interest to match with users who have similar things in common.',
      'de':
          'Geben Sie einige Ihrer Interessen an, um sie mit Benutzern abzugleichen, die ähnliche Dinge gemeinsam haben.',
      'es':
          'Por favor, comparta algunos de sus intereses para que coincidan con usuarios que tengan cosas similares en común.',
      'fr':
          'S\'il vous plaît, montrez-nous votre intérêt pour correspondre avec des utilisateurs qui ont des points communs.',
      'ru':
          'Пожалуйста, сопоставьте несколько своих интересов с пользователями, у которых есть похожие общие интересы.',
    },
    'tgcyao1a': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'ru': 'Продолжать',
    },
    'm3hgk6b6': {
      'en': ' ',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'srg7zegb': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
    },
  },
  // chat_2_main
  {
    'zeyhtcnq': {
      'en': 'Below are your chats',
      'de': 'Unten sind Ihre Chats',
      'es': 'A continuación se muestran sus chats',
      'fr': 'Vous trouverez ci-dessous vos discussions',
      'ru': 'Ниже приведены ваши чаты',
    },
    'bhcnp2md': {
      'en': 'Randy Mcdonald',
      'de': 'Randy Mcdonald',
      'es': 'Randy Mcdonald',
      'fr': 'Randy McDonald',
      'ru': 'Рэнди Макдональд',
    },
    'eq798xf5': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'de':
          'Das war wirklich toll, ich bin so froh, dass wir uns dieses Wochenende treffen konnten.',
      'es':
          'Esto fue realmente genial, estoy muy contento de que pudiéramos ponernos al día este fin de semana.',
      'fr':
          'C\'était vraiment super, je suis si heureux que nous ayons pu nous rattraper ce week-end.',
      'ru':
          'Это было действительно здорово, я так рад, что мы смогли встретиться в эти выходные.',
    },
    'r95a4fgb': {
      'en': 'Mon. July 3rd - 4:12pm',
      'de': 'Mo. 3. Juli – 16:12 Uhr',
      'es': 'Lunes 3 de julio - 16:12 h',
      'fr': 'Lundi 3 juillet - 16h12',
      'ru': 'Пн. 3 июля - 16:12',
    },
    'll0riy8f': {
      'en': 'My Chats',
      'de': 'Meine Chats',
      'es': 'Mis chats',
      'fr': 'Mes conversations',
      'ru': 'Мои чаты',
    },
    '4e9eq047': {
      'en': 'Chat',
      'de': 'Chat',
      'es': 'Charlar',
      'fr': 'Chat',
      'ru': 'Чат',
    },
  },
  // favorite
  {
    'mujas8il': {
      'en': 'My Favorite',
      'de': 'Mein Favorit',
      'es': 'Mi favorito',
      'fr': 'Mon préféré',
      'ru': 'Мой любимый',
    },
    'oyv7yuxw': {
      'en': 'Favorite',
      'de': 'Favorit',
      'es': 'Favorito',
      'fr': 'Préféré',
      'ru': 'Любимый',
    },
  },
  // notifications
  {
    '0fu0hg8j': {
      'en': 'Ketty like your photo',
      'de': 'Ketty, gefällt dein Foto',
      'es': 'A Ketty le gusta tu foto',
      'fr': 'Ketty aime ta photo',
      'ru': 'Кетти нравится твоя фотография',
    },
    'x6bvyh2a': {
      'en': 'Mar 8, 2022',
      'de': '8. März 2022',
      'es': '8 de marzo de 2022',
      'fr': '8 mars 2022',
      'ru': '8 марта 2022 г.',
    },
    'bc80vnxl': {
      'en': 'Notifications',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
      'fr': 'Notifications',
      'ru': 'Уведомления',
    },
    'd9abes6b': {
      'en': 'Notifications',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
      'fr': 'Notifications',
      'ru': 'Уведомления',
    },
  },
  // profile
  {
    'ymu7av9g': {
      'en': 'Personal Detail',
      'de': 'Persönliche Details',
      'es': 'Detalle personal',
      'fr': 'Détails personnels',
      'ru': 'Личная информация',
    },
    '434adhr3': {
      'en': 'Premium',
      'de': 'Prämie',
      'es': 'De primera calidad',
      'fr': 'Prime',
      'ru': 'Премиум',
    },
    'g08tki5w': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'es': 'Mi perfil',
      'fr': 'Mon profil',
      'ru': 'Мой профиль',
    },
    'xkwmtl31': {
      'en': 'Profile',
      'de': 'Profil',
      'es': 'Perfil',
      'fr': 'Profil',
      'ru': 'Профиль',
    },
  },
  // subscription
  {
    'wds36ey7': {
      'en': 'Subscription / Payment',
      'de': 'Abonnement / Zahlung',
      'es': 'Suscripción / Pago',
      'fr': 'Abonnement / Paiement',
      'ru': 'Подписка/Оплата',
    },
    '253kpv5i': {
      'en': 'Your Subscription',
      'de': 'Ihr Abonnement',
      'es': 'Su suscripción',
      'fr': 'Votre abonnement',
      'ru': 'Ваша подписка',
    },
    'jk7cwgdw': {
      'en': 'Monthly',
      'de': 'Monatlich',
      'es': 'Mensual',
      'fr': 'Mensuel',
      'ru': 'Ежемесячно',
    },
    '6bqzr1vg': {
      'en': '\$15.99/mo',
      'de': '15,99 \$/Monat',
      'es': '\$15,99/mes',
      'fr': '15,99 \$/mois',
      'ru': '15,99 долл. США/мес.',
    },
    'rpivhnwv': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'de':
          'Erhalten Sie unbegrenzten Zugriff auf alle Inhalte, die wir anbieten!',
      'es':
          '¡Obtén acceso ilimitado a todo el contenido que tenemos para ofrecerte!',
      'fr':
          'Obtenez un accès illimité à tout le contenu que nous avons à offrir !',
      'ru':
          'Получите неограниченный доступ ко всему предлагаемому нами контенту!',
    },
    '3q7t59mb': {
      'en': 'Other Offers',
      'de': 'Andere Angebote',
      'es': 'Otras ofertas',
      'fr': 'Autres offres',
      'ru': 'Другие предложения',
    },
    'zydqm0ob': {
      'en': 'Annual (save \$12)',
      'de': 'Jährlich (12 \$ sparen)',
      'es': 'Anual (ahorra \$12)',
      'fr': 'Annuel (économisez 12 \$)',
      'ru': 'Ежегодно (экономьте 12 долларов)',
    },
    'eyws6pw4': {
      'en': '\$180/yr',
      'de': '180 \$/Jahr',
      'es': '\$180/año',
      'fr': '180\$/an',
      'ru': '180 долл. США/год',
    },
    'eukee2x3': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'de':
          'Erhalten Sie unbegrenzten Zugriff auf alle Inhalte, die wir anbieten!',
      'es':
          '¡Obtén acceso ilimitado a todo el contenido que tenemos para ofrecerte!',
      'fr':
          'Obtenez un accès illimité à tout le contenu que nous avons à offrir !',
      'ru':
          'Получите неограниченный доступ ко всему предлагаемому нами контенту!',
    },
    'qz20r79p': {
      'en': 'Free Limited Access',
      'de': 'Kostenloser, eingeschränkter Zugriff',
      'es': 'Acceso gratuito limitado',
      'fr': 'Accès limité gratuit',
      'ru': 'Бесплатный ограниченный доступ',
    },
    'k5yr9888': {
      'en':
          'Continue with limited access at no cost. Browse blogs and videos aimed to help you in your journey!',
      'de':
          'Fahren Sie mit eingeschränktem Zugriff kostenlos fort. Durchsuchen Sie Blogs und Videos, die Ihnen auf Ihrer Reise helfen sollen!',
      'es':
          'Continúa con acceso limitado y gratuito. ¡Explora blogs y videos que te ayudarán en tu camino!',
      'fr':
          'Continuez avec un accès limité et gratuit. Parcourez les blogs et vidéos destinés à vous aider dans votre parcours !',
      'ru':
          'Продолжайте с ограниченным доступом бесплатно. Просматривайте блоги и видео, которые помогут вам в вашем путешествии!',
    },
    '41r5uxal': {
      'en': 'Get plan',
      'de': 'Plan abrufen',
      'es': 'Obtener plan',
      'fr': 'Obtenir un plan',
      'ru': 'Получить план',
    },
    'qxy1pe1m': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
    },
  },
  // bottom_filter_matching
  {
    'hrx2d41l': {
      'en': 'Filter',
      'de': 'Filter',
      'es': 'Filtrar',
      'fr': 'Filtre',
      'ru': 'Фильтр',
    },
    'pnc7ro06': {
      'en': 'Distance',
      'de': 'Distanz',
      'es': 'Distancia',
      'fr': 'Distance',
      'ru': 'Расстояние',
    },
    'saukvpqo': {
      'en': 'Age',
      'de': 'Alter',
      'es': 'Edad',
      'fr': 'Âge',
      'ru': 'Возраст',
    },
    'ljzpa1j7': {
      'en': 'Male',
      'de': 'Männlich',
      'es': 'Masculino',
      'fr': 'Mâle',
      'ru': 'Мужской',
    },
    'nu8o2oiy': {
      'en': 'Female',
      'de': 'Weiblich',
      'es': 'Femenino',
      'fr': 'Femelle',
      'ru': 'Женский',
    },
    'c0r297fm': {
      'en': 'Non-binary',
      'de': 'Nicht-binär',
      'es': 'No binario',
      'fr': 'Non binaire',
      'ru': 'Небинарный',
    },
    'xuwe103l': {
      'en': 'Clear All',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    '52nrut45': {
      'en': 'Apply',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
  },
  // Miscellaneous
  {
    'm1a2vdz2': {
      'en': 'TextField',
      'de': 'Textfeld',
      'es': 'Campo de texto',
      'fr': 'Champ de texte',
      'ru': 'Текстовое поле',
    },
    'tht9szmk': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'yauudq7k': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'aggx3ni9': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'usk33fcr': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    '5qlbctbz': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'hobe43i6': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'a206gxd0': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'rtmbouvq': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'p2skrtwu': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    '9xe3gd9v': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'edg1if33': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    '94nv42cg': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'qr6tti3m': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'igldnjwn': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'g8y3pgzw': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    '26hda90g': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'hpo8pfkw': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'm1kh9vya': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    '7m3f2ijt': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'e92khw5k': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'zow1a44z': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'gdrlmuiz': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'z19zf0w3': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'xpb0oyk0': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'ir1t8zw7': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    'q5oi1ies': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
    '53qccpo7': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'ru': '',
    },
  },
].reduce((a, b) => a..addAll(b));
