#import <UIKit/UIKit.h>
#import "PTChannel.h"

@interface PTViewController : UIViewController <PTChannelDelegate, UITextFieldDelegate>{

    FILE *_MediaFile;
    int _readSize;
    
    NSString* filePath;
}

@property (weak) IBOutlet UITextView *outputTextView;
@property (weak) IBOutlet UITextField *inputTextField;

@property (nonatomic) FILE *MediaFile;
@property (nonatomic) int readSize;

- (void)sendMessage:(NSString*)message;


@end
