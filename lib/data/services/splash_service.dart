class SplashService {
  Future<void> startDelay() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
  }
}