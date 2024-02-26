import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Steps:",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Color.fromARGB(255, 136, 0, 0)),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildStep(
            title: '1) Set up Your App',
            description:
                'Create a new Flutter application and add the flutter_localizations package to your pubspec.yaml file as a dependency.',
            exampleCode: """
flutter create my_flutter_app

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
""",
          ),
          _buildStep(
            title: '2) Define Supported Locales',
            description:
                'Specify the locales your app supports by setting the supportedLocales property in your MaterialApp or CupertinoApp.',
            exampleCode: """
supportedLocales: [
  Locale('en'), // English
  Locale('es'), // Spanish
],
""",
          ),
          _buildStep(
            title: '3) Configure Localizations Delegates',
            description:
                'Add the necessary localizations delegates to your app\'s localizationsDelegates property.',
            exampleCode: """
localizationsDelegates: [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
],
""",
          ),
          _buildStep(
            title: '4) Implement Locale-specific Widgets',
            description:
                'Update your app\'s UI to use locale-specific Material or Cupertino widgets.',
            exampleCode: """
AppBar(
  title: Text('Internationalization Example'),
)
""",
          ),
          _buildStep(
            title: '5) Override Locale if Needed',
            description:
                'Use the Localizations.override widget to localize a specific section of your app to a different locale.',
            exampleCode: """
Localizations.override(
  context: context,
  locale: const Locale('es'),
  child: Builder(
    builder: (context) {
      return Text('¡Hola Mundo!');
    },
  ),
)
""",
          ),
          _buildStep(
            title: '6) Add Customized Localized Messages',
            description:
                'Configure localization by enabling the generate flag in your pubspec.yaml file and creating a l10n.yaml configuration file.',
            exampleCode: """
flutter:
  generate: true

# l10n.yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
""",
          ),
          _buildStep(
            title: '7) Integrate Localized Messages into Your App',
            description:
                'Import the generated localizations file (app_localizations.dart) into your app and include the AppLocalizations delegate.',
            exampleCode: """
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

localizationsDelegates: [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
],
""",
          ),
          _buildStep(
            title: '8) Test Your Localization',
            description:
                'Test your app thoroughly to ensure that all UI elements and localized messages are displayed correctly for each supported language.',
            exampleCode: """
// Test your app by switching between different locales to verify localization.
""",
          ),
        ],
      ),
    );
  }

  Widget _buildStep(
      {required String title,
      required String description,
      required String exampleCode}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Example:',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 8, 8, 8),
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(10),
          child: Text(
            exampleCode.trim(),
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Courier',
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
