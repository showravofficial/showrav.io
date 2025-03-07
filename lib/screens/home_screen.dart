import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:protfolio/providers/theme_provider.dart';
import 'package:protfolio/providers/language_provider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:protfolio/widgets/home_wizard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  late HomeWizard _wizard;

  @override
  void initState() {
    super.initState();
    _wizard = HomeWizard(
      scrollController: _scrollController,
      homeKey: _homeKey,
      skillsKey: _skillsKey,
      experienceKey: _experienceKey,
      projectsKey: _projectsKey,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          _wizard.buildLanguageSelector(context),
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _wizard.buildHeader(context),
            _wizard.buildHeroSection(context),
            _wizard.buildAboutSection(context),
            _wizard.buildSkillsSection(context),
            _wizard.buildExperienceSection(context),
            _wizard.buildProjectsSection(context),
          ],
        ),
      ),
    );
  }
} 