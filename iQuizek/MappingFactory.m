//
//  MappingFactory.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "MappingFactory.h"

#import "Photo.h"
#import "QuizAnswer.h"
#import "QuizOverview.h"
#import "QuizQuestion.h"

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

+ (RKObjectMapping *)quizQuestionMapping {
    RKObjectMapping * mapping = [RKObjectMapping mappingForClass:[QuizQuestion class]];
    [mapping addAttributeMappingsFromDictionary:@{ @"order" : @"order", @"text" : @"text" }];
    [mapping addPropertyMapping:
        [RKRelationshipMapping relationshipMappingFromKeyPath:@"answers"
                                                    toKeyPath:@"answers"
                                                  withMapping:[MappingFactory quizAnswerMapping]]];
    return mapping;
}

+ (RKObjectMapping *)quizAnswerMapping {
    RKObjectMapping * mapping = [RKObjectMapping mappingForClass:[QuizAnswer class]];
    [mapping addAttributeMappingsFromDictionary:@{ @"order" : @"order", @"text" : @"text", @"isCorrect" : @"correct" }];
    return mapping;
}

@end
