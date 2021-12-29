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
      //height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: UserSearchGridView(),
            flex: 9,
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "搜索",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserSearchGridView extends StatelessWidget {
  const UserSearchGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
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
        Text(title),
        Container(
          margin: const EdgeInsets.only(left: defaultPadding),
          width: 200,
          height: 35,
          child: TextField(
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
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
