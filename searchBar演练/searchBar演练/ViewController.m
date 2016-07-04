//
//  ViewController.m
//  searchBar演练
//
//  Created by 孙永济 on 16/6/15.
//  Copyright © 2016年 孙永济. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *storyBoardSearchbar;


@end

@implementation ViewController
/**
 * 1.将右边取消按钮改成汉字的最简单方法是在info.plist中将语言改成China
   2.改变searchbar取消文字的方法
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSearchController];
    self.storyBoardSearchbar.delegate = self;
    UITextField *searchField = [self.storyBoardSearchbar valueForKey:@"_searchField"];
    //文字颜色
    searchField.textColor = [UIColor orangeColor];
    //背景颜色
    searchField.backgroundColor= [UIColor lightGrayColor];
    //渲染颜色
    self.storyBoardSearchbar.tintColor = [UIColor orangeColor];
    //文字对齐方式
    searchField.textAlignment = NSTextAlignmentCenter;
    //更换放大镜的图片样式
    [self.storyBoardSearchbar setImage:[UIImage imageNamed:@"d_aini"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
}


- (void)setUpSearchController{
    UISearchController *sc = [[UISearchController alloc]initWithSearchResultsController:self];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 将取消文字改成自定义的方法
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{

    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    //1.将canclebutton在编辑的时候显示出来
    searchBar.showsCancelButton = YES;
    for(UIView *view in  [[[searchBar subviews] objectAtIndex:0] subviews]) {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
            UIButton * cancel =(UIButton *)view;
            [cancel setTitle:@"自定义" forState:UIControlStateNormal];
            cancel.titleLabel.font = [UIFont systemFontOfSize:14];
        }
    }
}
//结束编辑的时候将canclebutton隐藏了
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = NO;
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"点击了自定义按钮");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



@end
