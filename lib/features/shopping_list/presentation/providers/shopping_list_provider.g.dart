// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListNotifierHash() =>
    r'967e7d20aca933565085b256892af0054be228b7';

/// See also [ShoppingListNotifier].
@ProviderFor(ShoppingListNotifier)
final shoppingListNotifierProvider =
    AutoDisposeNotifierProvider<
      ShoppingListNotifier,
      List<ShoppingItem>
    >.internal(
      ShoppingListNotifier.new,
      name: r'shoppingListNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$shoppingListNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ShoppingListNotifier = AutoDisposeNotifier<List<ShoppingItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
