
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// singleton cache manager
class CustomCacheManager {
  static CacheManager instance = CacheManager(
    Config(
      'MAQEProductCarousel',
      stalePeriod: const Duration(days: 14),
      maxNrOfCacheObjects: 100,      
    ),
  );
}