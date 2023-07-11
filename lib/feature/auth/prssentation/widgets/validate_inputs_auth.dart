String? validateEmail(val) {
  if (val.toString().contains('@gmail.com')) {
    return null;
  } else {
    return 'Please enter valid e-mail';
  }
}
String? validatePassword(val) {
  if (val.toString().length > 5) {
    return null;
  } else {
    return 'Must length password large 5 characters';
  }
}
String? validateName(val) {
  if (val.toString().length > 5) {
    return null;
  } else {
    return 'Must name large 5 characters';
  }
}