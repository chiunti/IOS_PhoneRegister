//
//  ViewController.m
//  Phone Register
//
//  Created by admin on 27/11/15.
//  Copyright © 2015 chiuntisoft. All rights reserved.
//

#import "Register.h"
#import <DigitsKit/DigitsKit.h>

@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self initDigit];
}

-(void) initDigit{
    DGTAuthenticateButton *authButton;
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            // TODO: associate the session userID with your user model
            NSString *msg = [NSString stringWithFormat:@"Teléfono: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Estás Logueado!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else if (error) {
            NSLog(@"Error de Autenticación: %@", error.localizedDescription);
        }
    }];
    authButton.center = self.view.center;
    //    authButton.digitsAppearance = [self makeTheme];
    [self.view addSubview:authButton];
}

- (DGTAppearance *)makeTheme {
    DGTAppearance *theme = [[DGTAppearance alloc] init];
    theme.bodyFont = [UIFont fontWithName:@"Noteworthy-Light" size:16];
    theme.labelFont = [UIFont fontWithName:@"Noteworthy-Bold" size:17];
    theme.accentColor = [UIColor colorWithRed:(255.0/255.0) green:(172/255.0) blue:(238/255.0) alpha:1];
    theme.backgroundColor = [UIColor colorWithRed:(240.0/255.0) green:(255/255.0) blue:(250/255.0) alpha:1];
    // TODO: Set a UIImage as a logo with theme.logoImage
    return theme;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnRegister:(id)sender {
    if ([self.outBtnRegister.titleLabel.text  isEqual: @"Register"]) {
        [[Digits sharedInstance] authenticateWithCompletion:^(DGTSession *session, NSError *error) {
            // Inspect session/error objects
            if (session.userID) {
                // TODO: associate the session userID with your user model
                self.PhoneNumber.text = session.phoneNumber;
                [self.outBtnRegister setTitle:@"Unregister" forState:UIControlStateNormal];
            } else if (error) {
                NSLog(@"Error de Autenticación: %@", error.localizedDescription);
            }
        }];
    } else {
        self.PhoneNumber.text = @"";
        [self.outBtnRegister setTitle:@"Register" forState:UIControlStateNormal];
        [[Digits sharedInstance] logOut ] ;
    }
}
@end
