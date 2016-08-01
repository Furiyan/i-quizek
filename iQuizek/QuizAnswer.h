//
//  QuizAnswer.h
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizAnswer : NSObject

@property (copy, nonatomic) NSNumber * order;
@property (copy, nonatomic) NSString * text;
@property (nonatomic) BOOL correct;

@end
