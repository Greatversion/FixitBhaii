import 'package:logger/logger.dart';


Logger logger(Type type) {
  return Logger(
    printer: PrettyPrinter(
      colors: true ,printEmojis: true,
      noBoxingByDefault: true,
        ), // Custom printer for class name and log formatting
  );
}
// Custom Logger function

// Logger logger(Type type) {
//   return Logger(
//     printer: CustomPrinter(
//         type.toString()), // Custom printer for class name and log formatting
//   );
// }


// class CustomPrinter extends LogPrinter {
//   final String className;

//   CustomPrinter(this.className);

//   @override
//   List<String> log(LogEvent event) {
//     // Colors and emojis based on log level
//     String emoji = '';
//     String color = '';

//     // Define emojis and colors for different log levels
//     switch (event.level) {
//       case Level.debug:
//         emoji = '🐛'; // Bug emoji for debug
//         color = '\x1B[34m'; // Blue
//         break;
//       case Level.info:
//         emoji = 'ℹ️'; // Info emoji
//         color = '\x1B[32m'; // Green
//         break;
//       case Level.warning:
//         emoji = '⚠️'; // Warning emoji
//         color = '\x1B[33m'; // Yellow
//         break;
//       case Level.error:
//         emoji = '❌'; // Error emoji
//         color = '\x1B[31m'; // Red
//         break;

//       default:
//         emoji = '🔒';
//         color = '\x1B[0m'; // Default color (reset)
//     }

//     final message = event.message;
//     final formattedMessage =
//         '${event.time.toString()} $emoji $color$className: $message\x1B[0m'; // Reset color after log

//     return [formattedMessage];
//   }
// }
