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
    NSURL *mediaURL = [NSURL URLWithString:@"http://dev-cc-static.ecovacs.cn/upload/colleague/video/weitie/2020/07/23/191104_5529.mp4.m3u8?pm3u8/0&e=1604450803&token=wTYFv7QhwqcpBOM31D3u_10aHEK2qk53hm5v4MZU:i3w8eeOUZGpgVnhlkb_iLuntamw="];
    self.item = [AVPlayerItem playerItemWithURL:mediaURL];
    
    //2.初始化一个播放器对象
    self.myPlayer = [AVPlayer playerWithPlayerItem:self.item];
    
    //3.初始化一个播放器layer
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.myPlayer];
    self.playerLayer.frame = CGRectMake(0,0,UIScreen.mainScreen.bounds.size.width,200);
    [self.layer addSublayer:self.playerLayer];
    
    //播放视频链接
    [self.myPlayer play];
}

@end
