// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  imageUrl: json['imageUrl'] as String?,
  category: json['category'] as String?,
  area: json['area'] as String?,
  ingredients:
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  steps:
      (json['steps'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  prepTimeMinutes: (json['prepTimeMinutes'] as num?)?.toInt(),
  cookTimeMinutes: (json['cookTimeMinutes'] as num?)?.toInt(),
  servings: (json['servings'] as num?)?.toInt() ?? 2,
  difficulty: json['difficulty'] as String? ?? 'easy',
  isPrivate: json['isPrivate'] as bool? ?? false,
  source: json['source'] as String? ?? 'catalog',
  caloriesPerServing: (json['caloriesPerServing'] as num?)?.toDouble(),
  proteinsG: (json['proteinsG'] as num?)?.toDouble(),
  carbsG: (json['carbsG'] as num?)?.toDouble(),
  fatsG: (json['fatsG'] as num?)?.toDouble(),
  allergens:
      (json['allergens'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isSaved: json['isSaved'] as bool? ?? false,
  youtubeUrl: json['youtubeUrl'] as String?,
  externalId: json['externalId'] as String?,
);

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'area': instance.area,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'prepTimeMinutes': instance.prepTimeMinutes,
      'cookTimeMinutes': instance.cookTimeMinutes,
      'servings': instance.servings,
      'difficulty': instance.difficulty,
      'isPrivate': instance.isPrivate,
      'source': instance.source,
      'caloriesPerServing': instance.caloriesPerServing,
      'proteinsG': instance.proteinsG,
      'carbsG': instance.carbsG,
      'fatsG': instance.fatsG,
      'allergens': instance.allergens,
      'tags': instance.tags,
      'isSaved': instance.isSaved,
      'youtubeUrl': instance.youtubeUrl,
      'externalId': instance.externalId,
    };

_$RecipeIngredientImpl _$$RecipeIngredientImplFromJson(
  Map<String, dynamic> json,
) => _$RecipeIngredientImpl(
  name: json['name'] as String,
  quantity: json['quantity'] as String?,
  unit: json['unit'] as String?,
);

Map<String, dynamic> _$$RecipeIngredientImplToJson(
  _$RecipeIngredientImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'quantity': instance.quantity,
  'unit': instance.unit,
};
