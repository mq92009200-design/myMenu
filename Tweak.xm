#import <UIKit/UIKit.dylib>

UIView *mainLauncherMenu;
UIButton *floatingButton;

void createMainLauncherMenu() {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        
        mainLauncherMenu = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 300)];
        mainLauncherMenu.center = keyWindow.center;
        mainLauncherMenu.backgroundColor = [UIColor colorWithRed:0.05 green:0.05 blue:0.08 alpha:0.95];
        mainLauncherMenu.layer.cornerRadius = 15;
        mainLauncherMenu.layer.borderColor = [UIColor cyanColor].CGColor;
        mainLauncherMenu.layer.borderWidth = 1.5;
        mainLauncherMenu.hidden = YES;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, 280, 30)];
        titleLabel.text = @"قائمة الهاكات المدمجة";
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [mainLauncherMenu addSubview:titleLabel];
        
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
        btn1.frame = CGRectMake(20, 60, 240, 45);
        btn1.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8];
        btn1.layer.cornerRadius = 8;
        [btn1 setTitle:@"فتح واجهة هاك #1" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(openHack1) forControlEvents:UIControlEventTouchUpInside];
        [mainLauncherMenu addSubview:btn1];
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
        btn2.frame = CGRectMake(20, 120, 240, 45);
        btn2.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8];
        btn2.layer.cornerRadius = 8;
        [btn2 setTitle:@"فتح واجهة هاك #2" forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(openHack2) forControlEvents:UIControlEventTouchUpInside];
        [mainLauncherMenu addSubview:btn2];

        UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeSystem];
        btnClose.frame = CGRectMake(20, 230, 240, 40);
        btnClose.backgroundColor = [UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:0.8];
        btnClose.layer.cornerRadius = 8;
        [btnClose setTitle:@"إغلاق القائمة" forState:UIControlStateNormal];
        [btnClose setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnClose addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
        [mainLauncherMenu addSubview:btnClose];
        
        [keyWindow addSubview:mainLauncherMenu];
    });
}

void setupFloatingButton() {
    dispatch_async(dispatch_get_main_queue(), ^{
        floatingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        floatingButton.frame = CGRectMake(20, 150, 60, 60);
        floatingButton.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.9];
        floatingButton.layer.cornerRadius = 30;
        floatingButton.layer.borderColor = [UIColor cyanColor].CGColor;
        floatingButton.layer.borderWidth = 2.0;
        [floatingButton setTitle:@"MENU" forState:UIControlStateNormal];
        [floatingButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        
        [floatingButton addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
        
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow addSubview:floatingButton];
    });
}

- (void)toggleMenu {
    if (!mainLauncherMenu) {
        createMainLauncherMenu();
    }
    mainLauncherMenu.hidden = !mainLauncherMenu.hidden;
}

- (void)openHack1 {
    mainLauncherMenu.hidden = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ShowHack1UI" object:nil];
}

- (void)openHack2 {
    mainLauncherMenu.hidden = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ShowHack2UI" object:nil];
}

%hook UIViewController
- (void)viewDidAppear:(BOOL)animated {
    %orig;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        setupFloatingButton();
    });
}
%end
