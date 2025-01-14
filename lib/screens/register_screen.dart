import 'package:flutter/material.dart';
import 'login_screen.dart'; // Giriş ekranına yönlendirmek için

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Ol'),
        backgroundColor: const Color(0xFFD4A373), // Yemek uygulamasına uygun renk
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Ekran küçükse kaydırmak için
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Kayıt Ol',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4A373), // Renk uyumu
                ),
              ),
              const SizedBox(height: 30),

              // E-posta TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'E-posta',
                  labelStyle: const TextStyle(color: Color(0xFFD4A373)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFD4A373)),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Şifre TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: const TextStyle(color: Color(0xFFD4A373)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFD4A373)),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 40),

              // Kayıt Ol Butonu
              ElevatedButton(
                onPressed: () {
                  // Kayıt işlemi yapılacak alan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8D8741), // Buton rengi
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Kayıt Ol',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),

              // Giriş Yap Butonu
              TextButton(
                onPressed: () {
                  // Giriş ekranına yönlendir
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text(
                  'Zaten bir hesabınız var mı? Giriş yap',
                  style: TextStyle(fontSize: 16, color: Color(0xFFD4A373)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
