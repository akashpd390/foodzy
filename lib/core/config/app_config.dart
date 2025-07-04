class AppConfig {
  static const String headerImage = 'assets/header_image.jpg';
  static const String categoryBaseUrl =
      'https://deligo.vtlabs.dev/api/categories?meta%5Bvendor_type%5D=food&pagination=0';

  static const String vendorsBaseUrl =
      'https://deligo.vtlabs.dev/api/vendors/list?lat=28.7040592&long=77.10249019999999&meta%5Bvendor_type%5D=food&page=1&per_page=15';

  static const String sandwhitchBaseUrl =
      "https://deligo.vtlabs.dev/api/products?category=35&page=1&per_page=15&vendor=";
  static const String burgerBaseUrl =
      "https://deligo.vtlabs.dev/api/products?category=36&page=1&per_page=15&vendor=";
  static const String pizzaBaseUrl =
      "https://deligo.vtlabs.dev/api/products?category=38&page=1&per_page=15&vendor=";
}
