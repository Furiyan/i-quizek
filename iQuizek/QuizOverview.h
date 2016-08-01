//
//  QuizOverview.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Photo;

@interface QuizOverview : NSObject

@property (copy, nonatomic) NSNumber * id;
@property (copy, nonatomic) NSString * title;
@property (nonatomic) Photo * mainPhoto;

@end
