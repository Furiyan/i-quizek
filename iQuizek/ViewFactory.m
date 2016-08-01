//
//  ViewFactory.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "ViewFactory.h"

#import "QuizCell.h"
#import "QuizOverviewView.h"
#import "QuizQuestionView.h"
#import "QuizView.h"

#import "Masonry.h"

@implementation ViewFactory

+ (QuizOverviewView *)quizOverviewView {
    return [[QuizOverviewView alloc] initWithFrame:CGRectZero];
}

+ (QuizView *)quizView {
    return [[QuizView alloc] initWithFrame:CGRectZero];
}

+ (QuizQuestionView *)quizQuestionView {
    return [[QuizQuestionView alloc] initWithFrame:CGRectZero];
}

+ (UILabel *)quizQuestionLabel {
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:18.0f weight:UIFontWeightThin];
    label.textColor = [UIColor whiteColor];
    return label;
}

+ (UILabel *)quizTitleLabel {
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightThin];
    label.textColor = [UIColor whiteColor];
    label.highlightedTextColor = [UIColor blackColor];
    return label;
}

+ (UIImageView *)quizImageView {
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.backgroundColor = [UIColor blackColor];
    return imageView;
}

+ (UITableView *)quizzesTableView {
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [tableView registerClass:[QuizCell class] forCellReuseIdentifier:QuizCellIdentifier];
    tableView.rowHeight = [QuizCell preferredHeight];
    tableView.separatorInset = UIEdgeInsetsZero;
    tableView.backgroundColor = [UIColor blackColor];
    return tableView;
}

+ (UIView *)quizTitleContainer {
    UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor blackColor];
    return view;
}

+ (UIView *)horizontalHairline {
    UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor whiteColor];
    [view mas_makeConstraints:^(MASConstraintMaker * make) {
        make.height.equalTo(@1.0f);
    }];
    return view;
}

+ (UIButton *)button {
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectZero];
    button.titleLabel.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightThin];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor blackColor];
    button.layer.borderWidth = 1.0f;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.cornerRadius = 6.0f;
    [button mas_makeConstraints:^(MASConstraintMaker * make) {
        make.height.equalTo(@44.0f);
    }];
    return button;
}

+ (UIView *)container {
    UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

@end
