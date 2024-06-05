import 'package:flutter/material.dart';
import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';
import 'package:shared_preferences/shared_preferences.dart';

void openConnection() async {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  // Your connection string
  final connectionString = env['DBConnectionString']!;

  // Parse the connection string
  final uri = Uri.parse(connectionString);

  final username = uri.userInfo.split(':')[0];
  final password = uri.userInfo.split(':')[1];
  final host = uri.host;
  final port = uri.port;
  final database = uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : 'database';

// Create a connection
  final connection = PostgreSQLConnection(
    host,
    port,
    database,
    username: username,
    password: password,
    useSSL: uri.queryParameters['sslmode'] == 'require', // Check for SSL mode
  );

  // Open the connection
  await connection.open();
}

void closeConnection() async {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  // Your connection string
  final connectionString = env['DBConnectionString']!;

  // Parse the connection string
  final uri = Uri.parse(connectionString);
  final username = uri.userInfo.split(':')[0];
  final password = uri.userInfo.split(':')[1];
  final host = uri.host;
  final port = uri.port;
  final database = uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : 'database';
// Create a connection
  final connection = PostgreSQLConnection(
    host,
    port,
    database,
    username: username,
    password: password,
    useSSL: uri.queryParameters['sslmode'] == 'require', // Check for SSL mode
  );
  // Close the connection
  await connection.close();
}

queryDB(query) async {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  // Your connection string
  final connectionString = env['DBConnectionString']!;

  // Parse the connection string
  final uri = Uri.parse(connectionString);

  final username = uri.userInfo.split(':')[0];
  final password = uri.userInfo.split(':')[1];
  final host = uri.host;
  final port = uri.port;
  final database = uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : 'database';

// Create a connection
  final connection = PostgreSQLConnection(
    host,
    port,
    database,
    username: username,
    password: password,
    useSSL: uri.queryParameters['sslmode'] == 'require', // Check for SSL mode
  );
  // Execute a query
  final results = await connection.query(query);
  return results;
}

Future<void> _saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('key', 'value');
}

// Retrieve data
Future<void> _readData() async {

  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getString('key');
  print('Value: $value');
}

class UserProvider with ChangeNotifier {
  String _name = 'John Doe';
  int _age = 25;

  String get name => _name;
  int get age => _age;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setAge(int age) {
    _age = age;
    notifyListeners();
  }
}