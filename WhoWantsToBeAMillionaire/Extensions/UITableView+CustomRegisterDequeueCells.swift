//
//  UITableView+CustomRegisterDequeueCells.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 21.05.2022.
//

import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension UITableView {
    func registerWithNib<T: UITableViewCell>(registerClass: T.Type) {
        let defaultReuseIdentifier = registerClass.defaultReuseIdentifier
        let nib = UINib(
            nibName: String(describing: registerClass.self),
            bundle: nil)
        register(
            nib,
            forCellReuseIdentifier: defaultReuseIdentifier)
    }

    func register<T: UITableViewCell>(registerClass: T.Type) {
        let defaultReuseIdentifier = registerClass.defaultReuseIdentifier
        register(
            registerClass,
            forCellReuseIdentifier: defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: T.defaultReuseIdentifier,
            for: indexPath) as? T
        else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(
        withIdentifier identifier: T.Type,
        forIndexPath indexPath: IndexPath
    ) -> T? {
        guard let cell = dequeueReusableCell(
            withIdentifier: T.defaultReuseIdentifier,
            for: indexPath) as? T
        else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}

extension UICollectionView {
    func registerWithNib<T: UICollectionViewCell>(registerClass: T.Type) {
        let defaultReuseIdentifier = registerClass.defaultReuseIdentifier
        let nib = UINib(
            nibName: String(describing: registerClass.self),
            bundle: nil)
        register(
            nib,
            forCellWithReuseIdentifier: defaultReuseIdentifier)
    }
}

extension UICollectionView {
    func registerWithNibSectionHeader<T: UICollectionReusableView>(registerClass: T.Type) {
        let defaultReuseIdentifier = registerClass.defaultReuseIdentifier
        let nib = UINib(
            nibName: String(describing: registerClass.self),
            bundle: nil)
        register(
            nib,
            forSupplementaryViewOfKind: UICollectionView
                .elementKindSectionHeader,
            withReuseIdentifier: defaultReuseIdentifier)
    }

    func dequeueReusableSectionHeader<T: UICollectionReusableView>(
        withIdentifier identifier: T.Type,
        forIndexPath indexPath: IndexPath
    ) -> T? {
        guard let cell = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.defaultReuseIdentifier,
            for: indexPath) as? T
        else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }

    func dequeueReusableCell<T: UICollectionViewCell>(
        withIdentifier identifier: T.Type,
        forIndexPath indexPath: IndexPath
    ) -> T? {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: T.defaultReuseIdentifier,
            for: indexPath) as? T
        else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}

extension UITableViewCell: ReusableView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView: ReusableView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionView: ReusableView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewController: ReusableView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReusableView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
