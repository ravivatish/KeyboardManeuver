//
//  ViewController.m
//  KeyboardManeuver
//
//  Created by Ravinder Vatish on 7/27/15.
//  Copyright (c) 2015 Ravinder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *KeybaordHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ButtonToMove;
@property (strong, nonatomic) NSLayoutConstraint *copyofButtonToMove;

@property (weak, nonatomic) IBOutlet UITextField *textBox;

-(void) observeKeyboard;
- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _copyofButtonToMove = [[NSLayoutConstraint alloc]init];
    
    [self observeKeyboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) observeKeyboard
{
    //observer keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}


- (void)keyboardWillShow:(NSNotification *)notification {
//        NSDictionary *info = [notification userInfo];
//        NSValue *kbFrame = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
//        NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//        CGRect keyboardFrame = [kbFrame CGRectValue];
//     
//        CGFloat height = keyboardFrame.size.height;
//     
//        NSLog(@"Updating constraints.");
//        // Because the "space" is actually the difference between the bottom lines of the 2 views,
//        // we need to set a negative constant value here.
//       self.keyboardHeight.constant = -height;
     NSDictionary* info = [notification userInfo];
    CGRect kKeyBoardFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat height =  kKeyBoardFrame.size.height;
    //keyboardFrame.size.height;
    //[yourView setFrame:CGRectMake(0, kKeyBoardFrame.origin.y-yourView.frame.size.height, 320, yourView.frame.size.height)];
    
    _copyofButtonToMove.constant = self.ButtonToMove.constant;
    NSLog(@"value %f", _copyofButtonToMove.constant);
     self.ButtonToMove.constant= height;
    
//
//        [UIView animateWithDuration:animationDuration animations:^{
//                [self.view layoutIfNeeded];
//            }];
}


- (void)keyboardWillHide:(NSNotification *)notification {
   
     // self.ButtonToMove.constant = height;
//    NSDictionary* info = [notification userInfo];
//    CGRect kKeyBoardFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    CGFloat height =  kKeyBoardFrame.size.height;
//    self.ButtonToMove.constant = height;
//        NSDictionary *info = [notification userInfo];
//        NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//     
//        self.keyboardHeight.constant = 0;
//        [UIView animateWithDuration:animationDuration animations:^{
//                [self.view layoutIfNeeded];
//            }];
    self.ButtonToMove.constant = _copyofButtonToMove.constant;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
    
}



//- (IBAction)dismissKeyboard:(id)sender {
   // [self.textBox resignFirstResponder];
//}

@end
