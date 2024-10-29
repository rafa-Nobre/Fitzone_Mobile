import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/theme/colors.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.content, required this.hour, this.isMarked, required this.onMarkTask});

  final String content;
  final String hour;
  final bool? isMarked;
  final void Function(bool?) onMarkTask;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  Color containerColor = Colors.grey;

  Widget setIconState () {
    if(widget.isMarked == null) {
      return const SizedBox();
    }else if(widget.isMarked == true) {
      return const Icon(Icons.check);
    }else if(widget.isMarked == false) {
      return const Icon(Icons.cancel);
    }

    return const SizedBox();
  }

  @override
  void initState() {
    if(widget.isMarked == null) {
      containerColor = Colors.grey;
    }else if(widget.isMarked == true) {
      containerColor = themeColorLight;
    }else {
      containerColor = Colors.red.shade300;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: minorSpacing),
      child: Row(
        children: [
          Expanded(child: Text("${widget.content}\n${widget.hour}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.background))),
          //Radio(value: isMarked, groupValue: isMarked, onChanged: onMarkTask, )
          Container(
            height: 24,
            decoration: BoxDecoration(shape: BoxShape.circle, color: containerColor),
            child: setIconState(),
          )
        ],
      ),
    );
  }
}