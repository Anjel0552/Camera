//
//  FilterViewController.m
//  Camera
//
//  Created by Anjel Villafranco on 10/19/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

#import "FilterViewController.h"

#import "FilterCollectionViewCell.h"

#import "ImageEditing.h"

//UIImage * resizeImage(UIImage * image, CGSize newSize) {
//    
//    UIGraphicsBeginImageContext(newSize);
//    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//    
//}


@interface FilterViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;

@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;

@end

@implementation FilterViewController
{

    NSArray * filterNames;


}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.filterImageView.image = self.originalImage;

    self.filterCollectionView.dataSource = self;
    self.filterCollectionView.delegate = self;
    
    filterNames = [CIFilter filterNamesInCategory:kCICategoryColorEffect];
    
    filterNames = [CIFilter filterNamesInCategories:nil];
    
    [self.filterCollectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {


    return filterNames.count;

}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FilterCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilterCell" forIndexPath:indexPath];
    
    cell.filterName = filterNames[indexPath.item];
    
//#warning fix this
    UIImage * resizedImage = resizeImage(self.originalImage, CGSizeMake(80, 80));
    cell.originalImage = resizedImage;

    return cell;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    FilterCollectionViewCell * cell = (FilterCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        UIImage * filteredImage = filterImage(self.originalImage, cell.filterName);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            cell.filterImageView.image = filteredImage;
            
        });
        
    });
    
//    self.filterImageView.image = filterImage(self.originalImage, cell.filterName);
    
    
}

@end
















