//
//  ViewController.m
//  strbd_test2
//
//  Created by JD Park on 2015. 4. 21..
//  Copyright (c) 2015년 JD Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) connection
{
    
    
    
    NSString *myFinal = [NSString stringWithFormat:@"h_name=%@&d_name=%@&u_name=%@", _hName.text, _dName.text, _uName.text];
    
    
    
    NSLog(@"%@" ,myFinal);
    
    
    
    
    
    
    
    // NSURLRequest 객체 생성
    // 통신을 Request(요청)하는 객체를 만든다
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]init];
    
    // POST 내용을 작성
    //    NSString *post = [NSString stringWithFormat:@"h_name=%@&d_name%@&u_name=%@" , _hName.text, _dName.text, _uName.text ];
    NSString *post = myFinal;
    
    
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
    
    // Request 객체에 들어갈 내용들 설정
    [request setURL:[NSURL URLWithString:@"http://choose.wfk.co.kr/survey_proc.asp"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"Mozilla/4.0 (compatible;)" forHTTPHeaderField:@"User-Agent"];
    [request setHTTPBody:postData];
    [request setTimeoutInterval:30.0];
    
    
    
    
    // 커넥션 에러를 다룰 객체를 생성
    NSError *error = nil;
    // NSURLConnection 객체를 이용해 동기적으로 보냄 (Response객체는 사용하지 않음)
    // 돌아온 값은 NSData형으로 받는다
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:Nil error:&error];
    if(data == NULL){
        // 통신 실패 !
        NSLog(@"통신 실패 !");
    }
    else{
        // 통신 성공
        // 받아온 정보가 스트링인 경우
        NSString *returnStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Return String : %@",returnStr);
        
    }
}

- (IBAction)okClicked:(id)sender {
    
    [self connection];
    
    // NSLog(@"ggggg");
    
}



@end
