import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutube/screens/screens.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../utils/utils.dart';

class ChannelInfo extends StatelessWidget {
  const ChannelInfo({
    Key? key,
    required this.channel,
    this.isOnVideo = false,
  }) : super(key: key);

  final AsyncSnapshot<Channel> channel;
  final bool isOnVideo;

  @override
  Widget build(BuildContext context) {
    double size = isOnVideo ? 40 : 60;
    return GestureDetector(
      onTap: isOnVideo && channel.data != null
          ? () {
              context.pushPage(ChannelScreen(id: channel.data!.id.value));
            }
          : null,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: channel.data != null
                      ? DecorationImage(
                          image:
                              CachedNetworkImageProvider(channel.data!.logoUrl),
                          fit: BoxFit.fitWidth,
                        )
                      : null,
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    channel.data != null ? channel.data!.title : "",
                    style: context.textTheme.headline6,
                  ),
                  Text(
                    channel.data != null
                        ? channel.data!.subscribersCount == null
                            ? "Hidden"
                            : channel.data!.subscribersCount!.formatNumber +
                                " subscribers"
                        : "",
                    style: context.textTheme.bodyText1,
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
