import 'package:http/http.dart' as http;

class AlarmControl {
  final String onUrl;
  final String offUrl;

  AlarmControl({required this.onUrl, required this.offUrl});

  Future<void> activateAlarm() async {
    try {
      final response = await http.get(Uri.parse(onUrl));
      if (response.statusCode == 200) {
        print('Alarma activada');
      } else {
        print('Error al activar la alarma: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al activar la alarma: $e');
    }
  }

  Future<void> deactivateAlarm() async {
    try {
      final response = await http.get(Uri.parse(offUrl));
      if (response.statusCode == 200) {
        print('Alarma desactivada');
      } else {
        print('Error al desactivar la alarma: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al desactivar la alarma: $e');
    }
  }
}
