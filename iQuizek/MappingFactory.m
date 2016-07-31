//
//  MappingFactory.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "MappingFactory.h"

#import "QuizOverview.h"

#import "RKObjectMapping.h"

@implementation MappingFactory

+ (RKObjectMapping *)quizOverviewMapping {
    RKObjectMapping * quizOverviewMapping = [RKObjectMapping mappingForClass:[QuizOverview class]];
    [quizOverviewMapping addAttributeMappingsFromDictionary:@{ @"title" : @"title" }];
    return quizOverviewMapping;
}

@end
