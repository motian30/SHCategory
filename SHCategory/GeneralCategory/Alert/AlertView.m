
#define MainScreenRect [UIScreen mainScreen].bounds
#define AlertView_W     250.0f
#define MessageMin_H    10.0f       //messagelab的最小高度
#define MessageMAX_H    200.0f      //messagelab的最大高度，当超过时，文本会以...结尾
#define Title_H      20.0f
#define Btn_H        30.0f

#define LightGrayColor   [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1]
#define TitleColor   [UIColor colorWithRed:34.0/255.0 green:34.0/255.0 blue:34.0/255.0 alpha:1]
#define MessageColor   [UIColor lightGrayColor]
#define CancelBtColor  [UIColor lightGrayColor]
#define OtherBtColor   [UIColor lightGrayColor]

#define TitleFont       [UIFont boldSystemFontOfSize:17];
#define MessageFont     [UIFont systemFontOfSize:14];
#define BtnTitleFont    [UIFont systemFontOfSize:15];

#import "AlertView.h"
#import "UILabel+Space.h"

@interface AlertView()
@property (nonatomic,strong)UIWindow *alertWindow;
@property (nonatomic,strong)UIView *alertView;

@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UILabel *messageLab;
@property (nonatomic,strong)UIButton *cancelBtn;
@property (nonatomic,strong)UIButton *otherBtn;
@end

@implementation AlertView



/**
 创建弹框

 @param title   弹框标题
 @param message 弹框内容
 @param cancelTitle 取消按钮
 @param otherBtnTitle 其他按钮
 @param block 按钮点击block
 @return 弹框
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelBtnTitle:(NSString *)cancelTitle otherBtnTitle:(NSString *)otherBtnTitle clickIndexBlock:(AlertClickIndexBlock)block{
    if(self=[super init]){
        self.frame=MainScreenRect;
        self.backgroundColor=[UIColor colorWithWhite:.2 alpha:.7];
        
        _alertView=[[UIView alloc] init];
        _alertView.backgroundColor=[UIColor whiteColor];
        _alertView.layer.cornerRadius=6.0;
        _alertView.layer.masksToBounds=YES;
        _alertView.userInteractionEnabled=YES;
        
        
        if (title) {
            _titleLab=[[UILabel alloc] initWithFrame:CGRectMake(0, 10, AlertView_W, Title_H)];
            _titleLab.text=title;
            _titleLab.textAlignment=NSTextAlignmentCenter;
            _titleLab.textColor = TitleColor;
            _titleLab.font = TitleFont;
            
        }
        
        CGFloat messageLabSpace = 25;
        _messageLab = [[UILabel alloc] init];
        _messageLab.backgroundColor = [UIColor whiteColor];
        _messageLab.text = message;
        _messageLab.textColor = MessageColor;
        _messageLab.font = MessageFont;
        _messageLab.numberOfLines=0;
        
        
        _messageLab.lineBreakMode=NSLineBreakByTruncatingTail;
        _messageLab.characterSpace=2;
        _messageLab.lineSpace=3;
        CGSize labSize = [_messageLab getLableRectWithMaxWidth:AlertView_W-messageLabSpace*2];
        CGFloat messageLabAotuH = labSize.height < MessageMin_H?MessageMin_H:labSize.height;
        CGFloat endMessageLabH = messageLabAotuH > MessageMAX_H?MessageMAX_H:messageLabAotuH;
        _messageLab.frame=CGRectMake(messageLabSpace, _titleLab.frame.size.height+_titleLab.frame.origin.y+15, AlertView_W-messageLabSpace*2, endMessageLabH);
        
        
        //计算_alertView的高度
        _alertView.frame = CGRectMake(0, 0, AlertView_W, _messageLab.frame.size.height + Title_H + Btn_H + 50);
        _alertView.center = self.center;
        [self addSubview:_alertView];
        [_alertView addSubview:_titleLab];
        [_alertView addSubview:_messageLab];
        
        if (cancelTitle) {
            _cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            [_cancelBtn setTitle:cancelTitle forState:UIControlStateNormal];
            [_cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            _cancelBtn.backgroundColor = OtherBtColor;
            _cancelBtn.titleLabel.font = BtnTitleFont;
            _cancelBtn.layer.cornerRadius=3;
            _cancelBtn.layer.masksToBounds=YES;
            [_cancelBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_alertView addSubview:_cancelBtn];
        }
        
        if (otherBtnTitle) {
            _otherBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            [_otherBtn setTitle:otherBtnTitle forState:UIControlStateNormal];
            [_otherBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            _otherBtn.titleLabel.font = BtnTitleFont;
            _otherBtn.layer.cornerRadius=3;
            _otherBtn.layer.masksToBounds=YES;
            _otherBtn.backgroundColor = OtherBtColor;
            
            [_otherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_alertView addSubview:_otherBtn];
        }
        
        CGFloat btnLeftSpace = 20;//btn到左边距
        CGFloat btn_y = _alertView.frame.size.height-40;
        if (cancelTitle && !otherBtnTitle) {
            _cancelBtn.tag=0;
            _cancelBtn.frame=CGRectMake(btnLeftSpace, btn_y, AlertView_W-btnLeftSpace*2, Btn_H);
        }else if (!cancelTitle && otherBtnTitle){
            _otherBtn.tag=0;
            _otherBtn.frame=CGRectMake(btnLeftSpace, btn_y, AlertView_W-btnLeftSpace*2, Btn_H);
        }else if (cancelTitle && otherBtnTitle){
            _cancelBtn.tag=0;
            _otherBtn.tag=1;
            CGFloat btnSpace = 20;//两个btn之间的间距
            CGFloat btn_w =(AlertView_W-btnLeftSpace*2-btnSpace)/2;
            _cancelBtn.frame=CGRectMake(btnLeftSpace, btn_y, btn_w, Btn_H);
            _otherBtn.frame=CGRectMake(_alertView.frame.size.width-btn_w-btnLeftSpace, btn_y, btn_w, Btn_H);
        }
        
        self.clickBlock=block;
        
    }
    return self;
}


- (void)btnClick:(UIButton *)btn{
    
    if (self.clickBlock) {
        self.clickBlock(btn.tag);
    }
    
    if (!_dontDissmiss) {
        [self dismissAlertView];
    }
    
    
}

- (void)showAlertView{
    
    _alertWindow=[[UIWindow alloc] initWithFrame:MainScreenRect];
    _alertWindow.windowLevel=UIWindowLevelAlert;
    [_alertWindow becomeKeyWindow];
    [_alertWindow makeKeyAndVisible];
    
    [_alertWindow addSubview:self];
    
    [self setShowAnimation];
    
    switch (self.textAlignment) {
        case TextAlignmentCenter:
            _messageLab.textAlignment=NSTextAlignmentCenter;
            break;
            
        case TextAlignmentLeft:
            _messageLab.textAlignment=NSTextAlignmentLeft;
            break;
		    
	case TextAlignmentRight:
		_messageLab.textAlignment=NSTextAlignmentRight;
		break;
        default:
            break;
    }
    
}

- (void)dismissAlertView{
    [self removeFromSuperview];
    [_alertWindow resignKeyWindow];
}

- (void)setShowAnimation{
    
    switch (_animationStyle) {
            
        case AnimationDefault:
        {
            _alertView.transform = CGAffineTransformMakeScale(.7, .7);
            [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                _alertView.transform = CGAffineTransformIdentity;
                
                
            } completion:nil];
        }
            break;
            
        case AnimationLeftShake:{
            
            CGPoint startPoint = CGPointMake(-AlertView_W, self.center.y);
            _alertView.layer.position=startPoint;
            
            
            [UIView animateWithDuration:.6 delay:0 usingSpringWithDamping:.6 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                _alertView.layer.position=self.center;
                
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case AnimationTopShake:{
            
            CGPoint startPoint = CGPointMake(self.center.x, -_alertView.frame.size.height);
            _alertView.layer.position=startPoint;
            
            [UIView animateWithDuration:.6 delay:0 usingSpringWithDamping:.6 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                _alertView.layer.position=self.center;
                
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case AnimationNO:{
            
        }
            
            break;
            
        default:
            break;
    }
    
}

- (void)setTitleColor:(UIColor *)titleColor{
    self.titleLab.textColor = titleColor;
}

- (void)setMessageColor:(UIColor *)messageColor{
    self.messageLab.textColor = messageColor;
}


- (void)setCancelBtColor:(UIColor *)cancelBtColor{
    self.cancelBtn.backgroundColor = cancelBtColor;
}

- (void)setOtherBtColor:(UIColor *)otherBtColor{
    self.otherBtn.backgroundColor = otherBtColor;
}


- (void)setTitleFont:(CGFloat)titleFont {
	self.titleLab.font = [UIFont systemFontOfSize:titleFont];
}

- (void)setMessageFont:(CGFloat)messageFont {
	self.messageLab.font = [UIFont systemFontOfSize:messageFont];
}

- (void)setButtonFont:(CGFloat)buttonFont {
	self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:buttonFont];
	self.otherBtn.titleLabel.font = [UIFont systemFontOfSize:buttonFont];
}


- (void)setAnimationStyle:(ShowAnimationStyle )animationStyle{
    
    _animationStyle = animationStyle;
}

- (void)setDontDissmiss:(BOOL)dontDissmiss{
    _dontDissmiss = dontDissmiss;
}

@end


