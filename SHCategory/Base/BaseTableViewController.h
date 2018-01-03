
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface BaseTableViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    
    NSInteger _style;
    NSInteger _page;
    NSInteger _temPage;
    NSInteger _noMorePage;

    CGRect curOperateCellRect; //当前cell的对(self.view）的坐标
}
@property(nonatomic, assign) BOOL isPlain;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (strong, nonatomic) UITableView *tableView;

@property(nonatomic, strong) UIView *foot_vi;
@property(nonatomic, strong) UILabel *foot_la;

@property(nonatomic, assign) BOOL isheader;

@property(nonatomic, assign) BOOL isfooter;

- (void)requstDataWithInfo:(NSDictionary *)info :(void(^)(BOOL success))complet;

- (void)setupRefresh;

-(void)EndRefresh;

-(void)ShowFootView:(BOOL)is_show;
-(void)showFootLabel:(BOOL)is_show;

@end
