//
//  SettingsTableViewCell.h
//  Signal
//
//  Created by Dylan Bourgeois on 11/11/14.
//  Copyright (c) 2014 Open Whisper Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsTableViewCellDelegate <NSObject>

- (void)updateLoggingSetting:(BOOL)isLoggingEnabled;

@end

@interface SettingsTableViewCell : UITableViewCell

-(void)updateImageQualityLabel;

//Optionals
@property(nonatomic, strong) IBOutlet UISwitch* toggle;
@property(nonatomic, strong) IBOutlet UILabel* detailLabel;

@property(nonatomic, strong) id<SettingsTableViewCellDelegate>delegate;

@end
