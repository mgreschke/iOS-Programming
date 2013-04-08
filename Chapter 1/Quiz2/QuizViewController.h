//
//  QuizViewController.h
//  Quiz2
//
//  Created by Erin Parker on 4/5/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController
{
    int currentQuestionIndex;
    
    // Model Objects
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    // View Objects
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}

- (IBAction)showQuestion: (id)sender;
- (IBAction)showAnswer:(id)sender;

@end
