//
//  QuizResultViewController.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizResultViewController.h"

#import "QuizResultView.h"
#import "ViewFactory.h"

@interface QuizResultViewController ()

@property (nonatomic) CGFloat percentageResult;

@end

@implementation QuizResultViewController

#pragma mark - Creating

- (instancetype)initWithPercentageResult:(CGFloat)percentageResult {
    if (self = [super init]) {
        self.percentageResult = percentageResult;
    }
    return self;
}

#pragma mark - UIViewController Override(s)

- (void)loadView {
    QuizResultView * quizResultView = [ViewFactory quizResultView];
    self.view = self.quizResultView = quizResultView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.quizResultView reloadWithPercentageResult:self.percentageResult];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
