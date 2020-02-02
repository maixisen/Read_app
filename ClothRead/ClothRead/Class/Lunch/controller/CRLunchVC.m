//
//  CRLunchVC.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/29.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRLunchVC.h"
#import "CRLoginVC.h"
#import "CRLunchImageView.h"

@interface CRLunchVC ()<UIScrollViewDelegate>

// 滚动图
@property(nonatomic, strong)UIScrollView *imageScrollView;
// 点
@property(nonatomic, strong)UIPageControl *pageControlView;
// 图片image
@property(nonatomic, strong) NSArray *imageArray;
// intoLogin
@property(nonatomic, strong)UIButton *intoLoginBtn;

@end

@implementation CRLunchVC

- (NSArray *)imageArray{
    if (_imageArray == nil) {
        _imageArray = [NSArray arrayWithObjects:@"Wl01",@"Wl02",@"Wl03",nil];
    }
    return _imageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // scrollView
    [self.view addSubview:self.imageScrollView];
    [self.imageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.offset(0);
        make.height.offset(SCREENH);
        make.width.offset(SCREENW);
    }];
    // pageControl
    [self.view addSubview:self.pageControlView];
    [self.pageControlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.imageScrollView.mas_bottom).offset(ankedIPhone8 > 20 ? -90*SCREEN_Proportion : -40*SCREEN_Proportion);
        make.height.offset(20);
        make.width.offset(SCREENW *0.6);
    }];
    // 滚动图
    [self addImageToImageView];
}

/** 添加滚动图 */
- (void)addImageToImageView{
    [self.imageScrollView setContentSize:CGSizeMake(SCREENW *3, SCREENH)];
    [self.imageScrollView setContentOffset:CGPointMake(0, 0)];
    for (int i = 0; i < self.imageArray.count; i++) {
        CRLunchImageView *imgView = [[CRLunchImageView alloc] initWithFrame:CGRectMake(i*SCREENW, 0, SCREENW, SCREENH)];
        imgView.contentTitle.image = [UIImage imageNamed:[NSString stringWithFormat:@"wl0%it",i + 1]];
        imgView.contentImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"wl0%ip",i + 1]];
        [self.imageScrollView addSubview:imgView];
        if (i == self.imageArray.count - 1) {
            imgView.userInteractionEnabled = YES;
            [imgView addSubview:self.intoLoginBtn];
            [self.intoLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(imgView.mas_centerX);
                make.bottom.equalTo(imgView.mas_bottom).offset(ankedIPhone8 > 20 ? -160*SCREEN_Proportion : -120*SCREEN_Proportion);
                make.height.offset(44*SCREEN_Proportion);
                make.width.offset(180*SCREEN_Proportion);
            }];
            self.intoLoginBtn.hidden = NO;
        }else{
            self.intoLoginBtn.hidden = YES;
        }
    }
    [self.view addSubview:self.pageControlView];
    [self.intoLoginBtn addTarget:self action:@selector(intoLoginVc) forControlEvents:UIControlEventTouchUpInside];
}

// 跳转到登录页面
- (void)intoLoginVc{
    CRLoginVC *loginVC = [[CRLoginVC alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

#pragma mark -- UIScrollViewDelegate
//减速完成，视图停止滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
//    NSInteger page = scrollView.contentOffset.x/SCREENW;
//    if (page == self.imageArray.count - 1) {
//        self.pageControlView.hidden = YES;
//    }else{
//        self.pageControlView.hidden = NO;
        self.pageControlView.currentPage = scrollView.contentOffset.x/SCREENW;
//    }
}

#pragma get&set
- (UIScrollView *)imageScrollView{
    if (_imageScrollView == nil) {
        _imageScrollView = [[UIScrollView alloc]init];
        _imageScrollView.backgroundColor = [UIColor yellowColor];
        _imageScrollView.delegate = self;
        // 分页
        _imageScrollView.pagingEnabled = YES;
        //设置额外的空间
        _imageScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //锁定方向，左右滑动和上下滑动不能同时进行
        _imageScrollView.directionalLockEnabled = YES;
        //隐藏水平状态条
        _imageScrollView.showsHorizontalScrollIndicator = NO;
        //隐藏垂直状态条
        _imageScrollView.showsVerticalScrollIndicator = NO;
        //关闭反弹效果
        _imageScrollView.bounces = NO;
    }
    return _imageScrollView;
}
- (UIPageControl *)pageControlView{
    if (_pageControlView == nil) {
        _pageControlView = [[UIPageControl alloc] init];
        _pageControlView.currentPage = 0;
        _pageControlView.numberOfPages = self.imageArray.count;
        _pageControlView.pageIndicatorTintColor = [UIColor colorWithHexString:@"6D7278"];//圆点的颜色
        _pageControlView.currentPageIndicatorTintColor = [UIColor colorWithHexString:@"FFD12A"];//当前圆点的颜色
    }
    return _pageControlView;
}
- (UIButton *)intoLoginBtn{
    if (_intoLoginBtn == nil) {
        _intoLoginBtn = [[UIButton alloc]init];
        _intoLoginBtn.hidden = YES;
        [_intoLoginBtn setBackgroundImage:[UIImage imageNamed:@"intoCR"] forState:UIControlStateNormal];
        [_intoLoginBtn setBackgroundImage:[UIImage imageNamed:@"intoCR_Hei"] forState:UIControlStateHighlighted];
    }
    return _intoLoginBtn;
}
@end
