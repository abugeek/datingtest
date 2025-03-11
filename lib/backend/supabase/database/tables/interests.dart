import '../database.dart';

class InterestsTable extends SupabaseTable<InterestsRow> {
  @override
  String get tableName => 'interests';

  @override
  InterestsRow createRow(Map<String, dynamic> data) => InterestsRow(data);
}

class InterestsRow extends SupabaseDataRow {
  InterestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InterestsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);
}
