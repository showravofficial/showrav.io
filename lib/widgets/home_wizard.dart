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

class HomeWizard {
  final ScrollController scrollController;
  final GlobalKey homeKey;
  final GlobalKey skillsKey;
  final GlobalKey experienceKey;
  final GlobalKey projectsKey;

  HomeWizard({
    required this.scrollController,
    required this.homeKey,
    required this.skillsKey,
    required this.experienceKey,
    required this.projectsKey,
  });

  void scrollToSection(GlobalKey key, BuildContext context) {
    final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final offset = position.dy - AppBar().preferredSize.height - 20;
    
    scrollController.animateTo(
      scrollController.offset + offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget buildNavItem(BuildContext context, String text) {
    GlobalKey sectionKey;
    switch (text) {
      case 'Home':
        sectionKey = homeKey;
        break;
      case 'Skills':
        sectionKey = skillsKey;
        break;
      case 'Experience':
        sectionKey = experienceKey;
        break;
      case 'Projects':
        sectionKey = projectsKey;
        break;
      default:
        sectionKey = homeKey;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextButton(
        onPressed: () => scrollToSection(sectionKey, context),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            AppTheme.getPrimaryColor(context).withOpacity(0.1),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppTheme.getTextColor(context),
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget buildSocialIcon(BuildContext context, IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon, color: AppTheme.getTextColor(context), size: 20.sp),
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
    );
  }

  Widget buildHeader(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1000;
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      child: isDesktop ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            languageProvider.translate('my_name'),
            style: TextStyle(
              color: AppTheme.getPrimaryColor(context),
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
          Row(
            children: [
              buildNavItem(context, languageProvider.translate('home')),
              buildNavItem(context, languageProvider.translate('skills')),
              buildNavItem(context, languageProvider.translate('experience')),
              buildNavItem(context, languageProvider.translate('projects')),
              Row(
                children: [
                  buildSocialIcon(context, FontAwesomeIcons.github, 'https://github.com/showravofficial'),
                  SizedBox(width: 16.w),
                  buildSocialIcon(context, FontAwesomeIcons.linkedin, 'https://linkedin.com/in/the-showrav'),
                  SizedBox(width: 16.w),
                  buildSocialIcon(context, FontAwesomeIcons.envelope, 'mailto:showravofficial@gmail.com'),
                ],
              ),
            ],
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: 0.2, end: 0),
        ],
      ) : Column(
        children: [
          Text(
            languageProvider.translate('my_name'),
            style: TextStyle(
              color: AppTheme.getPrimaryColor(context),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
          SizedBox(height: 16.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildNavItem(context, languageProvider.translate('home')),
                buildNavItem(context, languageProvider.translate('skills')),
                buildNavItem(context, languageProvider.translate('experience')),
                buildNavItem(context, languageProvider.translate('projects')),
                Row(
                  children: [
                    buildSocialIcon(context, FontAwesomeIcons.github, 'https://github.com/showravofficial'),
                    SizedBox(width: 16.w),
                    buildSocialIcon(context, FontAwesomeIcons.linkedin, 'https://linkedin.com/in/the-showrav'),
                    SizedBox(width: 16.w),
                    buildSocialIcon(context, FontAwesomeIcons.envelope, 'mailto:showravofficial@gmail.com'),
                  ],
                ),
              ],
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: 0.2, end: 0),
        ],
      ),
    );
  }

  Widget buildHeroSection(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    return Container(
      key: homeKey,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageProvider.translate('talk_is_cheap'),
            style: TextStyle(
              color: AppTheme.getTextColor(context),
              fontSize: 48.sp,
              fontWeight: FontWeight.bold,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
          SizedBox(height: 16.h),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                languageProvider.translate('show_me_the_code'),
                textStyle: TextStyle(
                  color: AppTheme.getPrimaryColor(context),
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
            displayFullTextOnTap: true,
          ),
          SizedBox(height: 24.h),
          Text(
            languageProvider.translate('role_description'),
            style: TextStyle(
              color: AppTheme.getTextColor(context).withOpacity(0.8),
              fontSize: 20.sp,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: 0.2, end: 0),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: () async {
              final url = Uri.parse('mailto:showravofficial@gmail.com');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.getPrimaryColor(context),
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              languageProvider.translate('lets_chat'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }

  Widget buildAboutSection(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageProvider.translate('about_me'),
            style: TextStyle(
              color: AppTheme.getTextColor(context),
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
          SizedBox(height: 24.h),
          Text(
            languageProvider.translate('about_description'),
            style: TextStyle(
              color: AppTheme.getTextColor(context).withOpacity(0.8),
              fontSize: 18.sp,
              height: 1.5,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: 0.2, end: 0),
        ],
      ),
    );
  }

  Widget buildSkillsSection(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    return Container(
      key: skillsKey,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageProvider.translate('skills'),
            style: TextStyle(
              color: AppTheme.getTextColor(context),
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
          SizedBox(height: 32.h),
          _buildSkillCard(
            context,
            languageProvider.translate('programming_languages'),
            languageProvider.translate('prog_lang_description'),
          ),
          SizedBox(height: 24.h),
          _buildSkillCard(
            context,
            languageProvider.translate('mobile_web_dev'),
            languageProvider.translate('mobile_web_description'),
          ),
          SizedBox(height: 24.h),
          _buildSkillCard(
            context,
            languageProvider.translate('databases'),
            languageProvider.translate('database_description'),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context, String title, String description) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppTheme.getPrimaryColor(context),
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            description,
            style: TextStyle(
              color: AppTheme.getTextColor(context).withOpacity(0.8),
              fontSize: 16.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .slideY(begin: 0.2, end: 0);
  }

  Widget buildExperienceSection(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    return Container(
      key: experienceKey,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageProvider.translate('experience'),
            style: TextStyle(
              color: AppTheme.getTextColor(context),
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
          SizedBox(height: 32.h),
          _buildExperienceCard(
            context,
            languageProvider.translate('jr_flutter_dev'),
            languageProvider.translate('bdcalling'),
            languageProvider.translate('present'),
            [
              languageProvider.translate('exp_point1'),
              languageProvider.translate('exp_point2'),
              languageProvider.translate('exp_point3'),
              languageProvider.translate('exp_point4'),
            ],
          ),
          SizedBox(height: 24.h),
          _buildExperienceCard(
            context,
            languageProvider.translate('flutter_apprentice'),
            languageProvider.translate('algorithm_gen'),
            languageProvider.translate('apprentice_duration'),
            [
              languageProvider.translate('apprentice_point1'),
              languageProvider.translate('apprentice_point2'),
              languageProvider.translate('apprentice_point3'),
            ],
          ),
          SizedBox(height: 24.h),
          _buildExperienceCard(
            context,
            languageProvider.translate('executive_basis'),
            languageProvider.translate('uits_cc'),
            languageProvider.translate('basis_duration'),
            [
              languageProvider.translate('basis_point1'),
              languageProvider.translate('basis_point2'),
              languageProvider.translate('basis_point3'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, String title, String company, String duration, List<String> points) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppTheme.getPrimaryColor(context),
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            company,
            style: TextStyle(
              color: AppTheme.getTextColor(context),
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            duration,
            style: TextStyle(
              color: AppTheme.getTextColor(context).withOpacity(0.6),
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 16.h),
          ...points.map((point) => Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: TextStyle(
                    color: AppTheme.getPrimaryColor(context),
                    fontSize: 16.sp,
                  ),
                ),
                Expanded(
                  child: Text(
                    point,
                    style: TextStyle(
                      color: AppTheme.getTextColor(context).withOpacity(0.8),
                      fontSize: 16.sp,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .slideY(begin: 0.2, end: 0);
  }

  Widget buildProjectsSection(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    return Container(
      key: projectsKey,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageProvider.translate('projects'),
            style: TextStyle(
              color: AppTheme.getTextColor(context),
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
          SizedBox(height: 32.h),
          _buildProjectCard(
            context,
            languageProvider.translate('amar_school'),
            languageProvider.translate('amar_school_desc'),
          ),
          SizedBox(height: 24.h),
          _buildProjectCard(
            context,
            languageProvider.translate('bachelor_solution'),
            languageProvider.translate('bachelor_solution_desc'),
          ),
          SizedBox(height: 24.h),
          _buildProjectCard(
            context,
            languageProvider.translate('student_identifier'),
            languageProvider.translate('student_identifier_desc'),
          ),
          SizedBox(height: 24.h),
          _buildProjectCard(
            context,
            languageProvider.translate('iot_project'),
            languageProvider.translate('iot_project_desc'),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, String title, String description) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppTheme.getPrimaryColor(context),
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Tap to see details',
              style: TextStyle(
                color: AppTheme.getTextColor(context).withOpacity(0.6),
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
      back: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(
                color: AppTheme.getTextColor(context).withOpacity(0.8),
                fontSize: 16.sp,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .slideY(begin: 0.2, end: 0);
  }

  Widget buildLanguageSelector(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    return PopupMenuButton<Language>(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            languageProvider.currentLanguage.flag,
            style: TextStyle(fontSize: 20.sp),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: AppTheme.getTextColor(context),
          ),
        ],
      ),
      onSelected: (Language language) {
        languageProvider.setLanguage(language);
      },
      itemBuilder: (BuildContext context) {
        return LanguageProvider.languages.map((Language language) {
          return PopupMenuItem<Language>(
            value: language,
            child: Row(
              children: [
                Text(
                  language.flag,
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(width: 8.w),
                Text(
                  language.name,
                  style: TextStyle(
                    color: AppTheme.getTextColor(context),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF2D2D2D)
          : const Color(0xFFFFFFFF),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: AppTheme.getPrimaryColor(context).withOpacity(0.1),
        ),
      ),
    );
  }
} 