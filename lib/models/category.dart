enum Category { general, technology, business, science, arts }

extension CategoryExtension on Category {
  String get name {
    switch (this) {
      case Category.general:
        return 'General';
      case Category.technology:
        return 'Technology';
      case Category.business:
        return 'Business';
      case Category.science:
        return 'Science';
      case Category.arts:
        return 'Arts';
    }
  }
}
