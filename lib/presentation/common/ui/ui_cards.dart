import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/app_text_styles.dart';

class UiCard extends StatelessWidget {
  final String headerName;

  const UiCard({
    required this.headerName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        width: 350,
        height: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xE02F2F2F)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 340,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardHeader(headerCardText: headerName),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CardCont(
                            cardItem: 'Launch',
                            colorItem: Colors.green,
                          ),
                          CardCont(
                              cardItem: 'Reading books',
                              colorItem: Colors.yellow),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// CARD HEADER
class CardHeader extends StatelessWidget {
  final String headerCardText;

  const CardHeader({
    required this.headerCardText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        headerCardText,
        style: AppTextStyles.subHeaderTextStyle,
      ),
    );
  }
}

// CARD STYLING
class CardCont extends StatelessWidget {
  final String cardItem;
  final Color colorItem;
  const CardCont({
    required this.cardItem,
    required this.colorItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 5),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: colorItem, borderRadius: BorderRadius.circular(100)),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(cardItem, style: AppTextStyles.defaultTextStyle),
          )
        ],
      ),
    );
  }
}
