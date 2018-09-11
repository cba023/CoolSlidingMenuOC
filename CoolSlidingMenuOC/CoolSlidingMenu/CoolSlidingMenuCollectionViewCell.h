//
//  CoolSlidingMenuCollectionViewCell.h
//  CoolSlidingMenuOC
//
//  Created by Creater on 2018/9/10.
//  Copyright © 2018年 CHENBO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolSlidingMenuCollectionViewCell : UICollectionViewCell
/// 图标
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
/// 标题
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
/// 选中菜单项的数据源字典
@property (nonatomic, copy) NSDictionary *dicMenu;

@end
