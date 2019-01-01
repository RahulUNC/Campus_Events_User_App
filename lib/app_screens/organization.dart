import 'package:flutter/material.dart';
import 'organization_info_screen.dart';

List<organization> registeredOrganizations = [];

class organizationBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    //replace with some kind of system that takes in the organization files from the api
    for(int i = 0; i < 10; i++)
    {
      registeredOrganizations.add(new organization('TBD', false, 'the descritption is yet TBD'));
    }    
    return Container (
      child: Center(
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment(0, 0),
              height: MediaQuery.of(context).size.height*0.2,
              child:Text(
                'My Organizations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.red,
                ),
              ),
            ), 
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: ListView.builder(
                itemCount: registeredOrganizations.length,
                itemBuilder: (BuildContext ctxt, int index){
                return organizationUIComponenet(index);
                },
              )
            )
          ],
        ),
      ),        
    );
  }
}

class organization {
  String name;
  bool favorite;
  String description;

  organization(this.name, this.favorite, this.description);

  String getName() {return name;}
  bool getfavorite() {return favorite;}
  String getDescription() {return description;}
}

class organizationUIComponenet extends StatelessWidget {
  @override
  int currentIndex;
  organizationUIComponenet(this.currentIndex);  
  Widget build(BuildContext context) {
      return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            addLogo(),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => infoRunner(registeredOrganizations[currentIndex]),
                )
                );
              },
              leading: Icon(Icons.person),  //replace with organization logo
              title: Text(registeredOrganizations[currentIndex].getName()),
              subtitle: Text(registeredOrganizations[currentIndex].getDescription()),
              trailing: getLeadingIcon(registeredOrganizations[currentIndex].getfavorite()),
            )
          ],
        ),
      );
    }
  }

  Icon getLeadingIcon(bool val) {
    if(val)
      return Icon(Icons.thumb_up);
    else
      return Icon(Icons.thumb_down);
  }

//replace with dynamic code  
class addLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage tbdLogo = new AssetImage('assets/logo.png');
    Image logo = Image(image: tbdLogo);
    return Container(child: logo,);
  }
}