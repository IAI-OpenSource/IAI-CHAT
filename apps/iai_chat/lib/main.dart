import 'package:flutter/material.dart';

void main() {
  runApp(const IaiChatApp());
}

class IaiChatApp extends StatelessWidget {
  const IaiChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IAI-CHAT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B6E4F)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IAI-CHAT')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'IAI-CHAT',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 12),
              Text(
                'Base monorepo prête.\n'
                'Noyau : core_protocol · crypto_engine · mesh_transport\n'
                'Prochaine étape : brancher LanTransport + UI chat.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
