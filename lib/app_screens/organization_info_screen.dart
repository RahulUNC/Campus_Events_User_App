import 'package:flutter/material.dart';
import './organization.dart';

organization org1;

class infoRunner extends StatefulWidget {
  @override

  organization org;

  infoRunner(this.org);

  State<StatefulWidget> createState() {
    // TODO: implement createState
    org1 = org;
    return organizationInfo();
  } 
}

class organizationInfo extends State<infoRunner> {
  
  int selectedPage = 0;

  organizationInfo();

  final pageOptions = [
    informationBody(org1),
    organizationBuilder(),
    Text('test3')
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Events'),
        backgroundColor: Colors.red,
        ),
      body: pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(            
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Organizations'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}

class informationBody extends StatelessWidget {
  
  organization org;

  informationBody(this.org);
  
  @override
  Widget build(BuildContext context) {    
    return Container (
      child: ListView(
        children: <Widget>[
          Container(
            child:  Column(children: <Widget>[
              addLogo(),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text(
                  org.getName(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 35.0,
                  ),
                ),
              ),
              Text(org.getDescription()),
              Row(children: <Widget>[
                Expanded(
                  child: messageButton(),
                ),
                Expanded(child: favoriteButton(),)
              ],),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text(
                  'Upcoming events for ' + org.getName(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 35.0,
                  ),
                ),
              ),
            ],),
          ),
          //Expanded(child:addLogo()),          
          Container(
            height: MediaQuery.of(context).size.height*0.4,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext ctxt, int index){
                return eventUIComponent();
                },
              )
          ),
        ],
      ),
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
      height: MediaQuery.of(context).size.height*0.1,
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
      height: MediaQuery.of(context).size.height*0.1,
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

class eventUIComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Event Name'),
              subtitle: Text('Description of the event!'),
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              leading: Icon(Icons.gps_fixed),  //replace with organization logo
              title: Text('UNC Chapel Hill'),
            ),
            ListTile(
              leading: Icon(Icons.access_time),  //replace with organization logo
              title: Text('2:00 pm'),
            ),
          ],
        ),
      );
  }
}