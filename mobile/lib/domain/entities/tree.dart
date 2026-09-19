class TreeSummary {
  const TreeSummary({
    required this.id,
    required this.code,
    required this.variety,
    required this.status,
    required this.active,
  });

  final int id;
  final String code;
  final String variety;
  final String status;
  final bool active;

  factory TreeSummary.fromRow(Map<String, Object?> row) => TreeSummary(
        id: row['tree_id']! as int,
        code: row['tree_code']! as String,
        variety: row['variety']! as String,
        status: row['status']! as String,
        active: (row['active']! as int) == 1,
      );
}
