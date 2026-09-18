import 'package:flutter/material.dart';

void main() {
  runApp(const UCUPApp());
}

class UCUPApp extends StatefulWidget {
  const UCUPApp({super.key});

  @override
  State<UCUPApp> createState() => _UCUPAppState();
}

class _UCUPAppState extends State<UCUPApp> {
  ThemeMode mode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UCUP',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF061018),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFC107),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),
      home: LanguagePage(
        onThemeChanged: (v) => setState(() => mode = v),
      ),
    );
  }
}

const gold = Color(0xFFFFC107);
const bg = Color(0xFF061018);
const card = Color(0xFF0D1B25);
const border = Color(0xFF28404F);

class Logo extends StatelessWidget {
  final double size;
  const Logo({super.key, this.size = 34});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.workspace_premium, color: gold, size: size),
        const SizedBox(width: 5),
        Text(
          'UCUP',
          style: TextStyle(
            color: Colors.white,
            fontSize: size * .62,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class LanguagePage extends StatelessWidget {
  final void Function(ThemeMode) onThemeChanged;
  const LanguagePage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF101E29), bg],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                const Logo(size: 62),
                const SizedBox(height: 18),
                const Text(
                  'PUBG UC olish endi oson!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 45),
                const Text(
                  'Tilni tanlang',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                LangButton(
                  flag: '🇺🇿',
                  title: "O'zbekcha",
                  onTap: () => _open(context),
                ),
                LangButton(
                  flag: '🇷🇺',
                  title: 'Русский',
                  onTap: () => _open(context),
                ),
                LangButton(
                  flag: '🇬🇧',
                  title: 'English',
                  onTap: () => _open(context),
                ),
                const Spacer(),
                const Text(
                  'UCUP • Demo version',
                  style: TextStyle(color: Colors.white38),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _open(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }
}

class LangButton extends StatelessWidget {
  final String flag, title;
  final VoidCallback onTap;
  const LangButton({
    super.key,
    required this.flag,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: border),
          ),
          child: Row(
            children: [
              Text(flag, style: const TextStyle(fontSize: 25)),
              const SizedBox(width: 14),
              Expanded(
                child: Text(title, style: const TextStyle(fontSize: 16)),
              ),
              const Icon(Icons.chevron_right, color: gold),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final login = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Logo(size: 50),
              const SizedBox(height: 45),
              const Text('Kirish',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 25),
              TextField(
                controller: login,
                decoration: inputDecoration('Telefon raqam yoki Gmail',
                    Icons.person_outline),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: password,
                obscureText: true,
                decoration:
                    inputDecoration('Parol', Icons.lock_outline),
              ),
              const SizedBox(height: 22),
              GoldButton(
                title: 'Kirish',
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const BonusPage()),
                ),
              ),
              const SizedBox(height: 15),
              const Text('yoki', style: TextStyle(color: Colors.white54)),
              const SizedBox(height: 15),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  side: const BorderSide(color: border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const BonusPage()),
                ),
                icon: const Icon(Icons.g_mobiledata, size: 30),
                label: const Text('Google bilan kirish'),
              ),
              const Spacer(),
              const Text(
                'Demo: bu versiyada login haqiqiy serverga ulanmagan.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white38),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration inputDecoration(String hint, IconData icon) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: Icon(icon),
    filled: true,
    fillColor: card,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: border),
    ),
  );
}

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              const Icon(Icons.card_giftcard, color: gold, size: 90),
              const SizedBox(height: 25),
              const Text('🎉 Tabriklaymiz!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text(
                'Sizga 15 UC bonus berildi!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: gold, width: 1.5),
                  color: const Color(0xFF1A2021),
                ),
                child: const Text(
                  '+15 UC',
                  style: TextStyle(
                      color: gold, fontSize: 32, fontWeight: FontWeight.w900),
                ),
              ),
              const Spacer(),
              GoldButton(
                title: 'Bosh sahifa',
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeShell()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;
  double balance = 15.0;
  int ads = 0;
  int friends = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        balance: balance,
        friends: friends,
        onWithdraw: () => _withdraw(context),
      ),
      EarnPage(
        ads: ads,
        onWatch: ads < 50 ? _watchAd : null,
      ),
      ReferralPage(friends: friends),
      ProfilePage(),
    ];

    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF09151D),
        selectedIndex: index,
        indicatorColor: gold.withOpacity(.18),
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Bosh sahifa'),
          NavigationDestination(
              icon: Icon(Icons.play_circle_outline), selectedIcon: Icon(Icons.play_circle), label: 'UC ishlash'),
          NavigationDestination(
              icon: Icon(Icons.group_outlined), selectedIcon: Icon(Icons.group), label: 'Referal'),
          NavigationDestination(
              icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  void _watchAd() {
    setState(() {
      ads++;
      balance += .05;
    });
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: card,
        title: const Text('Reklama tugadi!'),
        content: const Text('Hisobingizga 0.05 UC qo‘shildi.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: gold)),
          )
        ],
      ),
    );
  }

  void _withdraw(BuildContext context) {
    final id = TextEditingController();
    final amount = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: card,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: 20, right: 20, top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('UC yechib olish',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            TextField(
              controller: id,
              decoration: inputDecoration('PUBG ID', Icons.gamepad_outlined),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: inputDecoration('UC miqdori', Icons.monetization_on_outlined),
            ),
            const SizedBox(height: 16),
            GoldButton(
              title: 'Boshlash',
              onTap: () {
                final value = double.tryParse(amount.text) ?? 0;
                if (value <= 0 || value > balance) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Balans yetarli emas yoki miqdor noto‘g‘ri.')),
                  );
                  return;
                }
                setState(() => balance -= value);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('So‘rovingiz qabul qilindi. Demo rejimida.'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
      child: Row(
        children: [
          const Logo(size: 38),
          const Spacer(),
          Text(title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          const Icon(Icons.notifications_none, color: gold),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final double balance;
  final int friends;
  final VoidCallback onWithdraw;

  const HomePage({
    super.key,
    required this.balance,
    required this.friends,
    required this.onWithdraw,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      children: [
        const Header(title: 'Bosh sahifa'),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              colors: [Color(0xFF172B37), Color(0xFF0D1A22)],
            ),
            border: Border.all(color: border),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PUBG UC o‘z qo‘lingizda!',
                  style: TextStyle(
                      color: gold, fontSize: 21, fontWeight: FontWeight.w900)),
              SizedBox(height: 7),
              Text('Reklama ko‘ring • UC yig‘ing • PUBG’da o‘ynang'),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(child: StatCard(icon: Icons.card_giftcard, title: 'UC Balans', value: '${balance.toStringAsFixed(2)} UC')),
            Expanded(child: StatCard(icon: Icons.people, title: 'Do‘stlar', value: '$friends')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: GoldButton(title: 'UC yechib olish', onTap: onWithdraw),
        ),
        const SectionTitle('Kunlik reklama limiti'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CardBox(
            child: Row(
              children: [
                const Icon(Icons.ondemand_video, color: gold),
                const SizedBox(width: 12),
                const Expanded(child: Text('Kunlik reklama ko‘rish')),
                Text('0 / 50', style: TextStyle(color: gold)),
              ],
            ),
          ),
        ),
        const SectionTitle('Tezkor tugmalar'),
        Row(
          children: [
            Expanded(child: QuickButton(icon: Icons.play_arrow, text: 'UC ishlash')),
            Expanded(child: QuickButton(icon: Icons.group, text: 'Referal')),
            Expanded(child: QuickButton(icon: Icons.settings, text: 'Sozlamalar')),
          ],
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title, value;
  const StatCard({super.key, required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 4, 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: gold),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Colors.white60)),
          const SizedBox(height: 3),
          Text(value, style: const TextStyle(color: gold, fontSize: 21, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class EarnPage extends StatelessWidget {
  final int ads;
  final VoidCallback? onWatch;
  const EarnPage({super.key, required this.ads, required this.onWatch});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      children: [
        const Header(title: 'UC ishlash'),
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: border),
          ),
          child: Column(
            children: [
              const Icon(Icons.play_circle, color: gold, size: 70),
              const SizedBox(height: 12),
              const Text('0.05 UC',
                  style: TextStyle(color: gold, fontSize: 34, fontWeight: FontWeight.w900)),
              const Text('Reklama ko‘ring'),
              const SizedBox(height: 22),
              GoldButton(
                title: 'Boshlash',
                onTap: onWatch,
              ),
              const SizedBox(height: 15),
              Text('Bugun: $ads / 50 reklama',
                  style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        const SectionTitle('Qanday ishlaydi?'),
        const InfoTile(icon: Icons.ondemand_video, text: 'Reklamani oxirigacha ko‘ring'),
        const InfoTile(icon: Icons.add_circle_outline, text: '0.05 UC balansingizga tushadi'),
        const InfoTile(icon: Icons.account_balance_wallet, text: 'Yetarli UC bo‘lganda yechib olish so‘rovi yuboring'),
      ],
    );
  }
}

class ReferralPage extends StatelessWidget {
  final int friends;
  const ReferralPage({super.key, required this.friends});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      children: [
        const Header(title: 'Referal'),
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: border),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.card_giftcard, color: gold, size: 45),
              SizedBox(height: 12),
              Text('Do‘stingizni taklif qiling!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Har bir faol do‘st uchun 5 UC bonus.'),
              SizedBox(height: 18),
              Text('Sizning referal havolangiz',
                  style: TextStyle(color: Colors.white60)),
              SizedBox(height: 8),
              CardBox(child: Text('https://ucup.app/ref/PLAYER007')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: GoldButton(title: 'Havolani nusxalash', onTap: () {})),
              const SizedBox(width: 10),
              Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Do‘stga yuborish'))),
            ],
          ),
        ),
        const SectionTitle('Referal statistikasi'),
        Row(
          children: [
            Expanded(child: StatCard(icon: Icons.group, title: 'Jami taklif', value: '$friends')),
            const Expanded(child: StatCard(icon: Icons.verified_user, title: 'Faol do‘stlar', value: '0')),
          ],
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Header(title: 'Profil'),
        const SizedBox(height: 15),
        const Center(
          child: CircleAvatar(
            radius: 42,
            backgroundColor: gold,
            child: Icon(Icons.person, size: 50, color: Colors.black),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text('Player_007',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        ),
        const Center(
          child: Text('PUBG ID: 7H3K8', style: TextStyle(color: Colors.white54)),
        ),
        const SizedBox(height: 20),
        const ProfileTile(icon: Icons.language, title: 'Tilni o‘zgartirish', value: "O'zbekcha"),
        const ProfileTile(icon: Icons.share, title: 'Ilovani ulashish'),
        const ProfileTile(icon: Icons.send, title: 'Telegram sahifamiz'),
        const ProfileTile(icon: Icons.support_agent, title: 'Qo‘llab-quvvatlash'),
        const ProfileTile(icon: Icons.settings, title: 'Sozlamalar'),
        const ProfileTile(icon: Icons.logout, title: 'Chiqish'),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  const ProfileTile({super.key, required this.icon, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      child: ListTile(
        leading: Icon(icon, color: gold),
        title: Text(title),
        trailing: value != null
            ? Text(value!, style: const TextStyle(color: Colors.white60))
            : const Icon(Icons.chevron_right),
      ),
    );
  }
}

class GoldButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const GoldButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: gold,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        child: Text(title),
      ),
    );
  }
}

class CardBox extends StatelessWidget {
  final Widget child;
  const CardBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      child: child,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
      child: Text(text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
    );
  }
}

class QuickButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const QuickButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          Icon(icon, color: gold),
          const SizedBox(height: 7),
          Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: gold.withOpacity(.15),
        child: Icon(icon, color: gold),
      ),
      title: Text(text),
    );
  }
}
