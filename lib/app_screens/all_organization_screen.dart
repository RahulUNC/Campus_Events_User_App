import 'package:flutter/material.dart';
import './organization.dart';
import './organization_info_screen.dart';

var organizations = [
  new organization('cisco', false, 'cisco does networking'),
  new organization('sas', false, 'sas does programming'),
  new organization('fidelity', false, 'fidelity does finances'),
  new organization('xiamoi', false, 'makes cheap phoens'),
  new organization('UNC', false, 'spends money in the wrong places')
];

class allOrganizations extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return allOrganizationsHomeBuilder();
  }
}

class allOrganizationsHomeBuilder extends State<allOrganizations> {
  final TextEditingController textEditController = new TextEditingController();
  String searchChange = '';
  
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
                    child: TextField(
                      controller: textEditController,
                      onChanged: (String e) {
                        setState(() {
                          searchChange = e;                          
                        });
                      },
                    ),
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
                itemCount: findSearchOrgs(searchChange).length,
                itemBuilder: (BuildContext ctxt, int index){
                return organizationUIComponenet(searchChange, index);
                },
              )
            )
          ],
        ),
      ),        
    );
  }
}

List<organization> findSearchOrgs (String search) {
  List<organization> searched = [];
  if(search == '')
    return organizations;
  for(int i = 0; i < organizations.length; i++){
    if(organizations[i].getName().contains(search)) {
      searched.add(organizations[i]);
    }
  }
  return searched;
}

class organizationUIComponenet extends StatelessWidget {
  
  String search;
  int currentIndex;
  List<organization> searchedList;
  organizationUIComponenet(this.search, this.currentIndex);

  
  @override
  organization temp = new organization('TBD', false, 'description is yet TBD');  
  Widget build(BuildContext context) {
      searchedList = findSearchOrgs(search);
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
                  builder: (context) => infoRunner(searchedList[currentIndex]),
                )
                );
              },
              leading: Icon(Icons.person),  //replace with organization logo
              title: Text(searchedList[currentIndex].getName()),
              subtitle: Text(searchedList[currentIndex].getDescription()),
              trailing: getLeadingIcon(searchedList[currentIndex].getfavorite()),
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