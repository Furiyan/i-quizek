//
//  ViewFactory.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizView, UILabel, UITableView;

@interface ViewFactory : NSObject

+ (QuizView *)quizView;
    
+ (UILabel *)quizTitleLabel;

+ (UITableView *)quizzesTableView;

@end
