import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  SupabaseClient supabase = Supabase.instance.client;

  Future<Either<String, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final rep = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return right(rep);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, dynamic>> signUp({
  required String email,
  required String password,
  required String name,
}) async {
  try {
    final authResponse = await supabase.auth.signUp(
      email: email, 
      password: password,
      data: {'full_name': name}, 
    );
    
    if (authResponse.user != null) {
      // حفظ البيانات في الجدول
      final saveResult = await saveUserData(
        name: name, 
        email: email, 
        userId: authResponse.user!.id,
      );
      
      return saveResult.fold(
        (error) => left("تم إنشاء الحساب ولكن فشل حفظ البيانات: $error"),
        (_) => right(authResponse),
      );
    }
    return left("حدث خطأ ما، المستخدم غير موجود");
  } on AuthException catch (e) {
    return left(e.message);
  } catch (e) {
    return left(e.toString());
  }
}

  Future<Either<String, void>> saveUserData({
    required String name,
    required String email,
    required String userId,
  }) async {
    try {
      final res = await supabase.from("users").insert({
        "id": userId,
        "name": name,
        "email": email,
      });
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
