import 'package:flutter/material.dart';
import 'main.dart'; // Asegúrate de importar el archivo main.dart para la navegación
import 'alarm_control.dart'; // Importa la clase AlarmControl

class AlarmScreen extends StatelessWidget {
  final AlarmControl alarmControl = AlarmControl(
    onUrl:
        'https://us-apia.coolkit.cc/v2/smartscene2/webhooks/execute?id=207e5266a6314fcfbac2feb41d5d2284', // Reemplaza con tu URL para activar la alarma
    offUrl:
        'https://us-apia.coolkit.cc/v2/smartscene2/webhooks/execute?id=a9d425deaef04640802fe7e9a124d8fb', // Reemplaza con tu URL para desactivar la alarma
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarma comunitaria\n edificio prueba 1'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              height: 100,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Lógica para activar la alarma
                alarmControl.activateAlarm();
              },
              child: const Text('ENCENDER ALARMA'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                alarmControl.deactivateAlarm();
                // Lógica para desactivar la alarma
              },
              child: const Text('APAGAR ALARMA'),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.notifications, size: 30),
                SizedBox(width: 10),
                Text(
                  'Notificaciónes',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
