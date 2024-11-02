import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// working progress...

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            ),
            Positioned(
              left: -20,
              bottom: 100,
              child: Container(
                width: 1200,
                height: 1200,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-20 / 360),
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/shapes/blueshape.svg',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 70,
              bottom: 100,
              child: Container(
                width: 1200,
                height: 1200,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-20 / 360),
                  child: SvgPicture.asset(
                    'assets/shapes/aquashape.svg',
                  ),
                ),
              ),
            ),
            Positioned(
              right: -194,
              bottom: 165,
              child: Container(
                width: 1300,
                height: 1300,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-2 / 360),
                  child: SvgPicture.asset(
                    'assets/shapes/orangeredshape.svg',
                  ),
                ),
              ),
            ),
            Positioned(
              right: -100,
              bottom: 175,
              child: Container(
                width: 1300,
                height: 1300,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-2 / 360),
                  child: SvgPicture.asset(
                    'assets/shapes/redshape.svg',
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 175,
              child: Container(
                width: 1300,
                height: 1300,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-2 / 360),
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
                              labelText: "Email or Username"),
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
                          'Log in',
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          height: 37,
                          width: 37,
                          'assets/icons/google.png',
                          //color: Colors.black.withOpacity(0.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.5),
                          child: const Text(
                            'Log in with Google',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 68, 124),
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          height: 37,
                          width: 37,
                          'assets/icons/apple.svg',
                          //color: Colors.black.withOpacity(0.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.5),
                          child: const Text(
                            ' Log in with Apple  ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 70, 74, 77),
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                        ),
                      ],
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
                            'First time?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.5),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 68, 124),
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ---------------------------------- old style

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

                  /*Container(
                    height: 5,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      //alignment: Alignment.center,
                      children: [],
                    ),
                  ),*/
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
