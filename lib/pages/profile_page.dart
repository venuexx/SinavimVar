import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Halil Yıldırım';
  String _email = 'halil@example.com';
  String _username = '@halil123';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF3EC1B7),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,3))],
              ),
              child: const Text('Profil', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),

            const SizedBox(height: 20),

            Center(
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0,4))],
                      gradient: const LinearGradient(colors: [Color(0xFF8E63FF), Color(0xFFD99BFF)]),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Text(
                        _name.split(' ').map((s) => s.isNotEmpty ? s[0] : '').take(2).join(),
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(_name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(_email, style: const TextStyle(color: Colors.black54)),
                  const SizedBox(height: 6),
                  Text(_username, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),

            const SizedBox(height: 30),
            // Info card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0,6))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hesap Bilgileri', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _infoRow('Ad Soyad', _name),
                  const Divider(),
                  _infoRow('E-posta', _email),
                  const Divider(),
                  _infoRow('Kullanıcı adı', _username),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Actions card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0,4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      final newUsername = await _showInputDialog(context, 'Kullanıcı adını değiştir', _username);
                      if (newUsername != null && newUsername.isNotEmpty) {
                        setState(() {
                          _username = newUsername;
                        });
                      }
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Kullanıcı adımı değiştir'),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 158, 188, 247), padding: const EdgeInsets.symmetric(vertical: 14)),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final newPass = await _showInputDialog(context, 'Şifreni değiştir', '');
                      if (newPass != null && newPass.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Şifreniz başarıyla değiştirildi.')));
                      }
                    },
                    icon: const Icon(Icons.lock),
                    label: const Text('Şifremi değiştir'),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 140, 253, 231), padding: const EdgeInsets.symmetric(vertical: 14)),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final confirm = await showDialog<bool>(context: context, builder: (ctx) {
                        return AlertDialog(
                          title: const Text('İlerlemeni sil'),
                          content: const Text('İlerlemeni tamamen silmek istediğinden emin misin? Bu işlem geri alınamaz.'),
                          actions: [
                            TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('İptal')),
                            TextButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Sil', style: TextStyle(color: Colors.red))),
                          ],
                        );
                      });

                      if (confirm == true) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('İlerlemen silindi.')));
                      }
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                    label: const Text('İlerlemeni sil', style: TextStyle(color: Colors.red)),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Future<String?> _showInputDialog(BuildContext context, String title, String initial) {
    final controller = TextEditingController(text: initial);
    return showDialog<String?>(context: context, builder: (ctx) {
      return AlertDialog(
        title: Text(title),
        content: TextField(controller: controller, decoration: const InputDecoration()),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('İptal')),
          TextButton(onPressed: () => Navigator.of(ctx).pop(controller.text), child: const Text('Kaydet')),
        ],
      );
    });
  }
}
