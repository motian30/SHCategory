
#ifndef AppConstant_h
#define AppConstant_h

/**
 weak

 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif


/**
 strong
 
 */
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


/**
 nil
 
 */
#define NotNilOrNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define NilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))


/**
 common
 
 */
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define Ratio       (Screenwidth > ScreenHeight ? ScreenHeight : Screenwidth) / 320.0

#define SHRatio(a)  Ratio*a

#define AppDegate (AppDelegate *)([UIApplication sharedApplication].delegate)

#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define UserDefaults [NSUserDefaults standardUserDefaults]

#define Device [UIDevice currentDevice] systemVersion] floatValue]

#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])


/**
 iOS
 
 */
#if TARGET_OS_IPHONE
#endif
#if (TARGET_IPHONE_SIMULATOR)
#else
#endif

#endif /* AppConstant_h */
