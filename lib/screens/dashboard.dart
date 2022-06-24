import 'package:flutter/material.dart';
import 'package:onboarding_pdi/screens/onboarding_form.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color(0xFF133b3c),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Image.asset('images/guide_logo_new.png'),
          ),
          Container(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => showOnboardingForm(context),
                child: Material(
                  color: Color(0xFF133b3c), //Color.fromARGB(255, 47, 79, 79),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: 800,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Clique aqui e abra sua Conta',
                            style: TextStyle(
                              color: Color(
                                  0xFFedf1ec), //Color.fromARGB(255, 255, 255, 255),
                              fontSize: 24.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Icon(
                            Icons.account_box,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showOnboardingForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OnboardingForm(),
      ),
    );
  }
}
