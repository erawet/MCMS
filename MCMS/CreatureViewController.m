//
//  CreatureViewController.m
//  MCMS
//
//  Created by Don Wettasinghe on 1/18/15.
//  Copyright (c) 2015 com.don. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (strong, nonatomic) IBOutlet UIView *hideView;
@property (strong, nonatomic) IBOutlet UITextField *hideText;

@property (strong, nonatomic) IBOutlet UIView *normalView;
@property (strong, nonatomic) IBOutlet UITextField *normalText;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateDisplayNameAndDescription];
    self.navigationItem.title=self.creature.name;
}

-(void)updateDisplayNameAndDescription {
    self.normalText.text = self.creature.name;
    self.creatureImage.image = self.creature.image;
}

-(void)updateCreatureWithName:(NSString *)name {
    self.creature.name = name;
}

- (IBAction)onEditTapped:(UIBarButtonItem *)sender {
    
    if (self.editing) {
        sender.style = UIBarButtonItemStylePlain;
        sender.title = @"Edit";
        
        [self updateCreatureWithName:self.hideText.text];
        [self updateDisplayNameAndDescription];
     
        [self.rootTableView reloadData];

        self.normalText.text= self.hideText.text;
        self.normalView.hidden=NO;
        self.hideView.hidden=YES;
        
        [self.hideText resignFirstResponder];
        
    } else {
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";
        self.normalView.hidden=YES;
        self.hideView.hidden=NO;
        self.hideText.text= self.creature.name;
    }
    self.editing = !self.editing;
    
}



@end
