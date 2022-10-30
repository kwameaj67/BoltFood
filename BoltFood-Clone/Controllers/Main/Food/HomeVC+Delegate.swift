//
//  HomeVC+Delegate.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 07/09/2022.
//

import UIKit


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return discountFood.count
        }
        else if section == 1{
            return deliveryFood.count
        }
        else if section == 2{
            return topRatedFood.count
        }
        else if section == 3{
            return popularFood.count
        }
        else if section == 4{
            return restaurantFood.count
        }
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.reusableId, for: indexPath) as! DiscountCollectionViewCell
            cell.data = discountFood[indexPath.row]
            return cell
        }
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FreeDeliveryCollectionViewCell.reusableId, for: indexPath) as! FreeDeliveryCollectionViewCell
            cell.data = deliveryFood[indexPath.row]
            return cell
        }
        else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRatedCollectionViewCell.reusableId, for: indexPath) as! TopRatedCollectionViewCell
            cell.data = topRatedFood[indexPath.row]
            return cell
        }
        else if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.reusableId, for: indexPath) as! PopularCollectionViewCell
            cell.data = popularFood[indexPath.row]
            return cell
        }
        else if indexPath.section == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllRestaurantsCollectionViewCell.reusableId, for: indexPath) as! AllRestaurantsCollectionViewCell
            cell.data = restaurantFood[indexPath.row]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableId, for: indexPath)
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.reusableId, for: indexPath) as! HeaderCollectionReusableView
        if indexPath.section == 0 {
            view.headingLabel.text = "🎁 Discount on the entire menu"
            view.headingButton.isHidden = false
            view.headingButton.alpha = 1
        }
        else if indexPath.section == 1 {
            view.headingLabel.text = "Free Delivery"
            view.headingButton.isHidden = false
            view.headingButton.alpha = 1
        }
        else if indexPath.section == 2 {
            view.headingLabel.text = "Top rated"
            view.headingButton.isHidden = false
            view.headingButton.alpha = 1
        }
        else if indexPath.section == 3 {
            view.headingLabel.text = "Popular"
            view.headingButton.isHidden = false
            view.headingButton.alpha = 1
        }
        else if indexPath.section == 4 {
            view.headingLabel.text = "All restaurants"
            view.headingLabel.font = UIFont(name: font.bold.rawValue, size: 18)
            view.headingButton.isHidden = true
            view.headingButton.alpha = 0
        }
        return view
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let _ = discountFood[indexPath.row]
            let vc = FoodDetailVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
