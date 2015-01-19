//
//  ViewController.m
//  MCMS
//
//  Created by Don Wettasinghe on 1/18/15.
//  Copyright (c) 2015 com.don. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *creatures;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create creatures
    MagicalCreature *doverDemon = [[MagicalCreature alloc] initWithName:@"Dover Demon" ];
    doverDemon.image = [UIImage imageNamed:@"DoverDemon.jpeg"];
    
    MagicalCreature *goatman = [[MagicalCreature alloc] initWithName:@"Goatman"];
    goatman.image = [UIImage imageNamed:@"Goatman.jpge"];
    
    MagicalCreature *minotaur = [[MagicalCreature alloc] initWithName:@"Minotaur"];
    minotaur.image = [UIImage imageNamed:@"Minotaur.jpge"];
    
    self.creatures = [NSMutableArray arrayWithObjects:doverDemon, goatman, minotaur, nil];
    
}

#pragma marks uitableviewDelegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.creatures count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    
    return cell;
}


// adding creatures helper

- (void) addCreatureMethod {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add New Creature" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Creature Name";
    }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *textOne = alertController.textFields[0];
        
        MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName:textOne.text];
        [self.creatures addObject:newCreature];
        [self.tableView reloadData];
        
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:saveAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}

- (IBAction)onAddButtonTapped:(UIBarButtonItem *)sender {
    [self addCreatureMethod];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    CreatureViewController *cVC = segue.destinationViewController;
    // get teh creature tapped
    NSIndexPath *selectedPath = self.tableView.indexPathForSelectedRow;
    MagicalCreature *creature = [self.creatures objectAtIndex:selectedPath.row];
    // set the VC's properties
    cVC.creature = creature;
    cVC.rootTableView = self.tableView;
}




@end
