import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    print(data);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var deviceHeight = queryData.size.height / 2;
    String bgImage = data['isDaytime'] ? 'day2.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.cyan[600] : Colors.black87;
    String flagName = data['flag'];
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 185, 0, 0),
              // const EdgeInsets.all(MediaQuery.of(context).size.width / 10),

              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(
                          context, '/choose_location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                    label: Text('Edit Location',
                        style: TextStyle(color: Colors.grey[300])),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data['location'],
                            style: TextStyle(
                                fontSize: 28.0,
                                letterSpacing: 2.0,
                                color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Image.asset("assets/$flagName",
                              height: 30, width: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(data['time'],
                      style: TextStyle(fontSize: 66.0, color: Colors.white))
                ],
              ),
            ),
          ),
        ));
  }
}
