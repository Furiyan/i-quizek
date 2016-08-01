//
//  ViewFactory.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizView;

@interface ViewFactory : NSObject

+ (QuizView *)quizView;
    
+ (UILabel *)quizTitleLabel;
+ (UIView *)quizTitleContainer;
+ (UIImageView *)quizImageView;

+ (UITableView *)quizzesTableView;

@end
