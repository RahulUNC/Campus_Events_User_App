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
        child: ListView.builder(
            itemCount: registeredOrganizations.length,
            itemBuilder: (BuildContext ctxt, int index){
            return organizationUIComponenet(index);
            },
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
    return ListTile(
        onTap: () {
          Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => organizationInfo(registeredOrganizations[currentIndex]),
          )
          );
        },
        leading: Icon(Icons.question_answer),  //replace with organization logo
        title: Text(registeredOrganizations[currentIndex].getName()),
        trailing: getLeadingIcon(registeredOrganizations[currentIndex].getfavorite()),
      );
    }
  }

  Icon getLeadingIcon(bool val) {
    if(val)
      return Icon(Icons.thumb_up);
    else
      return Icon(Icons.thumb_down);
  }