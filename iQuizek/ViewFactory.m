//
//  ViewFactory.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "ViewFactory.h"

#import "QuizCell.h"
#import "QuizView.h"

#import <UIKit/UIKit.h>

@implementation ViewFactory

+ (QuizView *)quizView {
    return [[QuizView alloc] initWithFrame:CGRectZero];
}

+ (UILabel *)quizTitleLabel {
    UILabel * quizTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    quizTitleLabel.text = @"Przykładowy tytuł";
    return quizTitleLabel;
}

+ (UITableView *)quizzesTableView {
    UITableView * quizzesTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [quizzesTableView registerClass:[QuizCell class] forCellReuseIdentifier:QuizCellIdentifier];
    return quizzesTableView;
}

@end
