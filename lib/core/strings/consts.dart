String? TOKEN ;
String? invitationCode ;
const BASE_URL = '192.168.1.3:8000';

const String VALIDATION_EMAIL =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String VALIDATION_UPPERCASE_PASSWORD = r'^(?=.*?[A-Z])';

const String VALIDATION_LOWER_CASE_PASSWORD = r'^(?=.*?[a-z])';
const String VALIDATION_DIGIT_PASSWORD = r'^(?=.*?[0-9])';
const String VALIDAT_SPECIAL_CHARACTER_PASSWORD = r'^(?=.*?[!@#\$&*~])';
