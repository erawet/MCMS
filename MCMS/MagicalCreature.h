//
//  MagicalCreature.h
//  MCMS
//
//  Created by Don Wettasinghe on 1/18/15.
//  Copyright (c) 2015 com.don. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject

@property NSString *name;
//@property NSString *desc;
@property UIImage *image;

-(instancetype)initWithName:(NSString *)name;



@end
