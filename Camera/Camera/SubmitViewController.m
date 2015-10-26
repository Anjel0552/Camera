//
//  SubmitViewController.m
//  Camera
//
//  Created by Anjel Villafranco on 10/19/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

#import "SubmitViewController.h"

#import <Parse/Parse.h>

@interface SubmitViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *filteredImageView;
@property (weak, nonatomic) IBOutlet UITextView *captionTextView;

@end

@implementation SubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated  {

    self.filteredImageView.image = self.filteredImage;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)submitSelfie:(id)sender {
    
    PFObject * selfie = [PFObject objectWithClassName:@"Selfie"];
    
//    UIImagePNGRepresentation(SELF.filteredImage);
    PFFile * selfie = [PFObject objectWithClassName:@"Selfie"];
    
    NSData * imageData = UIImagePNGRepresentation(self.filteredImage);
    PFFile * imageFile = [PFFile fileWithData:imageData];
    
    selfie[@"image"] = imageFile;
    selfie[@"caption"] = self.captionTextView.text;
    selfie[@"user"] = [PFUser currentUser]; 
    [selfie saveInBackground];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
