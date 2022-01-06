import 'package:cardiac_rehabilitation/data/sport_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkBenchPreGridView extends StatelessWidget {
  const WorkBenchPreGridView(
    this.preCardDatas, {
    Key? key,
    this.crossAxisCount = 5,
    this.childAspectRatio = 2,
  }) : super(key: key);

  final List<WorkBenchPreCardEntity> preCardDatas;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: preCardDatas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) => WorkBenchPreCard(
        preCardDatas[index],
        onClick: () {},
      ),
    );
  }
}

class WorkBenchPreCard extends StatelessWidget {
  const WorkBenchPreCard(this.preCard, {Key? key, this.onClick})
      : super(key: key);
  final WorkBenchPreCardEntity preCard;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: preCard.bgColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      onPressed: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SvgPicture.asset(preCard.svgSrc), flex: 1),
          const SizedBox(width: 15),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (preCard.hasData == true)
                  Text(
                    "44",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _size.width > 1400 ? 30 : 15,
                        color: preCard.bgColor == Colors.white
                            ? Colors.black
                            : Colors.white),
                  ),
                Text(
                  preCard.subTitle,
                  style: TextStyle(
                      fontSize: _size.width > 1400 ? 18 : 14,
                      color: preCard.bgColor == Colors.white
                          ? Colors.black
                          : Colors.white),
                ),
              ],
            ),
          ),
          if (preCard.bgColor == Colors.white)
            const Expanded(
              flex: 1,
              child: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            )
        ],
      ),
    );
  }
}
