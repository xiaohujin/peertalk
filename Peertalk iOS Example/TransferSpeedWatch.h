//
//  TransferSpeedWatch.h
//  peertalk
//
//  Created by Ares on 13-9-10.
//
//

#import <UIKit/UIKit.h>

@interface TransferSpeedWatch : UIView

@property(nonatomic, retain) UILabel* label1;
@property(nonatomic, retain) UILabel* label2;

-(void) startWatch;

-(void) stopWatch;

-(void) appendReceivedDataSize:(int)size;

@end
