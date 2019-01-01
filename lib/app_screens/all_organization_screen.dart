import 'package:flutter/material.dart';
import './organization.dart';
import './organization_info_screen.dart';

class allOrganizations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return allOrganizationsHomeBuilder();
  }
}

class allOrganizationsHomeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container (
      child: Center(
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment(0, 0),
              height: MediaQuery.of(context).size.height*0.1,
              child:Text(
                'All Organizations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.red,
                ),
              ),
            ), 
            Container(
              margin: EdgeInsets.all(1),
              height: MediaQuery.of(context).size.height*0.1,
              child: Row(
                children: <Widget>[
                  Expanded(child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width*0.6,
                    child: TextField(),
                  ),),
                  Expanded(child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width*0.3,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Icon(Icons.search),
                      color: Colors.red,
                    ),
                  ),)
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: ListView.builder(
                itemCount: registeredOrganizations.length,
                itemBuilder: (BuildContext ctxt, int index){
                return organizationUIComponenet();
                },
              )
            )
          ],
        ),
      ),        
    );
  }
}
class organizationUIComponenet extends StatelessWidget {
  @override
  organization temp = new organization('TBD', false, 'description is yet TBD');  
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
                  builder: (context) => infoRunner(temp),
                )
                );
              },
              leading: Icon(Icons.person),  //replace with organization logo
              title: Text(temp.getName()),
              subtitle: Text(temp.getDescription()),
              trailing: getLeadingIcon(temp.getfavorite()),
            )
          ],
        ),
      );
    }
  }
  class addLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage tbdLogo = new AssetImage('assets/logo.png');
    Image logo = Image(image: tbdLogo);
    return Container(child: logo,);
  }
}