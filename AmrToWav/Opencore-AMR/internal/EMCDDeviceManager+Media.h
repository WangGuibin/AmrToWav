/************************************************************
 *  * EaseMob CONFIDENTIAL
 * __________________
 * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of EaseMob Technologies.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from EaseMob Technologies.
 */

#import "EMCDDeviceManagerBase.h"
#import "VoiceConverter.h"

@interface EMCDDeviceManager (Media)

#pragma mark - AudioPlayer
// 播放音频
- (void)asyncPlayingWithPath:(NSString *)aFilePath
                  completion:(void(^)(NSError *error))completon;
// 停止播放
- (void)stopPlaying;

- (void)stopPlayingWithChangeCategory:(BOOL)isChange;

// 当前是否正在播放
-(BOOL)isPlaying;

#pragma mark - AudioRecorder
// 开始录音 设置文件名 路径在程序内部设置
- (void)asyncStartRecordingWithFileName:(NSString *)fileName
                                completion:(void(^)(NSError *error))completion;

// 停止录音  返回amr格式的音频路径
-(void)asyncStopRecordingWithCompletion:(void(^)(NSString *recordPath,
                                                 NSInteger aDuration,
                                                 NSError *error))completion;
// 取消录音
-(void)cancelCurrentRecording;


// 当前是否正在录音
-(BOOL)isRecording;


#pragma mark - Convert
- (BOOL)convertAMR:(NSString *)amrFilePath
             toWAV:(NSString *)wavFilePath
        sampleRate:(Sample_Rate)rate;

- (BOOL)convertWAV:(NSString *)wavFilePath
             toAMR:(NSString *)amrFilePath
        sampleRate:(Sample_Rate)rate;

@end
