//
//  FDHttpConnection.m
//  Block-01
//
//  Created by iFD on 15/6/3.
//  Copyright (c) 2015年 iFD. All rights reserved.
//

#import "FDHttpConnection.h"

@implementation FDHttpConnection

{
    NSURLConnection *_connection;
    NSMutableData *_responseData;
    BlockSuccess _success;
    BlockFailure _failure;
}
- (void)dealloc
{
//    [_connection cancel];
//    [_connection release];
    [_responseData release];
    [_success release];
    [_failure release];
    [super dealloc];
    
}
-(instancetype)initWithURL:(NSString *)str success:(BlockSuccess)onSuccess failure:(BlockFailure)onFailure
{
    if (self=[super init]) {
        _success=[onSuccess copy];
        _failure=[onFailure copy];
        _responseData=[[NSMutableData alloc]init];
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:str]];
        _connection=[NSURLConnection connectionWithRequest:request delegate:self];
    }
    return self;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_responseData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (_success) {
        _success(_responseData);
    }
}
//失败
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //判断用户是不是真的指定了连接失败之后的代码
    if (_failure) {
        _failure(error);
    }
}
@end
