class BuildOrder {
  String name; // name of the build order
  late List<BuildOrderStep> steps;

  BuildOrder({
    required this.name,
    required this.steps
  });
}

class BuildOrderStep {
  int supplyNow; // current supply
  int supplyCap; // max supply
  int duration; // duration of the step in seconds
  String description; // what action to do
  String shortcut; // keyboard shortcut for the action
  String sideNote; // side notes on the action

  BuildOrderStep({
    required this.supplyNow,
    required this.supplyCap,
    required this.duration,
    required this.description,
    required this.shortcut,
    required this.sideNote
  });
}

