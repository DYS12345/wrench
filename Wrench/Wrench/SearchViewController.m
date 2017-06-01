//
//  SearchViewController.m
//  Wrench
//
//  Created by dong on 2017/6/1.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    [self.searchBar performSelector:@selector(becomeFirstResponder) withObject:self afterDelay:0.5];
}

- (IBAction)cancelBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
