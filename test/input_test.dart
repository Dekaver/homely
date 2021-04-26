import 'package:flutter_test/flutter_test.dart';
import 'package:homely/components/rounded_email_field.dart';

void main() {
  test('empty email return eror strign', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Email can\'t be Empty');
  });

  test('non-empty email return null', () {
    var result = EmailFieldValidator.validate('tes@gmail.com');
    expect(result, null);
  });
}
