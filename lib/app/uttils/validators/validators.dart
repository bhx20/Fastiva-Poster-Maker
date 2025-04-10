import 'package:form_field_validator/form_field_validator.dart';

class Validators {
  static final requiredValidator = RequiredValidator(errorText: "this field is required");
  static final addressValidator = RequiredValidator(errorText: "address is required");

  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);

  static final emailValidator = MultiValidator(
      [RequiredValidator(errorText: 'email is required'), EmailValidator(errorText: 'enter a valid email address')]);

  static final numberValidator = MultiValidator([
    RequiredValidator(errorText: 'number is required'),
    PatternValidator(r'^[6-9]\d{9}$', errorText: 'enter a valid mobile number')
  ]);

  static final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'name is required'),
    PatternValidator("^[A-Za-z\\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}\$", errorText: 'enter a valid name')
  ]);
}
