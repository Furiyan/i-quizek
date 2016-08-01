//
//  DescriptorFactory.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKResponseDescriptor;

@interface DescriptorFactory : NSObject

+ (RKResponseDescriptor *)quizOverviewResponseDescriptor;
+ (RKResponseDescriptor *)quizQuestionResponseDescriptor;

@end
