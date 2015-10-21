//
//  ImageEditing.h
//  Camera
//
//  Created by Anjel Villafranco on 10/21/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

#import <UIKit/UIkit.h>
#ifndef ImageEditing_h
#define ImageEditing_h



static UIImage * resizeImage(UIImage * image, CGSize newSize) {
    
    // only works if newSize is a square
    BOOL isPortrait = image.size.width < image.size.height;
    
    CGFloat scale = isPortrait ? newSize.width / image.size.width : newSize.width / image.size.height;
    
    CGFloat scaleHeight = isPortrait ? image.size.height * scale : newSize.width;
    CGFloat scaleWidth = isPortrait ? newSize.width : image.size.height * scale;
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(newSize.width - scaleWidth, newSize.width - scaleHeight, scaleWidth, scaleHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}

static UIImage * flipImage(UIImage * image) {
    
    UIGraphicsBeginImageContext(image.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(ctx, -1.0, 1.0);
    
    [image drawInRect:CGRectMake(-image.size.width, 0, image.size.width, image.size.height)];

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;

}

static UIImage * filterImage(UIImage * originalImage, NSString * filterName) {
    
 
    
    CIContext *context = [CIContext contextWithOptions:nil];               // 1
    
    CIImage *image = [CIImage imageWithCGImage:originalImage.CGImage];               // 2
    
    CIFilter *filter = [CIFilter filterWithName:filterName];           // 3
    
    if (![[filter inputKeys] containsObject:kCIInputImageKey]) { return nil; }
    
    [filter setValue:image forKey:kCIInputImageKey];
    
    //    [filter setValue:@0.8f forKey:kCIInputIntensityKey];
    
    CIImage * filteredImage = [filter valueForKey:kCIOutputImageKey];              // 4
    
//    CGRect extent = [filteredImage extent];
    
//    CGImageRef cgImage = [context createCGImage:filteredImage fromRect:extent];   // 5
    
    //    self.filterImageView.image = [UIImage imageWithCIImage:filteredImage];
//        self.filterImageView.image = [UIImage imageWithCGImage:cgImage];
    return [UIImage imageWithCIImage:filteredImage];
    
}


#endif /* ImageEditing_h */
