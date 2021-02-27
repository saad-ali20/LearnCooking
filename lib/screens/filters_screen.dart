import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function savedFilters;
  Map<String, bool> initialData;
  FiltersScreen(this.initialData, this.savedFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
  void initState() {
    // this for make th initial value of the switches the same as I saved it
    _glutenFree = widget.initialData['GlutenFree'];
    _lactoseFree = widget.initialData['LactoseFree'];
    _vegan = widget.initialData['Vegan'];
    _vegetarian = widget.initialData['Vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> selectedfilters = {
                  'GlutenFree': _glutenFree,
                  'LactoseFree': _lactoseFree,
                  'Vegan': _vegan,
                  'Vegetarian': _vegetarian,
                };
                widget.savedFilters(selectedfilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your switched meals',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            SwitchListTile(
              title: Text('GlutenFree'),
              value: _glutenFree,
              subtitle: Text('show only GlutenFree meals'),
              onChanged: (newValue) {
                _glutenFree = newValue;
              },
            ),
            SwitchListTile(
              title: Text('LactoseFree'),
              value: _lactoseFree,
              subtitle: Text('show only LactoseFree meals'),
              onChanged: (newValue) {
                _lactoseFree = newValue;
              },
            ),
            SwitchListTile(
              title: Text('Vegetarian'),
              value: _vegetarian,
              subtitle: Text('show only Vegetarian meals'),
              onChanged: (newValue) {
                _vegetarian = newValue;
              },
            ),
            SwitchListTile(
              title: Text('Vegan'),
              value: _vegan,
              subtitle: Text('show only Vegan meals'),
              onChanged: (newValue) {
                _vegan = newValue;
              },
            ),
          ],
        ));
  }
}
