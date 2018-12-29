import 'package:flutter/material.dart';
import './organization.dart';
import 'bottom_nav.dart';

class organizationInfo extends StatelessWidget {
  
  organization org;
  
  organizationInfo(this.org);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Events'),
        backgroundColor: Colors.red,
        ),
      body: informationBody(org),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}

class informationBody extends StatelessWidget {
  
  organization org;

  informationBody(this.org);
  
  @override
  Widget build(BuildContext context) {    
    return Container (
      child: Center(
        child:Column(
        children: <Widget>[
          //Expanded(child:addLogo()),
          Expanded(child: Text(
            org.getName(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 40.0,
            ),
          ),),
          Expanded(child: Text(
            org.getDescription(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: favoriteButton(),),
              Expanded(child: messageButton(),),
            ],
          ),)
          
        ],
      ),
      )
    );
  }
}
class addLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage devAppLogo = new AssetImage('assets/logo.png');
    Image logo = Image(image: devAppLogo);
    return Container(child: logo,);
  }
}
class favoriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: (){},
        color: Colors.red,
        child: Text('Add/Remove Favorite'),
        elevation: 6.0,
      ),
    );
  }
} 
class messageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: (){},
        color: Colors.red,
        child: Text('Message Organization'),
        elevation: 6.0,
      ),
    );
  }
} 