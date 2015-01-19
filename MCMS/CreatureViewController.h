//
//  CreatureViewController.h
//  MCMS
//
//  Created by Don Wettasinghe on 1/18/15.
//  Copyright (c) 2015 com.don. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface CreatureViewController : UIViewController

@property MagicalCreature *creature;
@property UITableView *rootTableView;
@property (strong, nonatomic) IBOutlet UIImageView *creatureImage;

@end
