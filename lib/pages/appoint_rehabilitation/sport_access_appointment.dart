import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:flutter/material.dart';

class SportAccessAppointment extends StatelessWidget {
  const SportAccessAppointment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Divider divider = const Divider(color: dividerColor);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("康复预约"),
                const SizedBox(height: 15),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        height: 900,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          separatorBuilder: (context, index) => divider,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("心内${index}科"),
                              subtitle: Text("总:33  余:12"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                    ),
                    const VerticalDivider(color: dividerColor, width: 1),
                    Expanded(
                      flex: 32,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        height: 900,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 16, bottom: 16),
      height: 100,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: Text("心内1科", style: TextStyle(fontSize: 18))),
              Expanded(
                child: Text(
                  "总:33    余:15",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            ],
          ),
          const Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}
