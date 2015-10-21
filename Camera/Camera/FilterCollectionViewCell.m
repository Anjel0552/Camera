//
//  FilterCollectionViewCell.m
//  Camera
//
//  Created by Anjel Villafranco on 10/19/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

#import "FilterCollectionViewCell.h"
#import "ImageEditing.h"
@implementation FilterCollectionViewCell

-(void)didMoveToWindow {
    
    [self runFilterBackground];
    
}
-(void)prepareForReuse {
    
    self.filterImageView.image = nil;
    [self runFilterBackground];
    
}

- (void)runFilterBackground {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{

        UIImage * filteredImage = filterImage(self.originalImage, self.filterName);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.filterImageView.image = filteredImage;
            
        });
 
    });
}
@end
