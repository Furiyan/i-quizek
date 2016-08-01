//
//  Styler.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "Styler.h"

@implementation Styler

+ (void)styleNavigationBar:(UINavigationBar *)navigationBar {
    navigationBar.tintColor = [UIColor whiteColor];
    navigationBar.barTintColor = [UIColor blackColor];
    navigationBar.translucent = NO;
}

@end
