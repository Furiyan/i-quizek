//
//  MappingFactory.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "MappingFactory.h"

#import "Photo.h"
#import "QuizOverview.h"

#import "RKObjectMapping.h"
#import "RKRelationshipMapping.h"

@implementation MappingFactory

+ (RKObjectMapping *)quizOverviewMapping {
    RKObjectMapping * mapping = [RKObjectMapping mappingForClass:[QuizOverview class]];
    [mapping addAttributeMappingsFromDictionary:@{ @"id" : @"id", @"title" : @"title" }];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"mainPhoto"
                                                                            toKeyPath:@"mainPhoto"
                                                                          withMapping:[MappingFactory photoMapping]]];
    return mapping;
}

+ (RKObjectMapping *)photoMapping {
    RKObjectMapping * mapping = [RKObjectMapping mappingForClass:[Photo class]];
    [mapping addAttributeMappingsFromDictionary:@{ @"url" : @"url" }];
    return mapping;
}

@end
