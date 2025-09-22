//
//  HomeVC + TableView.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/28/25.
//

import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < accessoryCount {
            guard let cell = tableView.dequeueReusableCell(
                            withIdentifier: "PhotoCellWithAccessory", for: indexPath
                        ) as? PhotoCellWithAccessory else {
                            assertionFailure("PhotoCellWithAccessory 매핑 오류")
                            return UITableViewCell()
                        }
            cell.selectionStyle = .none
                return cell
        } else {
            let dataIndex = indexPath.row - accessoryCount
            guard items.indices.contains(dataIndex) else { return UITableViewCell() }

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "PhotoCell", for: indexPath
            ) as? PhotoCell else {
                assertionFailure("PhotoCell 매핑 오류")
                return UITableViewCell()
            }
            let model = items[dataIndex]
            cell.selectionStyle = .none
            cell.photoImageView.image = model.image
            cell.ageValueLabel.text = model.age
            cell.genderValueLabel.text = model.gender
            cell.emotionValueLabel.text = model.emotion
            
            if model.emotion == "Anger" {
                cell.photoImageView.layer.borderWidth = 5
                cell.sirenImageView.isHidden = false
            } else {
                cell.photoImageView.layer.borderWidth = 0
                cell.sirenImageView.isHidden = true
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accessoryCount + items.count
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
