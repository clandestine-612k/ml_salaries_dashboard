import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'data/salaries.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ML Salaries Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _sortAscending = true;
  int _sortColumnIndex = 0;

  void _sort<T>(Comparable<T> Function(SalaryData d) getField, int columnIndex,
      bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
      salaryData.sort((a, b) {
        if (!ascending) {
          final SalaryData c = a;
          a = b;
          b = c;
        }
        final Comparable<T> aValue = getField(a);
        final Comparable<T> bValue = getField(b);
        return Comparable.compare(aValue, bValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ML Salaries Dashboard'),
      ),
      body: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        columns: [
          DataColumn(
            label: Text('Year'),
            onSort: (int columnIndex, bool ascending) =>
                _sort<num>((SalaryData d) => d.year, columnIndex, ascending),
          ),
          DataColumn(
            label: Text('Number of Total Jobs'),
            onSort: (int columnIndex, bool ascending) => _sort<num>(
                (SalaryData d) => d.totalJobs, columnIndex, ascending),
          ),
          DataColumn(
            label: Text('Average Salary (USD)'),
            onSort: (int columnIndex, bool ascending) => _sort<num>(
                (SalaryData d) => d.averageSalary, columnIndex, ascending),
          ),
        ],
        rows: salaryData.map((salary) {
          return DataRow(
            cells: [
              DataCell(Text(salary.year.toString())),
              DataCell(Text(salary.totalJobs.toString())),
              DataCell(Text(salary.averageSalary.toString())),
            ],
          );
        }).toList(),
      ),
    );
  }
}
