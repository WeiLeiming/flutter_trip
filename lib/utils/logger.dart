import 'package:logger/logger.dart' as VLogger;

var logger = VLogger.Logger(
  printer: VLogger.PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: false,
    printEmojis: true,
    printTime: true,
  ),
);

class Logger {
  /// Log a message at level [Level.verbose].
  static void verbose(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void debug(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  static void info(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void warning(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  static void error(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  static void wtf(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.wtf(message, error, stackTrace);
  }
}
