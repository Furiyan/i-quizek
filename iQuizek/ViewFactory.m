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
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"Przykładowy tytuł";
    return label;
}

+ (UITableView *)quizzesTableView {
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [tableView registerClass:[QuizCell class] forCellReuseIdentifier:QuizCellIdentifier];
    return tableView;
}

@end
