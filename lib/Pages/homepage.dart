import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multilingualapp/Pages/steps.dart';
import 'package:multilingualapp/bloc/lang/lang_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLang = "english";
  bool stepsselected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.center,
                AppLocalizations.of(context)!.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<LangBloc, LangState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<LangBloc>().add(languageEvent());
                        setState(() {
                          selectedLang = "english";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: selectedLang != "english"
                                    ? const Color.fromARGB(255, 194, 194, 194)
                                    : const Color.fromARGB(255, 51, 51, 51)),
                            borderRadius: BorderRadius.circular(10),
                            color: selectedLang != "english"
                                ? const Color.fromARGB(255, 194, 194, 194)
                                : Colors.white),
                        child: Text(
                          AppLocalizations.of(context)!.english,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<LangBloc>().add(languageEvent());
                        setState(() {
                          selectedLang = "spanish";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: selectedLang == "english"
                                    ? const Color.fromARGB(255, 194, 194, 194)
                                    : const Color.fromARGB(255, 51, 51, 51)),
                            borderRadius: BorderRadius.circular(10),
                            color: selectedLang == "english"
                                ? const Color.fromARGB(255, 194, 194, 194)
                                : Colors.white),
                        child: Text(
                          AppLocalizations.of(context)!.spanish,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (stepsselected) {
                    stepsselected = false;
                  } else {
                    stepsselected = true;
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Text(
                  AppLocalizations.of(context)!.steps,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        height: !stepsselected
            ? MediaQuery.of(context).size.height - 320
            : MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 247, 247, 247),
            borderRadius: BorderRadius.only(
              topLeft: !stepsselected
                  ? const Radius.elliptical(60, 60)
                  : const Radius.elliptical(0, 0),
              topRight: !stepsselected
                  ? const Radius.elliptical(60, 60)
                  : const Radius.elliptical(0, 0),
            )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              stepsselected
                  ? Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      alignment: Alignment.topLeft,
                      child: Steps())
                  : const Text(""),
              stepsselected
                  ? const Text("")
                  : Text(
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                      AppLocalizations.of(context)!.desc)
            ],
          ),
        ),
      ),
    );
  }
}
