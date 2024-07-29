import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @noDate.
  ///
  /// In en, this message translates to:
  /// **'No date'**
  String get noDate;

  /// No description provided for @groups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groups;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @addUser.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get addUser;

  /// No description provided for @userAdded.
  ///
  /// In en, this message translates to:
  /// **'User added'**
  String get userAdded;

  /// No description provided for @userDit.
  ///
  /// In en, this message translates to:
  /// **'User edit'**
  String get userDit;

  /// No description provided for @userEdited.
  ///
  /// In en, this message translates to:
  /// **'User edited'**
  String get userEdited;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @surName.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surName;

  /// No description provided for @postCode.
  ///
  /// In en, this message translates to:
  /// **'Postcode'**
  String get postCode;

  /// No description provided for @pleaseFillPost.
  ///
  /// In en, this message translates to:
  /// **'Fill in the postal code to automatically complete the data'**
  String get pleaseFillPost;

  /// No description provided for @clickToFill.
  ///
  /// In en, this message translates to:
  /// **'Click to complete the data'**
  String get clickToFill;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @hauseNumber.
  ///
  /// In en, this message translates to:
  /// **'House number'**
  String get hauseNumber;

  /// No description provided for @flatNumber.
  ///
  /// In en, this message translates to:
  /// **'Flat number'**
  String get flatNumber;

  /// No description provided for @emailNotValid.
  ///
  /// In en, this message translates to:
  /// **'Email is not valid'**
  String get emailNotValid;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'Email is already in use'**
  String get emailAlreadyInUse;

  /// No description provided for @cantBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'This field can\'t be empty'**
  String get cantBeEmpty;

  /// No description provided for @formCantBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'The field can\'t be empty'**
  String get formCantBeEmpty;

  /// No description provided for @formToLong.
  ///
  /// In en, this message translates to:
  /// **'The field can\'t have more than 255 characters'**
  String get formToLong;

  /// No description provided for @formToShort8.
  ///
  /// In en, this message translates to:
  /// **'The field must have at least 8 characters'**
  String get formToShort8;

  /// No description provided for @formToShort3.
  ///
  /// In en, this message translates to:
  /// **'The field must have at least 3 characters'**
  String get formToShort3;

  /// No description provided for @formOnlyNumber.
  ///
  /// In en, this message translates to:
  /// **'The field can only contain numbers'**
  String get formOnlyNumber;

  /// No description provided for @formWronPostCode.
  ///
  /// In en, this message translates to:
  /// **'The field must be a valid postcode'**
  String get formWronPostCode;

  /// No description provided for @formWhiteSpace.
  ///
  /// In en, this message translates to:
  /// **'The field cannot start or end with a space'**
  String get formWhiteSpace;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @returnToLogin.
  ///
  /// In en, this message translates to:
  /// **'Return to Login'**
  String get returnToLogin;

  /// No description provided for @driftError.
  ///
  /// In en, this message translates to:
  /// **'Error writing to database, please contact the administrator'**
  String get driftError;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred, please try again later or contact the administrator'**
  String get unknownError;

  /// No description provided for @noUsers.
  ///
  /// In en, this message translates to:
  /// **'No users found, please add new'**
  String get noUsers;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @addGroup.
  ///
  /// In en, this message translates to:
  /// **'Add group'**
  String get addGroup;

  /// No description provided for @groupName.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get groupName;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @usersAddedToGroup.
  ///
  /// In en, this message translates to:
  /// **'Users added to group'**
  String get usersAddedToGroup;

  /// No description provided for @addUsersToGroup.
  ///
  /// In en, this message translates to:
  /// **'Add users to group'**
  String get addUsersToGroup;

  /// No description provided for @pleaseSelectAtLeastOneUser.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one user'**
  String get pleaseSelectAtLeastOneUser;

  /// No description provided for @noUsersSelected.
  ///
  /// In en, this message translates to:
  /// **'No users selected'**
  String get noUsersSelected;

  /// No description provided for @usersSelectedToAssignGroup.
  ///
  /// In en, this message translates to:
  /// **'Users selected to assign group'**
  String get usersSelectedToAssignGroup;

  /// No description provided for @usersDoAssignGroup.
  ///
  /// In en, this message translates to:
  /// **'Users to assign group'**
  String get usersDoAssignGroup;

  /// No description provided for @numberOfUsers.
  ///
  /// In en, this message translates to:
  /// **'Number of users'**
  String get numberOfUsers;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @houseNumber.
  ///
  /// In en, this message translates to:
  /// **'House Number'**
  String get houseNumber;

  /// No description provided for @removeUsers.
  ///
  /// In en, this message translates to:
  /// **'Remove users'**
  String get removeUsers;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @removeSelectedUsers.
  ///
  /// In en, this message translates to:
  /// **'Remove selected users'**
  String get removeSelectedUsers;

  /// No description provided for @usersRemoved.
  ///
  /// In en, this message translates to:
  /// **'Users removed'**
  String get usersRemoved;

  /// No description provided for @confirmRemoveSelectedUsers.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove the selected users?'**
  String get confirmRemoveSelectedUsers;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @areYouSureDeleteUser.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this user?'**
  String get areYouSureDeleteUser;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @noGroups.
  ///
  /// In en, this message translates to:
  /// **'No groups found, please add new'**
  String get noGroups;

  /// No description provided for @removeGroups.
  ///
  /// In en, this message translates to:
  /// **'Remove groups'**
  String get removeGroups;

  /// No description provided for @toManyAttempts.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts, try again later'**
  String get toManyAttempts;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @setColorMode.
  ///
  /// In en, this message translates to:
  /// **'Set color mode'**
  String get setColorMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkMode;

  /// No description provided for @systemMode.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemMode;

  /// No description provided for @setThemeMode.
  ///
  /// In en, this message translates to:
  /// **'Set theme'**
  String get setThemeMode;

  /// No description provided for @mustContainOneNumber.
  ///
  /// In en, this message translates to:
  /// **'The number must contain at least one number'**
  String get mustContainOneNumber;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pl': return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
