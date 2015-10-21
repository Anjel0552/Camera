//
//  FilterCollectionViewCell.h
//  Camera
//
//  Created by Anjel Villafranco on 10/19/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterCollectionViewCell : UICollectionViewCell

@property UIImage * originalImage;
@property NSString * filterName;

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;

@end
