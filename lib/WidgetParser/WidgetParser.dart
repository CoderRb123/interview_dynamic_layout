import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_dynamic_layout/Model/ChildModel.dart';
import 'package:interview_dynamic_layout/Model/WidgetModel.dart';

import '../Model/AppModel.dart';

class WidgetParser extends StatelessWidget {
  final AppModel appData;

  const WidgetParser({super.key, required this.appData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appData.widgets.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        WidgetModel widgetModel = appData.widgets[index];
        switch (widgetModel.type) {
          case 'grid':
            return _buildGridView(widgetModel);
          case 'horizontal_list':
            return _buildHorizontalListView(widgetModel);
          case 'alert':
            return _buildAlert(widgetModel);
          default:
            return const SizedBox.shrink(); // or an alert widget
        }
      },
    );
  }

  Widget _buildAlert(WidgetModel widgetModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widgetModel.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widgetModel.message ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              CachedNetworkImage(
                imageUrl: widgetModel.icon ?? "",
                height: 80,
                width: 80,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildGridView(WidgetModel widgetModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widgetModel.title ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.1),
            itemCount: widgetModel.children.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildChildWidget(widgetModel.children[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalListView(WidgetModel widgetModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widgetModel.title ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widgetModel.children.length,
              itemBuilder: (context, index) {
                return _buildHorizontalListChild(
                    context, widgetModel.children[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildWidget(ChildModel child) {
    double changes = (double.parse(child.current.toString()) -
        double.parse(child.prev_close.toString()));
    return Card(
      color: Colors.grey.withOpacity(0.2),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    child.icon ?? "",
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    child.company_name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                  Text(
                    child.current,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Text(
                    changes.toStringAsFixed(2),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: changes > 0 ? Colors.green : Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalListChild(BuildContext context, ChildModel child) {
    double changes = (double.parse(child.current.toString()) -
        double.parse(child.prev_close.toString()));
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              Text(
                child.company_name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      child.current,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      changes.toStringAsFixed(2),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: changes > 0 ? Colors.green : Colors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
