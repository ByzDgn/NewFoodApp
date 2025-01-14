import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Lottie animasyonları için
import 'login_screen.dart'; // Giriş ekranına yönlendirecek
import 'register_screen.dart'; // Kayıt ekranına yönlendirecek

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Giriş ekranına yönlendirme
  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  // Kayıt ekranına yönlendirme
  void navigateToRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.png'), // Arka plan resmini burada ekliyoruz
            fit: BoxFit.cover, // Resmi ekranın tamamına yayacak şekilde ayarlıyoruz
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3), // Resmi soluklaştırıyoruz, yazıların görünmesini sağlar
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Uygulama Başlığı
              const Text(
                '🍴 FoodApp',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20), // Başlık ile animasyon arasındaki boşluk

              // Lottie animasyonu
              Lottie.asset(
                'assets/animations/animation.json', // Animasyon dosyasını buraya ekleyin
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 40), // Animasyon ile butonlar arasında boşluk

              // Giriş Yap Butonu
              ElevatedButton(
                onPressed: navigateToLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF66BB6A),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Giriş yap ve kayıt ol butonları arasındaki boşluk

              // Kayıt Ol Butonu
              ElevatedButton(
                onPressed: navigateToRegister,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF42A5F5),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Kayıt Ol',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
