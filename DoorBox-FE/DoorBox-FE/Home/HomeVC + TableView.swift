//
//  HomeVC + TableView.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/28/25.
//

import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCellWithAccessory", for: indexPath)
            cell.selectionStyle = .none

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath)
            cell.selectionStyle = .none

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        20+90+20
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("셀 클릭됨: \(indexPath.row)")

        let photoDetailVC = PhotoDetailViewController()
        self.navigationController?.pushViewController(photoDetailVC, animated: true)
    }
    
    
}
