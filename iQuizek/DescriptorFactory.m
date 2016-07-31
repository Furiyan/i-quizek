//
//  DescriptorFactory.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "DescriptorFactory.h"

#import "MappingFactory.h"

#import "RKObjectMapping.h"
#import "RKResponseDescriptor.h"

@implementation DescriptorFactory

+ (RKResponseDescriptor *)quizOverviewResponseDescriptor {
    return [RKResponseDescriptor responseDescriptorWithMapping:[MappingFactory quizOverviewMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:nil
                                                       keyPath:@"items"
                                                   statusCodes:nil];
}

@end
