//
//  CRTabBarController.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/25.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRTabBarController.h"

// 用于记录tabbar的高度，用于可复用于手动适配
static CGFloat tabbarHeight;

@interface CRTabBarController ()<CRTabbarDelegate>

#pragma mark - view
// 自定义的tabbarView，放在tabVC上面
@property(nonatomic, strong)UIView *customBarView;
// 自定义tabbar
@property(nonatomic, strong)CRTabbar *crTabbar;
// 存储数组
@property(nonatomic, strong)NSMutableArray *itemArray;

@end

@implementation CRTabBarController

#pragma mark - 视图控制器生命周期
- (void)viewDidLoad {
    self.itemArray = [NSMutableArray array];
    [super viewDidLoad];
    // 隐藏原生的TabBarView
    [self hideOriginalTabbar];
    // 创建自定义TabBarView
    [self createCustomeTabbarView];
}
- (void)dealloc{
    self.itemArray = nil;
}
#pragma mark - 视图创建
- (void)createCustomeTabbarView{

    [self.view addSubview:self.customBarView];
    [self.customBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(SCREENH - tabbarHeight);
        make.left.and.right.offset(0);
        make.height.offset(tabbarHeight);
    }];
    
    // 创建自定义TabBar
    self.crTabbar = [[CRTabbar alloc]init];
    self.crTabbar.backgroundColor = MUArc4Random;
    self.crTabbar.tabbarDelegate = self;
    [self.customBarView addSubview:self.crTabbar];
    [self.crTabbar itemWithNormalImage:@"peng" andHeighImage:@"pengi2" andTitle:@"朋友"];
    [self.crTabbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.customBarView.mas_centerX);
        make.centerY.equalTo(self.customBarView.mas_centerY);
        make.width.equalTo(self.customBarView.mas_width);
        make.height.equalTo(self.customBarView.mas_height);
    }];
    
    for (int i = 0 ; i < 1;  i++) {
        
        
//        switch (self.crTabbar.tag) {
//            case 0:
//                {
//
//                }
//                break;
//            case 1:
//            {
//                [self.crTabbar itemWithNormalImage:@"peng" andHeighImage:@"pengi2" andTitle:@"朋友"];
//            }
//            break;
//            case 2:
//            {
//                [self.crTabbar itemWithNormalImage:@"qian" andHeighImage:@"qian2" andTitle:@"真钱"];
//            }
//            break;
//            case 3:
//            {
//                [self.crTabbar itemWithNormalImage:@"zhi" andHeighImage:@"zhi2" andTitle:@"支付"];
//            }
//            break;
//            default:
//                // 依据需求补充
//                break;
//        }
        
//        [self.itemArray addObject:self.crTabbar];
        
    }
    
//    [self.itemArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0.f leadSpacing:0.f tailSpacing:0.f];
//    [self.itemArray mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(self.customBarView.mas_height);
//        make.top.equalTo(@0);
//    }];
    
}
// 代理事件
- (void)tabbarSwitchClick:(NSObject *)obj{
//    crTabbar *tabbarItem = (crTabbar *)obj;
#pragma mark - 代理事件
    if ([_vcDelegate respondsToSelector:@selector(btnClick)]) {
        [_vcDelegate performSelector:@selector(btnClick)];
    }
    
#pragma mark - TabBar切换
//    [self exchangeCurrentItem:tabbarItem];
}

// TabBar切换
-(void)exchangeCurrentItem:(CRTabbar *)item
{
    if (!self.selectedIndex) {
        self.selectedIndex = 0;
    }
    if (![item isEqual:_crTabbar])
    {
        self.crTabbar = item;
        self.selectedIndex = item.tag;
    }
}
// 隐藏原生TabBar
- (void)hideOriginalTabbar{
    // 遍历TabBarController组件
    for (UIView *originalTabbar in self.view.subviews) {
        if ([originalTabbar isKindOfClass:[UITabBar class]]) {
            // 记录高度
            tabbarHeight = ankedIPhone8 > 20 ? 84 : 49;
            // 隐藏原生
            originalTabbar.hidden = YES;
            break;
        }
    }
}
#pragma mark - 自定义事件
// 隐藏
- (void)hidenTabbarView{
    [UIView animateWithDuration:0.3f animations:^{
        [self.customBarView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(SCREENH);
            make.left.and.right.offset(0);
            make.height.offset(tabbarHeight);
        }];
    } completion:^(BOOL finished) {
        [self.view.layer layoutIfNeeded];
    }];
}
// 显示
- (void)showTabbarView{
    [UIView animateWithDuration:0.3f animations:^{
        [self.customBarView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(SCREENH - tabbarHeight);
            make.left.and.right.offset(0);
            make.height.offset(tabbarHeight);
        }];
    } completion:^(BOOL finished) {
        [self.view.layer layoutIfNeeded];
    }];
}
#pragma mark - view的set&get
// 自定义TabBarView
- (UIView *)customBarView{
    if (_customBarView == nil) {
        _customBarView = [[UIView alloc]init];
        _customBarView.backgroundColor = [UIColor brownColor];
    }
    return _customBarView;
}

@end

@interface CRTabbar ()

@property(nonatomic, assign)Boolean isSelected;

@end

@implementation CRTabbar


#pragma mark - 自定义方法
- (void)itemWithNormalImage:(NSString *)normalImage andHeighImage:(NSString *)heighImage andTitle:(NSString *)title{
    
    [self addSubview:self.imageView];
    
    [self addSubview:self.titleLabel];
    
    // 纯粹图片的情况
    if (title == nil) {
        self.titleLabel.hidden = YES;
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
            make.width.offset(42);
            make.height.offset(42);
        }];
        
        self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",normalImage]];
        self.imageView.highlightedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",heighImage]];
    }
    else{
        self.titleLabel.hidden = NO;
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY).offset(-15);
            make.width.offset(42);
            make.height.offset(42);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(+5);
            make.centerX.equalTo(self.mas_centerX);
            make.width.equalTo(self.imageView.mas_width);
            make.height.offset(21);
        }];
        
        self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",normalImage]];
        self.imageView.highlightedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",heighImage]];
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    
    [self addSubview:self.coverBtn];
    [self.coverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.offset(0);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(self.mas_height);
    }];
    [self.coverBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)btn{
    if ([_tabbarDelegate respondsToSelector:@selector(tabbarSwitchClick:)]) {
        [_tabbarDelegate performSelector:@selector(tabbarSwitchClick:) withObject:self];
    }
}

#pragma mark - view的set&get
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}
- (UIButton *)coverBtn{
    if (_coverBtn == nil) {
        _coverBtn = [[UIButton alloc]init];
        _coverBtn.backgroundColor = [UIColor clearColor];
    }
    return _coverBtn;
}
@end

