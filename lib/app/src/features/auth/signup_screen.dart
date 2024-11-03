import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:intl/intl.dart'; // Importa per formattare le date

// working progress...
class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  late AnimationController _blueController;
  late Animation<double> _opacityAnimationBlue;

  late AnimationController _orangeController; // Controller per il primo SVG
  late Animation<double> _opacityAnimationOrange;

  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();

    // Controller e animazione per l'SVG rosso
    _orangeController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimationOrange = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _orangeController,
        curve: Curves.easeIn,
      ),
    );

    // Inizia l'animazione del rosso immediatamente
    _orangeController.forward();

    // Controller e animazione per l'SVG blu
    _blueController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimationBlue = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _blueController,
        curve: Curves.easeIn,
      ),
    );

    // Ritarda l'inizio dell'animazione del blu di 500 millisecondi
    Future.delayed(Duration(milliseconds: 800), () {
      _blueController.forward();
    });
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _orangeController.dispose();
    _blueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 253),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          fit: StackFit.loose,
          children: [
            Positioned(
              left: -120,
              bottom: 160,
              //child: SlideTransition(           side transition
              //  position: _slideAnimation,      side transition
              //child: FadeTransition(
              //opacity: _opacityAnimationBlue,
              child: Container(
                width: 1200,
                height: 1200,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(80 / 360),
                  child: SvgPicture.asset(
                    'assets/shapes/lightblueshape.svg',
                  ),
                ),
              ),
            ),
            //),                                side transition
            //),

            //without transition
            /*Positioned(
              left: -90,
              bottom: 70,
              child: Container(
                width: 1200,
                height: 1200,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-20 / 360),
                  child: SvgPicture.asset(
                    'assets/shapes/lightblueshape.svg',
                  ),
                ),
              ),
            ),*/
            Positioned(
              left: -20,
              bottom: 100,
              //child: FadeTransition(
              //opacity: _opacityAnimationBlue,
              child: Container(
                width: 1200,
                height: 1200,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(80 / 360),
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/shapes/blueshape.svg',
                    ),
                  ),
                ),
              ),
            ),
            //),
            Positioned(
              left: 70,
              bottom: 100,
              //child: FadeTransition(
              //opacity: _opacityAnimationBlue,
              child: Container(
                width: 1200,
                height: 1200,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(60 / 360),
                  child: SvgPicture.asset(
                    'assets/shapes/aquashape.svg',
                  ),
                ),
              ),
              //),
            ),
            Positioned(
              right: -194,
              bottom: 165,
              //child: FadeTransition(
              //opacity: _opacityAnimationOrange,
              child: Container(
                width: 1300,
                height: 1300,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-60 / 360),
                  child: SvgPicture.asset(
                    'assets/shapes/orangeredshape.svg',
                  ),
                ),
              ),
              //),
            ),
            Positioned(
              right: -100,
              bottom: 175,
              //child: FadeTransition(
              //opacity: _opacityAnimationOrange,
              child: Container(
                width: 1300,
                height: 1300,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-60 / 360),
                  child: SvgPicture.asset(
                    'assets/shapes/redshape.svg',
                  ),
                ),
                //),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 175,
              //child: FadeTransition(
              //opacity: _opacityAnimationOrange,
              child: Container(
                width: 1300,
                height: 1300,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-60 / 360),
                  child: Opacity(
                    opacity: 0.9,
                    child: SvgPicture.asset(
                      color: Colors.yellow,
                      'assets/shapes/yellowshape.svg',
                    ),
                  ),
                ),
                //),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                "Signup",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 2.0,
                      color: const Color.fromARGB(255, 118, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, bottom: 16, top: 16),
                    child: Opacity(
                      opacity: 0.89,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Sfondo solido per evitare trasparenza
                          borderRadius:
                              BorderRadius.circular(40), // Bordo arrotondato
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              floatingLabelStyle: TextStyle(
                                color: Colors
                                    .blue, // Colore della label quando il campo è attivo
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 157,
                                      255), // Colore del bordo quando è attivo
                                  width: 2.0, // Larghezza del bordo
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0)),
                              ),
                              labelText: "Email"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, bottom: 16, top: 16),
                    child: Opacity(
                      opacity: 0.89,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Sfondo solido per evitare trasparenza
                          borderRadius:
                              BorderRadius.circular(40), // Bordo arrotondato
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              floatingLabelStyle: TextStyle(
                                color: Colors
                                    .blue, // Colore della label quando il campo è attivo
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 157,
                                      255), // Colore del bordo quando è attivo
                                  width: 2.0, // Larghezza del bordo
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0)),
                              ),
                              labelText: "Name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email or username';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, bottom: 16, top: 16),
                    child: Opacity(
                      opacity: 0.89,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Sfondo solido per evitare trasparenza
                          borderRadius:
                              BorderRadius.circular(40), // Bordo arrotondato
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                              floatingLabelStyle: TextStyle(
                                color: Colors
                                    .blue, // Colore della label quando il campo è attivo
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 157,
                                      255), // Colore del bordo quando è attivo
                                  width: 2.0, // Larghezza del bordo
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0)),
                              ),
                              labelText: "Surname"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, bottom: 16, top: 16),
                    child: Opacity(
                      opacity: 0.89,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Sfondo solido per evitare trasparenza
                          borderRadius:
                              BorderRadius.circular(40), // Bordo arrotondato
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                              floatingLabelStyle: TextStyle(
                                color: Colors
                                    .blue, // Colore della label quando il campo è attivo
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 157,
                                      255), // Colore del bordo quando è attivo
                                  width: 2.0, // Larghezza del bordo
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0)),
                              ),
                              labelText: "Username (nickname)"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Username';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, bottom: 16, top: 16),
                    child: Opacity(
                      opacity: 0.89,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Sfondo solido per evitare trasparenza
                          borderRadius:
                              BorderRadius.circular(40), // Bordo arrotondato
                        ),
                        child: DateTimeFormField(
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            floatingLabelStyle: TextStyle(
                              color: Colors
                                  .blue, // Colore della label quando il campo è attivo
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40.0)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 157,
                                    255), // Colore del bordo quando è attivo
                                width: 2.0, // Larghezza del bordo
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40.0)),
                            ),
                          ),
                          mode: DateTimeFieldPickerMode.date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2024),
                          /*initialPickerDateTime:
                        DateTime.now().add(const Duratio  n(days: 20)),*/
                          onChanged: (DateTime? value) {
                            _selectedDate = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 0, bottom: 16),
                    child: Center(
                      child: ElevatedButton(
                        //autofocus: true,

                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              const Color.fromARGB(255, 68, 193, 255)),
                          //const Color.fromARGB(255, 212, 212, 212)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigate the user to the Home page
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill input')),
                            );
                          }
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: const Color.fromARGB(
                        255, 212, 212, 212), // Colore della linea
                    thickness: 4, // Spessore della linea
                    indent: 45, // Spazio a sinistra
                    endIndent: 45, // Spazio a destra
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.5),
                          child: const Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 68, 124),
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /*body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity, // Assegna larghezza al contenitore
            height: 400,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              alignment: Alignment.center,
              //alignment: Alignment.center,
              children: [
                Positioned(
                  left: 70,
                  top: -115,
                  child: Container(
                    width: 500,
                    height: 500,
                    child: SvgPicture.asset(
                      'assets/shapes/blobblue.svg',
                      /*fit: BoxFit
                          .cover, // Mantieni l'immagine nella dimensione fissa
                    */
                    ),
                  ),
                ),
                Positioned(
                  right: 90,
                  top: -120,
                  child: Container(
                    width: 500,
                    height: 500,
                    child: SvgPicture.asset(
                      'assets/shapes/bloborange.svg',
                      /*fit: BoxFit
                          .cover, // Mantieni l'immagine nella dimensione fissa
                      */
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  child: Text(
                    "MusicVerse",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //-----------------Form
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        Colors.white, // Sfondo solido per evitare trasparenza
                    borderRadius:
                        BorderRadius.circular(40), // Bordo arrotondato
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.25), // Colore dell'ombra con opacità regolata
                        spreadRadius: 0.5, // Espansione dell'ombra
                        blurRadius:
                            8, // Sfocatura dell'ombra per un effetto più morbido
                        offset: Offset(0, 4), // Posizione dell'ombra
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 191,
                              0), // Colore della label quando il campo è attivo
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 191,
                                0), // Colore del bordo quando è attivo
                            width: 2.0, // Larghezza del bordo
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0)),
                        ),
                        labelText: "Email or username"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, bottom: 16, top: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        Colors.white, // Sfondo solido per evitare trasparenza
                    borderRadius:
                        BorderRadius.circular(40), // Bordo arrotondato
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.25), // Colore dell'ombra con opacità regolata
                        spreadRadius: 0.5, // Espansione dell'ombra
                        blurRadius:
                            8, // Sfocatura dell'ombra per un effetto più morbido
                        offset: Offset(0, 4), // Posizione dell'ombra
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: Colors
                              .blue, // Colore della label quando il campo è attivo
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 157,
                                255), // Colore del bordo quando è attivo
                            width: 2.0, // Larghezza del bordo
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0)),
                        ),
                        labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 16, bottom: 16),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          const Color.fromARGB(255, 212, 212, 212)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate the user to the Home page
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              /*Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 0.0),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate the user to the Home page
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),*/
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 0.0),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: double.infinity, // Assegna larghezza al contenitore
                height: 5,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.loose,
                  alignment: Alignment.center,
                  //alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 10,
                      top: -70,
                      child: Container(
                        width: 660,
                        height: 660,
                        child: SvgPicture.asset(
                          'assets/shapes/bloborange.svg',
                          /*fit: BoxFit
                          .cover, // Mantieni l'immagine nella dimensione fissa
                    */
                        ),
                      ),
                    ),
                    Positioned(
                      right: 110,
                      top: -20,
                      child: Container(
                        width: 560,
                        height: 560,
                        child: SvgPicture.asset(
                          'assets/shapes/blobblue.svg',
                          /*fit: BoxFit
                          .cover, // Mantieni l'immagine nella dimensione fissa
                      */
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),*/
    );
  }
}



/*

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.1), // Start just below the screen
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // Start animations after a short delay
    Future.delayed(Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 253),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          fit: StackFit.loose,
          children: [
            // Use SlideTransition and FadeTransition for animations
            Positioned(
              left: -90,
              bottom: 70,
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                    width: 1200,
                    height: 1200,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-20 / 360),
                      child: SvgPicture.asset(
                        'assets/shapes/lightblueshape.svg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Repeat for other shapes
            Positioned(
              left: -20,
              bottom: 100,
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                    width: 1200,
                    height: 1200,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-20 / 360),
                      child: SvgPicture.asset(
                        'assets/shapes/blueshape.svg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 70,
              bottom: 100,
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                    width: 1200,
                    height: 1200,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-20 / 360),
                      child: SvgPicture.asset(
                        'assets/shapes/aquashape.svg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -194,
              bottom: 165,
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                    width: 1300,
                    height: 1300,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-2 / 360),
                      child: SvgPicture.asset(
                        'assets/shapes/orangeredshape.svg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -100,
              bottom: 175,
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                    width: 1300,
                    height: 1300,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-2 / 360),
                      child: SvgPicture.asset(
                        'assets/shapes/redshape.svg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 175,
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                    width: 1300,
                    height: 1300,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-2 / 360),
                      child: Opacity(
                        opacity: 0.9,
                        child: SvgPicture.asset(
                          color: Colors.yellow,
                          'assets/shapes/yellowshape.svg',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Title and input fields code remains unchanged
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                "MusicVerse",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 2.0,
                      color: const Color.fromARGB(255, 118, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 315),
              child: Column(
                children: [
                  // Input fields and button code here (remains unchanged)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/