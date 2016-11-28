/*
* @brief:  公共按钮类
* @author: Hj
* @date:   2016-05-18
*/

@interface NWMainButton : UIButton

+ (instancetype)button;

- (void)setupDefaultColor;

- (void)setupDefaultCorner;

- (void)setupLoginStyleColor;

- (void)setupLoginStyleCorner;

- (void)shake;

- (void)startLoading;

- (void)stopLoading;

- (void)jump;

- (void)stopJump;

@property (nonatomic, assign) BOOL jumping;

@end