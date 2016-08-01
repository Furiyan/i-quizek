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

@implementation ViewFactory

+ (QuizView *)quizView {
    return [[QuizView alloc] initWithFrame:CGRectZero];
}

+ (UILabel *)quizTitleLabel {
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightThin];
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.highlightedTextColor = [UIColor blackColor];
    return label;
}

+ (UIView *)quizTitleContainer {
    UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor blackColor];
    return view;
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

@end
