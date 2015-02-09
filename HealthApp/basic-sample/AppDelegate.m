//
//  AppDelegate.m
//  basic-sample
//
//  Created by Martin Gontovnikas on 30/09/14.
//  Copyright (c) 2014 Auth0. All rights reserved.
//

#import "AppDelegate.h"
#import <Lock/Lock.h>
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Init Parse.
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"1o7Imiu9cS7uiIbfrecbiV6bzmCw8haDYv23n3YQ"
                  clientKey:@"eOgIhryFc1LocfvQl03Reqwb607K9nmCAuIQs2ur"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    //Init Auth.
    A0FacebookAuthenticator *facebook = [A0FacebookAuthenticator newAuthenticatorWithDefaultPermissions];
    [[A0IdentityProviderAuthenticator sharedInstance] registerAuthenticationProvider:facebook];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[A0IdentityProviderAuthenticator sharedInstance] handleURL:url sourceApplication:sourceApplication];
}

@end
