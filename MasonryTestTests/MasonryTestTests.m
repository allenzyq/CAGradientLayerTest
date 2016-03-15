//
//  MasonryTestTests.m
//  MasonryTestTests
//
//  Created by allenzyq on 16/3/10.
//  Copyright © 2016年 AllenZyq. All rights reserved.
//

#import <XCTest/XCTest.h>
@interface MasonryTestTests : XCTestCase

@end

@implementation MasonryTestTests
#define WAIT do {\\
[self expectationForNotification:@"RSBaseTest" object:nil handler:nil];\\
[self waitForExpectationsWithTimeout:30 handler:nil];\\
} while (0)

#define NOTIFY \\
[[NSNotificationCenter defaultCenter]postNotificationName:@"RSBaseTest" object:nil]
- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSUInteger a = 10 ; NSUInteger b = 15;
    NSUInteger expected = 25;
    
    NSUInteger actual = [self add:a b:b];
    XCTAssertEqual(expected, actual,@"add方法错误");
    
    
    
}
//-(void)testRequest{
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
//    
//    // 2.发送GET请求
//    [mgr GET:@"http://www.weather.com.cn/adat/sk/101110101.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"responseObject:%@",responseObject);
//        XCTAssertNotNil(responseObject, @"返回出错");
//        NOTIFY //继续执行
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"error:%@",error);
//        XCTAssertNil(error, @"请求出错");
//        NOTIFY //继续执行
//    }];
//    WAIT  //暂停
//}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


- (NSUInteger) add :(NSUInteger )a b:(NSUInteger )b {
    
    return  a + b;
}

@end
