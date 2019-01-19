//
//  ViewController.m
//  AmrToWav
//
//  Created by CoderWGB on 2018/12/6.
//  Copyright © 2018 CoderWGB. All rights reserved.
//

#import "ViewController.h"
#import "EMCDDeviceManager.h"
#import "VoiceConverter.h"


//获取temp
#define kPathTempPath NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playButton setTitle:@"播放" forState:UIControlStateNormal];
    playButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview: playButton];
    playButton.frame = CGRectMake(50, 100, 200 , 50);
    [playButton addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)playAction:(UIButton *)sender{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"twohello" ofType:@"amr"];
    NSString *path2 = [NSString stringWithFormat:@"%@/hello001.wav",kPathDocumentPath];
    NSLog(@"%@",path2);
    //-:  需求是要采样率16000的
    BOOL success = [[EMCDDeviceManager sharedInstance] convertAMR: path toWAV: path2 sampleRate: Sample_Rate_16000];
    NSLog(@"%@",success?@"转换成功":@"转换失败!");
    
    [[EMCDDeviceManager sharedInstance] asyncPlayingWithPath: path2 completion:^(NSError *error) {
        NSLog(@"%@",error.description);
    }];
    

}

@end
