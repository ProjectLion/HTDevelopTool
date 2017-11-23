//
//  HTSimpleCell.m
//  HTDevelopTools
//
//  Created by HT on 2017/11/23.
//  Copyright © 2017年 HT. All rights reserved.
//
/**
 需要到的头文件在此工具类中   gitHub:https://github.com/ProjectLion/HTDevelopTool.git
 */


#import "HTSimpleCell.h"
#import "UIScreen+HTScreen.h"

@interface HTSimpleCell()

@property(nonatomic, assign)HTSimpleCellStyle style;
@property(nonatomic, strong)UIImageView *titleImage;
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UILabel *descLabel;
@property(nonatomic, strong)UIImageView *rightImage;
@property(nonatomic, strong)UIView *bottomLine;

@end

@implementation HTSimpleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        self.style = HTSimpleCellStyle_ImageTitleRight;
        [self creatView];
        [self creatBottomLine];
    }
    return self;
}
///实例化方法
- (instancetype)initSimpleCellWithStyle:(HTSimpleCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        self.style = style;
        [self creatView];
        [self creatBottomLine];
    }
    return self;
}
///类方法
+ (instancetype)simpleCellWithStyle:(HTSimpleCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    HTSimpleCell *cell = [[self alloc] initSimpleCellWithStyle:style reuseIdentifier:reuseIdentifier];
    return cell;
}

#pragma mark 懒加载视图控件
- (UIImageView *)titleImage{
    if (_titleImage == nil) {
        _titleImage = [[UIImageView alloc] init];
    }
    return _titleImage;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UILabel *)descLabel{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] init];
    }
    return _descLabel;
}

- (UIImageView *)rightImage{
    if (_rightImage == nil) {
        _rightImage = [[UIImageView alloc] init];
    }
    return _rightImage;
}

- (UIView *)bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
    }
    return _bottomLine;
}
#pragma mark set方法
- (void)setTitleImageStr:(NSString *)titleImageStr{
    _titleImageStr = titleImageStr;
    _titleImage.image = [UIImage imageNamed:_titleImageStr];
}

- (void)setTitleImageURL:(NSString *)titleImageURL{
    _titleImageURL = titleImageURL;
    [_titleImage ht_loadImageWithURL:_titleImageURL placeholder:nil];
}

- (void)setTitle:(NSString *)title{
    _title = title;
    _titleLabel.text = title;
}

- (void)setRightImageStr:(NSString *)rightImageStr{
    _rightImageStr = rightImageStr;
    _rightImage.image = [UIImage imageNamed:_rightImageStr];
}

- (void)setRightImageURL:(NSString *)rightImageURL{
    _rightImageURL = rightImageURL;
    [_rightImage ht_loadImageWithURL:_rightImageURL placeholder:nil];
}

- (void)setDescStr:(NSString *)descStr{
    _descStr = descStr;
    _descLabel.text = _descStr;
}

- (void)setIsShowSegmentLine:(BOOL)isShowSegmentLine{
    _isShowSegmentLine = isShowSegmentLine;
    if (!_isShowSegmentLine) {     //默认显示
        [_bottomLine setHidden:YES];
    }
}

/**
 创建视图
 */
- (void)creatView{
    switch (self.style) {
        case HTSimpleCellStyle_ImageTitleRight:{
            [self creatImageTitleRightView];
        }
            break;
        case HTSimpleCellStyle_TitleRight:{
            
        }
            break;
        case HTSimpleCellStyle_ImageTitleDesc:{
            
        }
            break;
        case HTSimpleCellStyle_ImageTitleDescRight:{
            
        }
            break;
        default:
            break;
    }
}

/**
 创建图片 & 文字 & 右箭头类型的视图
 */
- (void)creatImageTitleRightView{
    self.titleImage.frame = CGRectMake(0, 0, Width(20), Width(20));
    [_titleImage setHt_centerX:Width(25)];
    [_titleImage setHt_centerY:self.contentView.ht_centerY];
    [self.contentView addSubview:_titleImage];
    
    [self.titleLabel ht_setLabelFont:FontWidth(15) text:@"" textColor:[UIColor grayColor]];
    [_titleLabel setHt_width:SCREEN_W - Width(90)];
    [_titleLabel setHt_height:Height(24)];
    [_titleLabel setHt_left:_titleImage.ht_right + Width(10)];
    [_titleLabel setHt_centerY:self.contentView.ht_centerY];
    [self.contentView addSubview:_titleLabel];
    
    self.rightImage.frame = CGRectMake(0, 0, Width(20), Width(20));
    [_rightImage setHt_centerX:SCREEN_W - Width(25)];
    [_rightImage setHt_centerY:self.contentView.ht_centerY];
    [self.contentView addSubview:_rightImage];
}

/**
 单独创建分割线
 */
- (void)creatBottomLine{
    self.bottomLine.backgroundColor = colorForString(@"#efefef");
    [_bottomLine setHt_bottom:self.contentView.ht_height - Height(1)];
    [_bottomLine setHt_left:self.contentView.ht_left];
    [_bottomLine setHt_width:SCREEN_W];
    [_bottomLine setHt_height:Height(1)];
    [self.contentView addSubview:_bottomLine];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
