import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  static const String url = "https://pkhzxrwokiicopclwmdn.supabase.co";
  static const String apiKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBraHp4cndva2lpY29wY2x3bWRuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMwMzgxOTksImV4cCI6MjA4ODYxNDE5OX0.jwMnavwH2HrGTofpFouVqOCGLz0TulJcMKt6U1961qc";

  static Future<void> init() async {
    await Supabase.initialize(url: url, anonKey: apiKey);
  }
}
