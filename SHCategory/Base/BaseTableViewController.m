

#define Group 0
#define Plain 1

#import "BaseTableViewController.h"
#import "MJRefresh.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(UIView *)foot_vi{
    if (!_foot_vi) {
        _foot_vi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 0.0f)];
        UIImage *img = [UIImage imageNamed:@""];
        UIImageView *statusImgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width/2-img.size.width/2, 10.0f, img.size.width, img.size.height)];
        [statusImgView setImage:img];
        [_foot_vi addSubview:statusImgView];
    }
    return _foot_vi;
}
- (UILabel *)foot_la{
    if (!_foot_la) {
        _foot_la = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 0.0f)];
        _foot_la.text = @"暂无数据";
        _foot_la.textAlignment = NSTextAlignmentCenter;
        _foot_la.textColor = [UIColor blackColor];
    }
    return _foot_la;
}

- (UITableView *)tableView{
    if (!_tableView){
        _style = self.isPlain ? Plain : Group;
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height-64)style:_style];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView setBackgroundColor: [UIColor clearColor]];
        [_tableView setShowsVerticalScrollIndicator: NO]; 
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (@available(iOS 11.0, *)) {
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO ;
    }
    
    [self setEdgesForExtendedLayout: UIRectEdgeNone];
    [self setupRefresh];
    _page = 1;
}


#pragma mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
#pragma mark - UITavleView Dalegate
-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    return view;
}

- (void)setupRefresh{
    @weakify(self)
    if (_isheader) {
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            _temPage = _page;
            _page = 1;
            [weak_self requstDataWithInfo:nil :^(BOOL success) {
                if (success) {
                    [self.dataArr removeAllObjects];
                }
            }];

        }];
        header.lastUpdatedTimeLabel.hidden = YES;
        self.tableView.mj_header = header;
    }

    if (_isfooter) {
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
          
            _page ++;
            [weak_self requstDataWithInfo:nil :nil];
            
        }];
        self.tableView.mj_footer= footer;
        self.tableView.mj_footer.automaticallyHidden = YES;
    }
}

- (void)requstDataWithInfo:(NSDictionary *)info :(void(^)(BOOL success))complet{
    [self EndRefresh];
}

-(void)EndRefresh{
    if (_noMorePage == 0) {
        //[self ShowFootView:YES];
        [self showFootLabel:YES];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
    else if (_noMorePage == 1) {
        
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        [self.tableView.mj_header endRefreshing];
        
    }else{
        if (_page==1) {
            
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer resetNoMoreData];
            
        }else if(_page !=_noMorePage){
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        }
        else{
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    }
}

-(void)ShowFootView:(BOOL)is_show{
    if (is_show){
    
        [self.foot_vi setFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 80.0f)];
        [self.foot_vi setHidden:NO];
        self.tableView.tableFooterView = self.foot_vi;
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        
    }
    else{
    
        [self.foot_vi setFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 0.0f)];
        [self.foot_vi setHidden:YES];
        self.tableView.tableFooterView = self.foot_vi;
    }
}

- (void)showFootLabel:(BOOL)is_show{
    if (is_show){
    
        [self.foot_la setFrame:CGRectMake(0, 10, self.tableView.frame.size.width, 30.0f)];
        [self.foot_la setHidden:NO];
        self.tableView.tableFooterView = self.foot_la;
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        
    }
    else{
    
        [self.foot_la setFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 0.0f)];
        [self.foot_la setHidden:YES];
        self.tableView.tableFooterView = self.foot_la;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
