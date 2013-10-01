#import "PTAppDelegate.h"

@interface PTAppDelegate ()
@end

@implementation PTAppDelegate

@synthesize window = window_;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:NO];
    NSString* name = [[NSUserDefaults standardUserDefaults] objectForKey:@"appName"];
    if(name)
    {
        NSLog(@"Get App Name: %@",name);
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"Peertalk" forKey:@"appName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"Set App Name: Peertalk");
    }
    [UIApplication sharedApplication].idleTimerDisabled = YES;
  return YES;
}


//- (void)applicationWillTerminate:(UIApplication *)application {
//}


@end
