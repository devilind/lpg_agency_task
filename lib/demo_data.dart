class LpgAgency {
  final String name;
  final double latitude;
  final double longitude;
  double distance;

  LpgAgency(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.distance});
}

List lpgAgencies = <LpgAgency>[
  LpgAgency(
      name: 'LPG Agency 1',
      latitude: 19.18366760782961,
      longitude: 73.05542016586676,
      distance: 0),
  LpgAgency(
      name: 'LPG Agency 2',
      latitude: 19.184052663827327,
      longitude: 73.05142903900385,
      distance: 0),
  LpgAgency(
      name: 'LPG Agency 3',
      latitude: 19.18291775935552,
      longitude: 73.06258702808299,
      distance: 0),
  LpgAgency(
      name: 'LPG Agency 4',
      latitude: 19.18745792781477,
      longitude: 73.04446935636447,
      distance: 0),
  LpgAgency(
      name: 'LPG Agency 5',
      latitude: 19.189646604800465,
      longitude: 73.05073499638581,
      distance: 0),
  LpgAgency(
      name: 'LPG Agency 6',
      latitude: 19.191044910974608,
      longitude: 73.0542325968087,
      distance: 0),
  LpgAgency(
      name: 'LPG Agency 7',
      latitude: 19.190943584839406,
      longitude: 73.0432462691,
      distance: 0),
  LpgAgency(
      name: 'LPG Agency 8',
      latitude: 19.175804759522656,
      longitude: 73.03378343605321,
      distance: 0),
  LpgAgency(
      name: 'LPG Agency 9',
      latitude: 19.178966396202064,
      longitude: 73.04371833786792,
      distance: 0),
  LpgAgency(
      name: 'LPG Agency 10',
      latitude: 19.185694805594757,
      longitude: 73.03987741470414,
      distance: 0),
];
