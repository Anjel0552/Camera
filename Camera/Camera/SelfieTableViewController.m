//
//  SelfieTableViewController.m
//  Camera
//
//  Created by Anjel Villafranco on 10/19/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

#import "SelfieTableViewController.h"

#import "SelfieTableViewCell.h"

@interface SelfieTableViewController ()



@end

@implementation SelfieTableViewController
{
    
    NSMutableArray * selfies;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return selfies.count;
}

- (UITableView *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    SelfieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SelfieCell" forIndexPath:indexPath]; 

}

@end
