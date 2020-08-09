//
//  ViewController.swift
//  Swift-Test
//
//  Created by 周启佳 on 2019/7/4.
//  Copyright © 2019 zhouqijia. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView?
    var dataArray : Array<Any>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT), style: .plain)
        self.view.addSubview(tableView!)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.register(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        
        self.dataArray = ["Keep yourself motivated by looking back at the textbooks and CDs you used in the past. You’ll be surprised at how easy they seem to you now! Congratulations, your level is improving!",
                          "Use resources which match your level. Don’t use texts/listening exercises which are too difficult or too easy. Use materials which challenge you but don’t frustrate you.",
                          "面对美国挑起并不断升级的经贸摩擦，我们除了给予有理有力有节的反制外，最重要的是做好自己的事情，在经济方面就是要以供给侧结构性改革为主线，大力振兴实体经济，做强做优制造业。",
                          "实体经济是一国经济的立身之本，是财富创造的根本源泉，是国家强盛的重要支柱。经过新中国成立以来70年的建设，特别是改革开放40多年的快速发展，我国形成了规模庞大、体系完整的国民经济体系。一是我国经济体量连续9年稳居世界第二，2018年GDP达到90.04万亿元，折合13.6万亿美元，占全球经济总量的16%，根据今年IMF数据测算，中国对全球经济增长的贡献率超过30%。二是我国是全世界唯一拥有联合国产业分类中全部工业门类的国家，在500多种工业产品中，我国220多种工业品产量居世界第一位，是名副其实的“世界工厂”；粮食产量连续6年稳定在6亿吨以上，肉蛋奶菜果水产等农产品产量多年稳居世界第一。三是拥有诸多行业制造环节比较齐全的产业，培育形成了一批具有国际竞争力的产业集群，制造业增长值连续9年稳居世界第一位，2018年占世界比重达28.6%。",
                          "三是供给体系和需求结构存在错配。一方面，随着城乡居民收入水平提高，人们消费需求逐步升级，从温饱型消费转向享受型消费和发展型消费，对中高端产品和服务需求明显增加；另一方面，受多种因素制约，我国供给侧迟迟没有及时调整跟进，导致中低端产能严重过剩和中高端产品供给不足并存，不能适应市场多样化、个性化、高端化要求。",
                          
                          ]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.titleLB.text = (dataArray![indexPath.row] as! String)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


