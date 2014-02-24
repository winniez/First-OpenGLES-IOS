//
//  AppDelegate.h
//  hw6_ios
//
//  Created by Winnie Zeng on 2/23/14.
//  Copyright (c) 2014 Winnie Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "openglView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
openglView* _glView;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet openglView *glView;
@end
