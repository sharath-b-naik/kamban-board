extension GroupByExtension<E> on List<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keySelector) {
    return fold({}, (map, element) {
      final key = keySelector(element);
      map.putIfAbsent(key, () => []).add(element);
      return map;
    });
  }
}
