//
//  AllTest5ViewController.swift
//  TangramKit
//
//  Created by apple on 16/10/17.
//  Copyright © 2016年 youngsoft. All rights reserved.
//

import UIKit

class AllTest5ViewController: UIViewController {

    override func loadView() {
        
        //默认设置为垂直布局
        let rootLayout = TGLinearLayout(.vert)
        rootLayout.tg_padding = UIEdgeInsetsMake(10, 10, 10, 10);
        rootLayout.tg_vspace = 10
        rootLayout.tg_hspace = 10
        self.view = rootLayout;
        
        
        let v1 = UILabel()
        v1.backgroundColor = .red
        v1.numberOfLines = 0;
        v1.text = NSLocalizedString("The red、green、blue subwiews is arranged vertically when run in portrait screen on all the iPhone devices,but horizontal arranged when in landscape screen, the blue subview is not showed on any phone devices except on iPhone6plus.", comment:"");
        v1.tg_height.equal(100%)
        v1.tg_width.equal(100%)
        rootLayout.addSubview(v1)
        
        
        let v2 = UILabel()
        v2.backgroundColor = .green
        v2.tg_height.equal(100%)
        v2.tg_width.equal(100%)
        rootLayout.addSubview(v2)
        
        
        let v3 = UILabel()
        v3.backgroundColor = .blue
        v3.tg_height.equal(100%)
        v3.tg_width.equal(100%)
        rootLayout.addSubview(v3)
        
        //v3视图在其他任何iPhone设备横屏都不参与布局
        v3.tg_fetchSizeClass(with: .comb(.any, .compact, nil)).isHidden = true
        //只有iphone6Plus的横屏才参与布局
        v3.tg_fetchSizeClass(with: .comb(.regular, .compact, nil), from: .default).isHidden = false
        
        //针对iPhone设备的所有横屏的高度都是Compact的，而宽度则是任意，因此下面的设置横屏情况下布局变为水平布局。
        let lsc = rootLayout.tg_fetchSizeClass(with: .comb(.any, .compact, nil), from:.default) as! TGLinearLayoutViewSizeClass
        lsc.tg_orientation = .horz
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}