
/**
 *  @brief  界面操作动态改变界面的样式
 *  @author ZZ
 *  @date   2016.8.16
 */

#import <Foundation/Foundation.h>

@class JSCartViewModel;
@class JSCartModel;

@interface JSCartUIService : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) JSCartViewModel *viewModel;

@property (nonatomic, copy) void (^clickCellAction) (JSCartModel *);
@end
