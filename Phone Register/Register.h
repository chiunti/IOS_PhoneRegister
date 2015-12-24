//
//  ViewController.h
//  Phone Register
//
//  Created by admin on 27/11/15.
//  Copyright © 2015 chiuntisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Register : UIViewController
- (IBAction)btnRegister:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *PhoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *outBtnRegister;


@end

