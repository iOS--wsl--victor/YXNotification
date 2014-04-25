//
//  YXNotification.h
//
//  http://www.cnblogs.com/YouXianMing/
//
//  Created by wooboo on 14-4-25.
//  Copyright (c) 2014年 Y.X. All rights reserved.
//

#warning 请在ARC环境下使用

#import <Foundation/Foundation.h>
@protocol YXNotificationProtrol;

@interface YXNotification : NSObject

/**
 标记目标对象并签订协议
 
 @param target 实现了协议YXNotificationProtrol的对象
 @param mark   对这个对象的标识
 
 @return none
 */
+ (void)delegate:(id<YXNotificationProtrol>)target mark:(NSString *)mark;

/**
 从原目标发送信息到多个目标,目标都有标识
 
 @param msg      发送的信息
 @param source   发送数据的源头
 @param marks    对象标识的数组
 
 @return none
 */
+ (void)message:(id)msg from:(id<YXNotificationProtrol>)source toMarks:(NSArray *)marks;

/**
 移除目标以及该目标的标识
 
 @param target 已经标识过的目标
 @param mark   该目标的标识
 
 @return none
 */
+ (void)remove:(id<YXNotificationProtrol>)target mark:(NSString *)mark;

@end

@protocol YXNotificationProtrol <NSObject>
@required
+ (void)listenEvent:(id)message;
@end

