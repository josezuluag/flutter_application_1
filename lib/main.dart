import 'package:flutter/material.dart';
import 'register_screen.dart'; // Asegúrate de importar la pantalla de registro
import 'alarm_screen.dart'; // Importa la pantalla de alarma

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: {
        '/register': (context) => RegisterScreen(),
        '/alarm': (context) =>
            AlarmScreen(), // Define la ruta para la pantalla de alarma
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Asigna la clave global al Form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                height: 100,
              ),
              const SizedBox(height: 16),
              const Text(
                'Alarma Comunal\n Domòtica',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  // Añade el validador
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su email';
                  }
                  // Validar si el email tiene el formato correcto
                  String pattern = r'^[^@]+@[^@]+\.[^@]+$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Ingrese un email válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  // Añade el validador
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  // Validar si la contraseña tiene al menos 6 caracteres
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Text('Recuérdame'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('¿Olvidó su contraseña?'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Valida el formulario
                    Navigator.pushNamed(context, '/alarm');
                  }
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Crear cuenta'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Términos y condiciones'),
                  ),
                  Text(' y '),
                  TextButton(
                    onPressed: () {},
                    child: Text('Política de privacidad'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
