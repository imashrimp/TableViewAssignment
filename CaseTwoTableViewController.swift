//
//  CastTwoTableViewController.swift
//  TableViewAssignment
//
//  Created by 권현석 on 2023/07/27.
//

import UIKit

class CaseTwoTableViewController: UITableViewController {
    
    let sectionZeroRows: [String] = ["공지사항", "실험실", "버전정보"]
    let sectionFirstRows: [String] = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let sectionSecondRows: [String] = ["고객센터/도움말"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        tableView.backgroundColor = .black

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
//            tableView.tableHeaderView?.tintColor = .white
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else if section == 2 {
            return "기타"
        } else {
            print("헤더 타이틀 오류났다!!!!")
            return ""
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 4
        } else if section == 2 {
            return 1
        } else {
            print("\(#function) 오류났다 찾아라!!!!!")
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "caseTwo")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = sectionZeroRows[indexPath.row]
            cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
        } else if indexPath.section == 1 {
            cell.textLabel?.text = sectionFirstRows[indexPath.row]
            cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
        } else if indexPath.section == 2 {
            cell.textLabel?.text = sectionSecondRows[indexPath.row]
            cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
        } else {
            print("셀 디자인 오류났다!!!!")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
