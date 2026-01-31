import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:neural_effect/neural_effect.dart';
import 'package:google_fonts/google_fonts.dart';

// Responsive helper class
class R {
  static bool isMobile(BuildContext c) => MediaQuery.of(c).size.width < 700;
  static bool isTablet(BuildContext c) =>
      MediaQuery.of(c).size.width >= 700 && MediaQuery.of(c).size.width < 1100;
  static bool isDesktop(BuildContext c) => MediaQuery.of(c).size.width >= 1100;

  static double pad(BuildContext c) => isMobile(c)
      ? 20
      : isTablet(c)
      ? 60
      : 120;

  static double hero(BuildContext c) => isMobile(c)
      ? 48
      : isTablet(c)
      ? 72
      : 88;

  static double title(BuildContext c) => isMobile(c)
      ? 32
      : isTablet(c)
      ? 48
      : 88;

  static double image(BuildContext c) => isMobile(c)
      ? 180
      : isTablet(c)
      ? 220
      : 280;
}

void main() {
  if (kIsWeb) {
    _registerIframes();
  }
  runApp(const App());
}

void _registerIframes() {
  _registerIframe('mentora', 'https://www.mentoraaiapp.com/');
  _registerIframe('aspyre', 'https://www.aspyre.co.in/');
  _registerIframe('arzoo', 'https://arzoo-makeovers.vercel.app/');
  _registerIframe('yk', 'https://www.ykwaterpumps.in/');
}

void _registerIframe(String id, String url) {
  ui.platformViewRegistry.registerViewFactory('iframe-$id', (int viewId) {
    final iframe = html.IFrameElement()
      ..src = url
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.pointerEvents = 'none'
      ..style.backgroundColor = 'black';
    return iframe;
  });
}

class App extends StatelessWidget {
  const App({super.key});

  static final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: GoogleFonts.archivoBlackTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // RIVE BACKGROUND
            // Positioned.fill(
            //   child: IgnorePointer(
            //     child: Opacity(
            //       opacity: 1.0,
            //       child: RiveAnimation.asset(
            //         'assets/images/particles.riv',
            //         fit: BoxFit.cover,
            //         stateMachines: const ['State Machine 1'],
            //       ),
            //     ),
            //   ),
            // ),
            SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(
                horizontal: R.pad(context),
                vertical: R.isMobile(context) ? 60 : 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PROFILE HEADER
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: flutter.Image.asset(
                          'assets/images/Devansh.png',
                          height: R.image(context),
                          width: R.image(context),
                          fit: BoxFit.cover,
                          isAntiAlias: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'DEVANSH',
                        style: GoogleFonts.archivoBlack(
                          fontSize: R.hero(context),
                          height: 0.95,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'DUTT',
                        style: GoogleFonts.archivoBlack(
                          fontSize: R.hero(context),
                          height: 0.95,
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '+91-9873877058',
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                      ),
                      const Text(
                        'devanshdutt224@gmail.com',
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                      ),
                      const SizedBox(height: 25),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          _SocialIcon(
                            imagePath: 'assets/images/whatsapp.png',
                            url: 'https://wa.me/919873877058',
                            needPadding: false,
                          ),
                          _SocialIcon(
                            imagePath: 'assets/images/gmail.png',
                            url: 'mailto:devanshdutt224@gmail.com',
                          ),
                          _SocialIcon(
                            imagePath: 'assets/images/github.png',
                            url: 'https://github.com/devanshdutt810/',
                          ),
                          _SocialIcon(
                            imagePath: 'assets/images/linkedin.png',
                            url:
                                'https://www.linkedin.com/in/devansh-dutt-3b042112b/',
                          ),
                          _SocialIcon(
                            imagePath: 'assets/images/instagram.png',
                            url: 'https://www.instagram.com/devanshdutt810/',
                          ),
                          _SocialIcon(
                            imagePath: 'assets/images/facebook.png',
                            url: 'https://www.facebook.com/devanshdutt810/',
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                  // HERO
                  Text(
                    'SOFTWARE',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'ENGINEER',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: R.isMobile(context) ? double.infinity : 620,
                    child: const Text(
                      'Passionate about creating intuitive and engaging user experiences. Specialize in transforming ideas into beautifully crafted products.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        height: 1.7,
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),

                  // STATS
                  Center(
                    child: Wrap(
                      spacing: 80,
                      runSpacing: 40,
                      alignment: WrapAlignment.center,
                      children: const [
                        _StatBlock(value: '8+', label: 'YEARS OF EXPERIENCE'),
                        _StatBlock(value: '15+', label: 'PROJECTS COMPLETED'),
                        _StatBlock(
                          value: '200+',
                          label: 'WORLDWIDE CONNECTIONS',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 120),

                  // WORKED WITH
                  Text(
                    'WORK',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'EXPERIENCE',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),

                  const SizedBox(height: 40),

                  Wrap(
                    spacing: 80,
                    runSpacing: 40,
                    children: const [
                      _CompanyBlock(
                        logoPath: 'assets/images/adviserlogic.png',
                        name: 'AdviserLogic',
                        period: '2018 – 2020',
                      ),
                      _CompanyBlock(
                        logoPath: 'assets/images/morningstar.png',
                        name: 'Morningstar Inc.',
                        period: '2020 – 2025',
                      ),
                    ],
                  ),

                  const SizedBox(height: 120),

                  // RECOMMENDATIONS
                  Text(
                    'RECOMMENDATIONS',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'FROM PEOPLE I WORKED WITH',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),

                  const SizedBox(height: 60),

                  Column(
                    children: recommendations
                        .map(
                          (rec) => _RecommendationCard(
                            name: rec['name'] as String,
                            picture: rec['picture'] as String,
                            role: rec['role'] as String,
                            company: rec['company'] as String,
                            text: rec['text'] as String,
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 60),
                  // Projects
                  Text(
                    'RECENT',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'PROJECTS',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),

                  const SizedBox(height: 40),

                  _ProjectsList(),

                  //const SizedBox(height: 20),
                  Text(
                    'LET\'S WORK',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'TOGETHER',
                    style: GoogleFonts.archivoBlack(
                      fontSize: R.hero(context),
                      height: 0.95,
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Reach out to discuss your projects, collaborate, or just say hello!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 40),

                  OutlinedButton(
                    onPressed: () {
                      App._scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOutCubic,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 18,
                      ),
                    ),
                    child: const Text(
                      'Contact Me',
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectIframe extends StatelessWidget {
  final String viewType;
  const _ProjectIframe({required this.viewType});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox.expand(child: HtmlElementView(viewType: viewType)),
    );
  }
}

class _StatBlock extends StatelessWidget {
  final String value;
  final String label;

  const _StatBlock({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            letterSpacing: 1.2,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final String imagePath;
  final String? url;
  final bool needPadding;

  const _SocialIcon({
    required this.imagePath,
    required this.url,
    this.needPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: needPadding
          ? const EdgeInsets.symmetric(horizontal: 20)
          : EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: InkWell(
        onTap: url == null
            ? null
            : () {
                html.window.open(url!, '_blank');
              },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 64,
          width: 64,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: flutter.Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _CompanyBlock extends StatelessWidget {
  final String logoPath;
  final String name;
  final String period;

  const _CompanyBlock({
    required this.logoPath,
    required this.name,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          //padding: const EdgeInsets.all(12),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(14),
          //   border: Border.all(color: Colors.white24, width: 2),
          // ),
          child: flutter.Image.asset(
            logoPath,
            fit: BoxFit.contain,
            //color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          period,
          style: const TextStyle(fontSize: 18, color: Colors.white54),
        ),
      ],
    );
  }
}

final recommendations = [
  {
    "name": "Cath Perry",
    "picture": "assets/images/cath.jpeg",
    "role": "Former Director of Product Operations",
    "company": "Adviserlogic",
    "text":
        "I was blessed with working closely with Devansh for several years at a pivotal time for AdviserLogic. He was a great asset to our team and would make a great addition to any organisation from both skill and culture aspect. During our years together, Devansh’s skills and knowledge in coding, understanding user needs and translating into clear deliverables, Australian financial services, and the technology that supports it grew from strength to strength. His ability to identify issues and inefficiencies and suggest improvements benefited the entire team and delighted clients with better outcomes. Devansh is a caring, approachable, and fun person who enjoys collaborating, leading team projects and discussions. Balancing multiple client and team projects from ideation, coding and testing was all well managed. I wish Devansh every success for the future.",
  },
  {
    "name": "Jacob Kettler",
    "picture": "assets/images/jacob.jpeg",
    "role": "Former Senior Pre-Sales Consultant",
    "company": "Morningstar Inc.",
    "text":
        "In my time working with Devansh, he was a senior member of Morningstar's development team. He consistently delivered outstanding work and generously offered his time to colleagues in the team to help solve issues. He was also promoted to a new team during this time. Devansh's professionalism and experience make him an asset to any business.",
  },
];

class _RecommendationCard extends StatelessWidget {
  final String name;
  final String picture;
  final String role;
  final String company;
  final String text;

  const _RecommendationCard({
    required this.name,
    required this.picture,
    required this.role,
    required this.company,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: flutter.Image.asset(
                  picture,
                  height: 64,
                  width: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$role · $company',
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            text,
            style: GoogleFonts.openSans(
              fontSize: 16,
              height: 1.7,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectsCarousel extends StatefulWidget {
  @override
  State<_ProjectsCarousel> createState() => _ProjectsCarouselState();
}

class _ProjectsCarouselState extends State<_ProjectsCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.38);

  double _page = 0.0;

  final projects = const [
    _ProjectData(
      title: 'Mentora AI',
      description:
          'An AI-powered exam preparation mobile application with notes, quizzes, planners, and AI doubt solving.',
      viewType: 'iframe-mentora',
      openUrl: 'https://www.mentoraaiapp.com/',
    ),
    _ProjectData(
      title: 'Aspyre',
      description:
          'A modern clothing brand focused on strong visual identity, storytelling, and e-commerce.',
      viewType: 'iframe-aspyre',
      fallbackImage: 'assets/images/aspyre_preview.png',
      openUrl: 'https://www.aspyre.co.in/',
    ),
    _ProjectData(
      title: 'Arzoo Makeovers',
      description:
          'A clean portfolio website showcasing professional makeup work and services.',
      viewType: 'iframe-arzoo',
      openUrl: 'https://arzoo-makeovers.vercel.app/',
    ),
    _ProjectData(
      title: 'YK Industries',
      description:
          'A corporate portfolio website for an industrial water pump manufacturer.',
      viewType: 'iframe-yk',
      openUrl: 'https://www.ykwaterpumps.in/',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _page = _controller.page ?? 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeIndex = _page.round().clamp(0, projects.length - 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 420,
          child: PageView.builder(
            controller: _controller,
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final diff = (_page - index).abs();
              final scale = (1 - diff * 0.25).clamp(0.8, 1.0);

              return Transform.scale(
                scale: scale,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: _ProjectCarouselTile(project: projects[index]),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              children: [
                Text(
                  projects[activeIndex].title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.archivoBlack(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 28),

                // BIG REDIRECT BUTTON
                SizedBox(
                  width: 260,
                  child: OutlinedButton(
                    onPressed: projects[activeIndex].openUrl == null
                        ? null
                        : () {
                            html.window.open(
                              projects[activeIndex].openUrl!,
                              '_blank',
                            );
                          },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    child: const Text(
                      'Have a Look',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  projects[activeIndex].description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.7,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectData {
  final String title;
  final String description;
  final String viewType;
  final String? fallbackImage;
  final String? openUrl;

  const _ProjectData({
    required this.title,
    required this.description,
    required this.viewType,
    this.fallbackImage,
    this.openUrl,
  });
}

class _ProjectCarouselTile extends StatelessWidget {
  final _ProjectData project;
  const _ProjectCarouselTile({required this.project});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (project.fallbackImage != null)
              flutter.Image.asset(project.fallbackImage!, fit: BoxFit.cover)
            else
              SizedBox.expand(
                child: HtmlElementView(viewType: project.viewType),
              ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectsList extends StatelessWidget {
  const _ProjectsList();

  static const List<_ProjectData> projects = [
    _ProjectData(
      title: 'Mentora AI',
      description:
          'An AI-powered exam preparation mobile application with notes, quizzes, planners, and AI doubt solving.',
      viewType: 'iframe-mentora',
      openUrl: 'https://www.mentoraaiapp.com/',
    ),
    _ProjectData(
      title: 'Aspyre',
      description:
          'A modern clothing brand focused on strong visual identity, storytelling, and e-commerce.',
      viewType: 'iframe-aspyre',
      fallbackImage: 'assets/images/aspyre_preview.png',
      openUrl: 'https://www.aspyre.co.in/',
    ),
    _ProjectData(
      title: 'Arzoo Makeovers',
      description:
          'A clean portfolio website showcasing professional makeup work and services.',
      viewType: 'iframe-arzoo',
      openUrl: 'https://arzoo-makeovers.vercel.app/',
    ),
    _ProjectData(
      title: 'YK Industries',
      description:
          'A corporate portfolio website for an industrial water pump manufacturer.',
      viewType: 'iframe-yk',
      openUrl: 'https://www.ykwaterpumps.in/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: projects.map((project) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // PROJECT PREVIEW
              SizedBox(
                height: R.isMobile(context) ? 300 : 520,
                width: double.infinity,
                child: _ProjectCarouselTile(project: project),
              ),

              const SizedBox(height: 40),

              // TITLE
              Text(
                project.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.archivoBlack(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 24),

              // CTA BUTTON
              SizedBox(
                width: 260,
                child: OutlinedButton(
                  onPressed: project.openUrl == null
                      ? null
                      : () {
                          html.window.open(project.openUrl!, '_blank');
                        },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  child: const Text(
                    'Have a Look',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // DESCRIPTION
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Text(
                  project.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.7,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
