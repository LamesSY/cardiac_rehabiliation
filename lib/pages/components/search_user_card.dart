import 'package:cardiac_rehabilitation/model/user_search_input.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class UserSearchCard extends StatelessWidget {
  const UserSearchCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      decoration: cirBoxDecoration(radius: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: UserSearchWrap(),
            flex: 9,
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Text(
                    "搜索",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserSearchWrap extends StatelessWidget {
  const UserSearchWrap({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Wrap(
        spacing: defaultPadding,
        runSpacing: defaultPadding,
        alignment: WrapAlignment.start,
        children: List.generate(
          searchInputList.length,
          (index) => SearchInputField(
            title: searchInputList[index].title,
            iconData: searchInputList[index].iconData,
          ),
        ),
      ),
    );
  }
}

class SearchInputField extends StatelessWidget {
  const SearchInputField({Key key, this.title, this.iconData})
      : super(key: key);

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        Container(
          margin: const EdgeInsets.only(left: defaultPadding),
          width: 200,
          child: TextField(
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: const EdgeInsets.all(15),
              border: const OutlineInputBorder(
                gapPadding: 1,
                borderSide: BorderSide(width: 0.1),
              ),
              suffixIcon: Icon(iconData),
            ),
          ),
        ),
      ],
    );
  }
}
