//
//  QuizProgressView.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizProgressView.h"

#import "ViewFactory.h"

#import "Masonry.h"

const CGFloat QuizProgressViewPreferredHeight = 6.0f;

@implementation QuizProgressView

#pragma mark - UIView Override(s)

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

#pragma mark - Reloading

- (void)reloadWithQuestionsInNumber:(NSUInteger)count {
    [self removeSegments];
    [self addSegmentsInNumber:count];
    [self makeConstraintsForSegments];
}

- (void)fillUpSegmentsInNumber:(NSUInteger)count {
    for (UIView * segment in self.segments) {
        segment.backgroundColor = [UIColor clearColor];
    }
    for (int segmentIndex = 0; segmentIndex < count; ++segmentIndex) {
        self.segments[segmentIndex].backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - Adding Subview(s)

- (void)addSegmentsInNumber:(NSUInteger)count {
    NSMutableArray<UIView *> * segments = [self.segments mutableCopy];
    for (int segmentIndex = 0; segmentIndex < count; ++ segmentIndex) {
        UIView * segment = [ViewFactory frame];
        [self addSubview:segment];
        [segments addObject:segment];
    }
    self.segments = segments;
}

#pragma mark - Removing Subview(s)

- (void)removeSegments {
    for (UIView * segment in self.segments) {
        [segment removeFromSuperview];
    }
    self.segments = @[];
}

#pragma mark - Making Constraint(s)

- (void)makeConstraintsForSegments {
    UIView * previousSegment;
    for (int segmentIndex = 0; segmentIndex < self.segments.count; ++segmentIndex) {
        UIView * currentSegment = self.segments[segmentIndex];
        UIView * nextSegment = segmentIndex < self.segments.count - 1 ? self.segments[segmentIndex + 1] : nil;
        [self makeConstraintsForSegment:currentSegment beforeSegment:nextSegment afterSegment:previousSegment];
        previousSegment = currentSegment;
    }
}

- (void)makeConstraintsForSegment:(UIView *)segment
                    beforeSegment:(UIView *)nextSegment
                     afterSegment:(UIView *)previousSegment {
    [segment mas_makeConstraints:^(MASConstraintMaker * make) {
        if (previousSegment) {
            make.leading.equalTo(previousSegment.mas_trailing);
            make.width.equalTo(previousSegment.mas_width);
        } else {
            make.leading.equalTo(self.mas_leading).with.offset(-1.0f);
        }
        make.top.equalTo(self.mas_top);
        if (nextSegment) {
            make.trailing.equalTo(nextSegment.mas_leading).with.offset(1.0f);
        } else {
            make.trailing.equalTo(self.mas_trailing).with.offset(1.0f);;
        }
        make.bottom.equalTo(self.mas_bottom);
    }];
}

@end
