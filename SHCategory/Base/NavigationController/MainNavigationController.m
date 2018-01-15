

#import "MainNavigationController.h"


@interface MainNavigationController ()

@end

@implementation MainNavigationController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if(self.viewControllers.count>0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
