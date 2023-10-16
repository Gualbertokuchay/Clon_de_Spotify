// Ejemplo de pantallas de perfil y configuración
import 'package:flutter/material.dart';

class MiPerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Mi Perfil'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Centra todo el contenido verticalmente
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Centra todo el contenido horizontalmente
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                      'assets/Perfil.png'), // Agrega la imagen de perfil aquí
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Centra horizontalmente los elementos en la fila
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 24, // Tamaño del icono de usuario
                      color: Colors.blue, // Color del icono de usuario
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Nombre de Usuario',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Correo Electrónico: usuario@example.com', // Agrega el correo electrónico real del usuario
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Agrega la lógica para editar el perfil
                  },
                  child: Text('Editar Perfil'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Canciones Favoritas'),
                  onTap: () {
                    // Agrega la lógica para ver las canciones favoritas
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.playlist_add),
                  title: Text('Listas de Reproducción'),
                  onTap: () {
                    // Agrega la lógica para ver las listas de reproducción
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Historial de Escucha'),
                  onTap: () {
                    // Agrega la lógica para ver el historial de escucha
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Configuración de la Cuenta'),
                  onTap: () {
                    // Agrega la lógica para ver/editar la configuración de la cuenta
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Cerrar Sesión'),
                  onTap: () {
                    // Agrega la lógica para cerrar sesión
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class ConfiguracionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Configuración'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración de la Cuenta',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificaciones'),
              trailing: Switch(
                value: true, // Puedes ajustar el valor según el estado actual
                onChanged: (bool value) {
                  // Agrega la lógica para activar/desactivar notificaciones
                },
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Idioma'),
              trailing: Text('Español'), // Muestra el idioma actual del usuario
              onTap: () {
                // Agrega la lógica para cambiar el idioma
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Seguridad'),
              onTap: () {
                // Navega a la pantalla de configuración de seguridad
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeguridadScreen(),
                  ),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class SeguridadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración de Seguridad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración de Seguridad',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Cambiar Contraseña'),
              onTap: () {
                // Navega a la pantalla de cambio de contraseña
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CambioContrasenaScreen(),
                  ),
                );
              },
            ),
            Divider(),
            // Agrega más opciones de seguridad aquí
          ],
        ),
      ),
    );
  }
}

class CambioContrasenaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cambiar Contraseña',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Contraseña Actual'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nueva Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Confirmar Nueva Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Agrega la lógica para cambiar la contraseña
              },
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
