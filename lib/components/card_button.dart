import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String title;
  final String? description;
  final String? url;
  final VoidCallback actionTap;

  const CardButton(
      {Key? key,
      required this.title,
      required this.actionTap,
      this.description,
      this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final information = Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0,
                        ),
                      ),
                      description == null
                          ? const SizedBox()
                          : Text(
                              description!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    final borderRadiusButton = BorderRadius.circular(20);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: InkWell(
        onTap: actionTap,
        child: SizedBox(
          height: 80,
          child:
              ClipRRect(borderRadius: borderRadiusButton, child: information),
        ),
      ),
    );
  }
}
