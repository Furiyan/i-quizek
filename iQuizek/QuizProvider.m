//
//  QuizProvider.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizProvider.h"

#import "DescriptorFactory.h"
#import "QuizOverview.h"
#import "QuizQuestion.h"

#import "RKObjectManager.h"

static NSString * const QuizEndpointsBase = @"http://quiz.o2.pl/api/v1/";
static NSString * const QuizOverviewsPath = @"quizzes/0/100";
static NSString * const QuizDetailsPath = @"quiz/%@/0";

@interface QuizProvider ()

@property (nonatomic) RKObjectManager * objectManager;

@end

@implementation QuizProvider

#pragma mark - NSObject Override(s)

- (instancetype)init {
    if (self = [super init]) {
        [self setUpObjectManager];
    }
    return self;
}

#pragma mark - Fetching the Data

- (void)fetchQuizOverviewsWithCompletion:(void (^)(NSArray<QuizOverview *> * quizzes, NSError * error))completion {
    [self.objectManager getObjectsAtPath:QuizOverviewsPath
                              parameters:nil
                                 success:
        ^(RKObjectRequestOperation * operation, RKMappingResult * mappingResult) {
            completion([mappingResult array], nil);
        }
                                 failure:
        ^(RKObjectRequestOperation * operation, NSError * error) {
            completion(@[], error);
        }];
}

- (void)fetchQuestionsOfQuizWithId:(NSNumber *)quizId
                    withCompletion:(void (^)(NSArray<QuizQuestion *> * questions, NSError * error))completion {
    [self.objectManager getObjectsAtPath:[NSString stringWithFormat:QuizDetailsPath, quizId]
                              parameters:nil
                                 success:
        ^(RKObjectRequestOperation * operation, RKMappingResult * mappingResult) {
            NSSortDescriptor * sortByOrder = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
            NSArray<QuizQuestion *> * questions = [mappingResult.set sortedArrayUsingDescriptors:@[sortByOrder]];
            for (QuizQuestion * question in questions) {
                question.answers = [question.answers sortedArrayUsingDescriptors:@[sortByOrder]];
            }
            completion(questions, nil);
        }
                                 failure:
        ^(RKObjectRequestOperation * operation, NSError * error) {
            completion(@[], error);
        }];
}

#pragma mark - Setup

- (void)setUpObjectManager {
    self.objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:QuizEndpointsBase]];
    [self.objectManager addResponseDescriptor:[DescriptorFactory quizOverviewResponseDescriptor]];
    [self.objectManager addResponseDescriptor:[DescriptorFactory quizQuestionResponseDescriptor]];
}

@end
