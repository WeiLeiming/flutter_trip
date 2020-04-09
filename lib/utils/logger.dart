import 'package:logger/logger.dart' as VLogger;

class Logger {
  static var _logger = VLogger.Logger(
    printer: VLogger.PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: false,
      printEmojis: true,
      printTime: true,
    ),
  );

  /// Log a message at level [Level.verbose].
  static void verbose(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void debug(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  static void info(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void warning(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  static void error(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  static void wtf(dynamic message, [dynamic error, StackTrace stackTrace]) {
    _logger.wtf(message, error, stackTrace);
  }
}
