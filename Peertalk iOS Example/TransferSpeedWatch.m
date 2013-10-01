//
//  TransferSpeedWatch.m
//  peertalk
//
//  Created by Ares on 13-9-10.
//
//

#import "TransferSpeedWatch.h"

@implementation TransferSpeedWatch
{
    NSTimer* watchTimer;
    int totalDataSize;
    int totalElapse;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        self.label1.textAlignment = NSTextAlignmentRight;
        self.label1.backgroundColor = [UIColor clearColor];
        self.label1.textColor = [UIColor blackColor];
        self.label1.text = @"传输速率：";
        
        self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 80, 20)];
        self.label2.textAlignment = NSTextAlignmentLeft;
        self.label2.textColor = [UIColor blackColor];
        self.label2.backgroundColor = [UIColor clearColor];
        self.label2.text = @"0.0 M/S";
        
        [self addSubview:self.label1];
        [self addSubview:self.label2];
        self.backgroundColor = [UIColor whiteColor];
        
        totalDataSize = 0;
        totalElapse = 0;
        watchTimer = nil;
    }
    return self;
}

-(void) startWatch
{
    [self stopWatch];
    
    watchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onWatchTimerTicked:) userInfo:nil repeats:YES];
}

-(void) stopWatch
{
    if(watchTimer)
    {
        [watchTimer invalidate];
        watchTimer = nil;
    }
    
    totalDataSize = 0;
    totalElapse = 0;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        self.label2.text = @"0.0 M/S";
    });
}

-(void) appendReceivedDataSize:(int)size;
{
    totalDataSize += size;
}

-(void) onWatchTimerTicked:(NSTimer*)theTimer
{
    totalElapse ++;
    
    float speed = (totalDataSize*1.0f) / (totalElapse*1024.0f*1024.0f);
    
    self.label2.text = [NSString stringWithFormat:@"%0.1f M/S",speed];
}

@end
