//
//  ViewController.m
//  XQFlutterHybridDemo
//
//  Created by WXQ on 2019/5/14.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import "ViewController.h"
#import <XQProjectTool/NSObject+XQViewOC.h>

#import <Flutter/Flutter.h>

#import "GeneratedPluginRegistrant.h"



#define xq_UITableViewCell_Result @"cell"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

/** <#note#> */
@property (nonatomic, strong) UITableView *tableView;
/** <#note#> */
@property (nonatomic, copy) NSArray *dataArr;

/** <#note#> */
@property (nonatomic, strong) FlutterEngine *engine;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.frame = self.view.bounds;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    [FlutterEngine xq_viewInstanceMethod];
    [FlutterEngine xq_viewClassMethod];
    
//    debugDescription = "<FlutterEngine: 0x280de4e00>";
//    description = "<FlutterEngine: 0x280de4e00>";
//    hash = 10751987200;
//    lifecycleChannel = "<FlutterBasicMessageChannel: 0x2834c9240>";
//    localizationChannel = "<FlutterMethodChannel: 0x2834c8440>";
//    navigationChannel = "<FlutterMethodChannel: 0x2834c9180>";
//    platformChannel = "<FlutterMethodChannel: 0x2834c9160>";
//    pluginPublications =     {
//        XqTestTwoPlugin = "<null>";
//    };
//    settingsChannel = "<FlutterBasicMessageChannel: 0x2834c9280>";
//    superclass = NSObject;
//    systemChannel = "<FlutterBasicMessageChannel: 0x2834c9260>";
//    textInputChannel = "<FlutterMethodChannel: 0x2834c9220>";
//    viewController = "<FlutterViewController: 0x106884200>";
    
    // 释放内存
    if (self.engine) {
        [self.engine destroyContext];
        self.engine = nil;
    }
}

- (void)initTableView {
    self.dataArr = @[
                     @"测试"
                     ];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    UINib *nib = [UINib nibWithNibName:xq_UITableViewCell_Result bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:xq_UITableViewCell_Result];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:xq_UITableViewCell_Result];
    self.tableView.rowHeight = 70;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xq_UITableViewCell_Result forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self handleBoundleResource];
}

/**
 * 加载boundle资源
 */
- (void)handleBoundleResource {
    // 获取资源??? 干吗的, 传对应的图片资源进去???
    NSString * path = [[NSBundle mainBundle] pathForResource:@"Assets" ofType:@"car"];
    // ???这个干吗
    NSURL * url = [NSURL URLWithString:path];
    
    // 内存泄露就是在这部分
    if (!self.engine) {
        FlutterDartProject * dart = [[FlutterDartProject alloc] init];
        // name...感觉没有什么用处, 应该是图片资源???
        FlutterEngine * engine = [[FlutterEngine alloc] initWithName:path.lastPathComponent project:dart];
        [engine runWithEntrypoint:nil];
        self.engine = engine;
    }
    
    // 初始化vc, 这个vc一开始会内存泄露, 现在不会了, 会自动释放, 所以一般来说, 这个并不需要去管理太多了
    FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithEngine:self.engine nibName:nil bundle:nil];
    
    // 注册plugin
    [GeneratedPluginRegistrant registerWithRegistry:flutterViewController];
    
    // 这个是存储好这个 vc 么??
//    [self addBackButton:flutterViewController];
    
    // 设置初始化的 route
    [flutterViewController setInitialRoute:@"初始化route，在flutter main() 里面会有参数"];
    
    // 跳转到 vc
    [self.navigationController pushViewController:flutterViewController animated:YES];
    
    // 控制flutter跳转页面的时候调用
    //    [flutterViewController pushRoute:@"页面route"];
    
    // 返回页面时调用
    //    [flutterViewController popRoute];
}



@end

















