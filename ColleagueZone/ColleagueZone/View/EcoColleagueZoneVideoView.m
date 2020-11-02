//
//  EcoColleagueZoneVideoView.m
//  ColleagueZone
//
//  Created by Evan Yang on 2020/11/3.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

#import "EcoColleagueZoneVideoView.h"
#import<AVFoundation/AVFoundation.h>

@interface EcoColleagueZoneVideoView()

@property (strong, nonatomic)AVPlayer *myPlayer;//播放器
@property (strong, nonatomic)AVPlayerItem *item;//播放单元
@property (strong, nonatomic)AVPlayerLayer *playerLayer;//播放界面（layer）

@end

@implementation EcoColleagueZoneVideoView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    //1.播放网址
    NSURL *mediaURL = [NSURL URLWithString:@"http://baobab.wdjcdn.com"];
    self.item = [AVPlayerItem playerItemWithURL:mediaURL];
    
    //2.初始化一个播放器对象
    self.myPlayer = [AVPlayer playerWithPlayerItem:self.item];
    
    //3.初始化一个播放器layer
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.myPlayer];
    self.playerLayer.frame = self.bounds;
    [self.layer addSublayer:self.playerLayer];
    
    //播放视频链接
    [self.myPlayer play];
}

@end
