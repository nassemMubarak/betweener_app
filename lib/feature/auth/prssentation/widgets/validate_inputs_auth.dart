String? validateEmail(val) {
  if (val.toString().contains('@gmail.com') && val.toString().length > 11) {
    return null;
  } else {
    return 'Please enter valid e-mail';
  }
}
String? validatePassword(val) {
  if (val.toString().length > 8) {
    return null;
  } else {
    return 'Must length password large 8 characters';
  }
}
String? validateName(val) {
  if (val.toString().length > 8) {
    return null;
  } else {
    return 'Must name large 8 characters';
  }
}