class ImagesPath {
  ImagesPath._();

  static const String _splashImageName = 'splash';
  static const String _imageMainFolderPathName = 'images';
  static const String _imgExt = '.png';

  static const String splashImage = 'assets/splash/$_splashImageName$_imgExt';
  static const String emailSent =
      'assets/$_imageMainFolderPathName/email_sent$_imgExt';
  static const String loadingAnimation =
      'assets/$_imageMainFolderPathName/loading.gif';
  static const String defaultProfile =
      'assets/$_imageMainFolderPathName/default_profile.jpg';
}
