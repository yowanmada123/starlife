class Pasien {
  final String id;
  final String name;
  final String rm;
  final String role;
  bool isSelected;

  Pasien({
    required this.id,
    required this.name,
    required this.rm,
    required this.role,
    required this.isSelected,
  });

  @override
  String toString() {
    return '{ $name, $id }';
  }
}
