import 'package:flutter/material.dart';
import '../constant/constants.dart';

class FilterScreen extends StatefulWidget {
  static const routerName = '/filters';
  final Function? saveFilter;

  FilterScreen(this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool sugerFree = false;
  bool pressure_disease = false;
  bool kidney_patients = false;
  bool gout = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      activeColor: Colors.orange,
      value: currentValue,
      onChanged: updateValue(),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilter = {'suger': sugerFree,
                'Pressure disease' :pressure_disease,
                'Kidney patients' : kidney_patients,
                'Gout' : gout,};
              widget.saveFilter!(selectedFilter);
            },
            icon: Icon(Icons.save),
          ),
        ],
        title: Text(
          'Filters',
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal selection',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
              SwitchListTile(
              activeColor: Colors.orange,
              value: sugerFree,
              onChanged: (newValue){
                setState(() {
                  sugerFree = newValue;
                });
              },
              title: Text(
                'suger free',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'without suger',
                style: TextStyle(fontSize: 20),
              ),
            ),
                SwitchListTile(
                  activeColor: Colors.orange,
                  value: pressure_disease,
                  onChanged: (newValue){
                    setState(() {
                      pressure_disease = newValue;
                    });
                  },
                  title: Text(
                    'pressure disease',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'without suger',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SwitchListTile(
                  activeColor: Colors.orange,
                  value: kidney_patients,
                  onChanged: (newValue){
                    setState(() {
                      kidney_patients = newValue;
                    });
                  },
                  title: Text(
                    'kidney patients',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'anything',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SwitchListTile(
                  activeColor: Colors.orange,
                  value: gout,
                  onChanged: (newValue){
                    setState(() {
                      gout = newValue;
                    });
                  },
                  title: Text(
                    'gout',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'without suger',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
