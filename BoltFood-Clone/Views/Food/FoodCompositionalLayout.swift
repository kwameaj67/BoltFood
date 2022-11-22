//
//  FoodCompositionalLayout.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 22/11/2022.
//

import UIKit


class FoodCompositionalLayout {
    
    static let shared = FoodCompositionalLayout()
    
    private init() {}
    
    
    func discountLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                       
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(250), heightDimension: .absolute(170)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)), elementKind: HeaderCollectionReusableView.reusableId, alignment: .top)
        ]
        return section
    }
    
    func deliveryLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                       
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(250), heightDimension: .absolute(170)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)), elementKind: HeaderCollectionReusableView.reusableId, alignment: .top)
        ]
        return section
    }
    
    func topRatedLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                       
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(250), heightDimension: .absolute(200)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)), elementKind: HeaderCollectionReusableView.reusableId, alignment: .top)
        ]
        return section
    }
    
    func popularLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                       
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(250), heightDimension: .absolute(170)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)), elementKind: HeaderCollectionReusableView.reusableId, alignment: .top)
        ]
        return section
    }
    
    func restaurantsLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                       
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(260)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 30, bottom: 10, trailing: 30)
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)), elementKind: HeaderCollectionReusableView.reusableId, alignment: .top)
        ]
        return section
    }
    
    func defaultLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(170)), subitems: [item])
       
        let section = NSCollectionLayoutSection.init(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
