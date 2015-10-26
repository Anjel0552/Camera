//
//  SelfieTableViewCell.m
//  Camera
//
//  Created by Anjel Villafranco on 10/19/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

#import "SelfieTableViewCell.h"

@interface SelfieTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *selfieImageView;


@end

@implementation SelfieTableViewCell

#warning set image based on selfieImage

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
