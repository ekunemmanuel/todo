// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_todo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarTodoCollection on Isar {
  IsarCollection<IsarTodo> get isarTodos => this.collection();
}

const IsarTodoSchema = CollectionSchema(
  name: r'IsarTodo',
  id: -2442335902144134071,
  properties: {
    r'isComplete': PropertySchema(
      id: 0,
      name: r'isComplete',
      type: IsarType.bool,
    ),
    r'isarName': PropertySchema(
      id: 1,
      name: r'isarName',
      type: IsarType.string,
    )
  },
  estimateSize: _isarTodoEstimateSize,
  serialize: _isarTodoSerialize,
  deserialize: _isarTodoDeserialize,
  deserializeProp: _isarTodoDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarTodoGetId,
  getLinks: _isarTodoGetLinks,
  attach: _isarTodoAttach,
  version: '3.1.0+1',
);

int _isarTodoEstimateSize(
  IsarTodo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.isarName.length * 3;
  return bytesCount;
}

void _isarTodoSerialize(
  IsarTodo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isComplete);
  writer.writeString(offsets[1], object.isarName);
}

IsarTodo _isarTodoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarTodo();
  object.isComplete = reader.readBool(offsets[0]);
  object.isarId = id;
  object.isarName = reader.readString(offsets[1]);
  return object;
}

P _isarTodoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarTodoGetId(IsarTodo object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarTodoGetLinks(IsarTodo object) {
  return [];
}

void _isarTodoAttach(IsarCollection<dynamic> col, Id id, IsarTodo object) {
  object.isarId = id;
}

extension IsarTodoQueryWhereSort on QueryBuilder<IsarTodo, IsarTodo, QWhere> {
  QueryBuilder<IsarTodo, IsarTodo, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarTodoQueryWhere on QueryBuilder<IsarTodo, IsarTodo, QWhereClause> {
  QueryBuilder<IsarTodo, IsarTodo, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarTodoQueryFilter
    on QueryBuilder<IsarTodo, IsarTodo, QFilterCondition> {
  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isCompleteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isarName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterFilterCondition> isarNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isarName',
        value: '',
      ));
    });
  }
}

extension IsarTodoQueryObject
    on QueryBuilder<IsarTodo, IsarTodo, QFilterCondition> {}

extension IsarTodoQueryLinks
    on QueryBuilder<IsarTodo, IsarTodo, QFilterCondition> {}

extension IsarTodoQuerySortBy on QueryBuilder<IsarTodo, IsarTodo, QSortBy> {
  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> sortByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.asc);
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> sortByIsCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.desc);
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> sortByIsarName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarName', Sort.asc);
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> sortByIsarNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarName', Sort.desc);
    });
  }
}

extension IsarTodoQuerySortThenBy
    on QueryBuilder<IsarTodo, IsarTodo, QSortThenBy> {
  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> thenByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.asc);
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> thenByIsCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.desc);
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> thenByIsarName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarName', Sort.asc);
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QAfterSortBy> thenByIsarNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarName', Sort.desc);
    });
  }
}

extension IsarTodoQueryWhereDistinct
    on QueryBuilder<IsarTodo, IsarTodo, QDistinct> {
  QueryBuilder<IsarTodo, IsarTodo, QDistinct> distinctByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isComplete');
    });
  }

  QueryBuilder<IsarTodo, IsarTodo, QDistinct> distinctByIsarName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isarName', caseSensitive: caseSensitive);
    });
  }
}

extension IsarTodoQueryProperty
    on QueryBuilder<IsarTodo, IsarTodo, QQueryProperty> {
  QueryBuilder<IsarTodo, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarTodo, bool, QQueryOperations> isCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isComplete');
    });
  }

  QueryBuilder<IsarTodo, String, QQueryOperations> isarNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarName');
    });
  }
}
