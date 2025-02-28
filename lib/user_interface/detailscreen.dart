import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:starchars/data/Character.dart';
import 'package:starchars/data/CharacterManager.dart';
import 'package:starchars/data/DatabaseProvider.dart';
import 'package:starchars/data/DatabaseManager.dart';

bool sucesso = true;
bool updated = false;

/// This is the screen that shows the characters' details.

class DetailScreen extends StatefulWidget {
  Character character;

  DetailScreen(this.character);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    updateSpeciesPlanet();
  }

  /// Get species and planet for that character.
  void updateSpeciesPlanet() async {
    updated = await CharacterManager.getSpeciesPlanet(widget.character);
    if (updated) {
      print("UPDATED");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (updated) {
      updated = false;
      return Scaffold(
          key: globalKey,
          appBar: AppBar(
            title: Text(widget.character.name),
          ),
          body: Builder(
              builder: (context) => Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 600,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Color.fromRGBO(126, 120, 99, 1.0),
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                              child: Row(children: <Widget>[
                                Container(
                                    child: Text(
                                  widget.character.name,
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                    child: Container(
                                        child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: FlatButton(
//                                      splashColor: Colors.transparent,
//                                      highlightColor: Colors.transparent,
                                    onPressed: () => _pressStar(context),
                                    child: Icon(
                                      _getIcon(),
                                      size: 30,
                                      color: Colors.yellow[700],
                                    ),
                                  ),
                                ))),
                              ])),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 25, 0, 0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          MaterialCommunityIcons
                                              .human_male_height,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "HEIGHT: " + _getFormatedHeight(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]))),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 25, 0, 0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          MaterialCommunityIcons.scale,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "MASS: " + _getFormatedWeight(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]))),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 25, 0, 0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          FontAwesome.scissors,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "HAIR COLOR: " +
                                                  _getFormatedHair(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]))),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 25, 0, 0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          MaterialCommunityIcons
                                              .format_color_fill,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "SKIN COLOR: " +
                                                  _getFormatedSkin(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]))),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 25, 0, 0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          MaterialCommunityIcons.eye,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "EYE COLOR: " + _getFormatedEye(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]))),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 25, 0, 0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          MaterialCommunityIcons.cake,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "BIRTH YEAR: " +
                                                  widget.character.year,
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]))),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 25, 0, 0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          MaterialCommunityIcons
                                              .gender_male_female,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "GENDER: " + _getFormatedGender(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]))),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 25, 0, 0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          MaterialCommunityIcons.earth,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "HOMEWORLD :" +
                                                  widget.character.planet,
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]))),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 25, 0, 0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          MaterialCommunityIcons.human,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              "SPECIES: " +
                                                  widget.character.species,
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))));
    } else {
      return Scaffold(
          key: globalKey,
          appBar: AppBar(
            title: Text(widget.character.name),
          ),
          body: Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )));
    }
  }

  /// Favorite or un-favorite character when presses on star.
  _pressStar(BuildContext context) async {
    if (widget.character.fav == 1) {
      widget.character.fav = 0;
    } else {
      int StatusCode = await DatabaseManager.postFavorite(
          widget.character.id, sucesso, context);
      sucesso = !sucesso;

      if (StatusCode == 201) {
        widget.character.fav = 1;
      }
    }

    setState(() {
      updated = true;
      DatabaseProvider.db.updateCharacter(widget.character);
    });
  }

  /// Returns a full star when a character is marked as favorite, and a empty
  /// star otherwise.
  IconData _getIcon() {
    if (widget.character.fav == 1) {
      return LineIcons.star;
    }

    return LineIcons.star_o;
  }

  /// If weight is a valid number, add 'kg' to the end.
  String _getFormatedWeight() {
    if (isNumeric(widget.character.mass)) {
      return widget.character.mass + " kg";
    }

    return widget.character.mass;
  }

  /// If height is a valid number, add 'cm' to the end.
  String _getFormatedHeight() {
    if (isNumeric(widget.character.height)) {
      return widget.character.height + " cm";
    }

    return widget.character.height;
  }

  /// If gender is known, capitalize first letter.
  String _getFormatedGender() {
    if (widget.character.gender != "n/a") {
      return widget.character.gender[0].toUpperCase() +
          widget.character.gender.substring(1);
    }

    return widget.character.gender;
  }

  /// If hair color is known, capitalize first letter.
  String _getFormatedHair() {
    if (widget.character.hair != "n/a") {
      return widget.character.hair[0].toUpperCase() +
          widget.character.hair.substring(1);
    }

    return widget.character.hair;
  }

  /// If skin color is known, capitalize first letter.
  String _getFormatedSkin() {
    if (widget.character.skin != "n/a") {
      return widget.character.skin[0].toUpperCase() +
          widget.character.skin.substring(1);
    }

    return widget.character.skin;
  }

  /// If eye color is known, capitalize first letter.
  String _getFormatedEye() {
    if (widget.character.eye != "n/a") {
      return widget.character.eye[0].toUpperCase() +
          widget.character.eye.substring(1);
    }

    return widget.character.eye;
  }
}

/// Check if string is numeric
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }

  s = s.replaceFirst(RegExp(','), '.');
  return double.parse(s, (e) => null) != null;
}
