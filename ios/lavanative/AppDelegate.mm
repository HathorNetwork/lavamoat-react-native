#import "AppDelegate.h"
   #import <React/RCTBundleURLProvider.h>
   #import <React/RCTRootView.h>

   @implementation AppDelegate

   - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
   {
     self.moduleName = @"lavanative";
     self.initialProps = @{};
     return [super application:application didFinishLaunchingWithOptions:launchOptions];
   }

   - (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
   {
   #if DEBUG
     NSLog(@"DEBUG MODE: Using RCTBundleURLProvider");
     return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
   #else
     NSLog(@"RELEASE MODE: Attempting to load main.jsbundle");
     
     // Method 1: Using pathForResource
     NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"jsbundle"];
     if (bundlePath) {
       NSLog(@"Method 1 - Bundle found at path: %@", bundlePath);
       return [NSURL fileURLWithPath:bundlePath];
     } else {
       NSLog(@"Method 1 - Error: main.jsbundle not found using pathForResource");
     }
     
     // Method 2: Direct path construction
     NSString *directPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"main.jsbundle"];
     if ([[NSFileManager defaultManager] fileExistsAtPath:directPath]) {
       NSLog(@"Method 2 - Bundle found at direct path: %@", directPath);
       return [NSURL fileURLWithPath:directPath];
     } else {
       NSLog(@"Method 2 - Error: main.jsbundle not found at direct path");
     }
     
     // Logging additional information
     NSLog(@"Bundle resource paths: %@", [[NSBundle mainBundle] resourcePath]);
     NSLog(@"All bundle file names: %@", [[NSBundle mainBundle] pathsForResourcesOfType:nil inDirectory:nil]);
     
     NSLog(@"CRITICAL ERROR: Unable to find main.jsbundle. App will likely crash.");
     return nil;
   #endif
   }

   @end
   
