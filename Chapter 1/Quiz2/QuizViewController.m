//
//  QuizViewController.m
//  Quiz2
//
//  Created by Erin Parker on 4/5/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self ) {
        // Create two arrays and make pointers to them
        questions = [[NSMutableArray alloc] init];
        answers = [[NSMutableArray alloc] init];
        
        // Add questions and answers to arrays
        [questions addObject:@"What is 7+7?"];
        [answers addObject:@"14"];
        
        [questions addObject:@"How old are you?"];
        [answers addObject:@"24"];
        
        [questions addObject:@"Where do you live?"];
        [answers addObject:@"SF"];
    }
    
    // Return the address of the new object
    return self;
}

- (IBAction)showQuestion:(id)sender
{

    currentQuestionIndex++;
    
    if (currentQuestionIndex == [questions count]) {
        currentQuestionIndex = 0;
    }
    
    NSString *question = [questions objectAtIndex:currentQuestionIndex];
    
    NSLog(@"Displaying question: %@", question);
    
    [questionField setText:question];
    
    [answerField setText:@"???"];
}


- (IBAction)showAnswer:(id)sender
{
 
    NSString *answer = [answers objectAtIndex:currentQuestionIndex];
    
    [answerField setText:answer];
}


@end