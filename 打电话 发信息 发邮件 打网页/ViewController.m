//
//  ViewController.m
//  打电话 发信息 发邮件 打网页
//
//  Created by Apple on 16/4/21.
//  Copyright (c) 2016年 zf. All rights reserved.
//

#define WWW [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *tel_btn=[[UIButton alloc] initWithFrame:CGRectMake((WWW-100)/2, 30, 100, 40)];
    [tel_btn setTitle:@"打电话" forState:UIControlStateNormal];
    [tel_btn setBackgroundColor:[UIColor purpleColor]];
    [tel_btn addTarget:self action:@selector(callClicK:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *sms_btn=[[UIButton alloc] initWithFrame:CGRectMake((WWW-100)/2, 80, 100, 40)];
    [sms_btn setTitle:@"发信息" forState:UIControlStateNormal];
    [sms_btn setBackgroundColor:[UIColor purpleColor]];
    [sms_btn addTarget:self action:@selector(sendMessageClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *mail_btn=[[UIButton alloc] initWithFrame:CGRectMake((WWW-100)/2, 130, 100, 40)];
    [mail_btn setTitle:@"发邮件" forState:UIControlStateNormal];
    [mail_btn setBackgroundColor:[UIColor purpleColor]];
    [mail_btn addTarget:self action:@selector(sendEmailClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *web_btn=[[UIButton alloc] initWithFrame:CGRectMake((WWW-100)/2, 180, 100, 40)];
    [web_btn setTitle:@"浏览网页" forState:UIControlStateNormal];
    [web_btn setBackgroundColor:[UIColor purpleColor]];
    [web_btn addTarget:self action:@selector(browserClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tel_btn];
    [self.view addSubview:sms_btn];
    [self.view addSubview:mail_btn];
    [self.view addSubview:web_btn];

}
#pragma mark - UI事件
//打电话
- (IBAction)callClicK:(UIButton *)sender {
    NSString *phoneNumber=@"18500138888";
    //这种方式会直接拨打电话
    //NSString *url=[NSString stringWithFormat:@"tel://%@",phoneNumber];
    //这种方式会提示用户确认是否拨打电话
    NSString *url=[NSString stringWithFormat:@"telprompt://%@",phoneNumber];
    [self openUrl:url];
}
//发送短信
- (IBAction)sendMessageClick:(UIButton *)sender {
   NSString *phoneNumber=@"18500138888";
   NSString *url=[NSString stringWithFormat:@"sms://%@",phoneNumber];
   [self openUrl:url];
}
//发送邮件
- (IBAction)sendEmailClick:(UIButton *)sender {
    NSString *mailAddress=@"kenshin@hotmail.com";
    NSString *url=[NSString stringWithFormat:@"mailto://%@",mailAddress];
    [self openUrl:url];
}
//浏览网页
- (IBAction)browserClick:(UIButton *)sender {
    NSString *url=@"http://www.cnblogs.com/kenshincui";
    [self openUrl:url];
}

-(void)openUrl:(NSString *)urlStr{
    
    //注意url中包含协议名称，iOS根据协议确定调用哪个应用，例如发送邮件是“sms://”其中“//”可以省略写成“sms:”(其他协议也是如此)
    NSURL *url=[NSURL URLWithString:urlStr];
    UIApplication *application=[UIApplication sharedApplication];
    if(![application canOpenURL:url]){
        NSLog(@"无法打开\"%@\"，请确保此应用已经正确安装.",url);
    }
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
