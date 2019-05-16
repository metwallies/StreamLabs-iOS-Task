//
//  ViewController.swift
//  StreamLabs
//
//  Created by islam metwally on 5/13/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

protocol DashboardViewProtocol: class {
    var presenter: DashboardPresenterProtocol? { get set }
}

class DashboardViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    @IBOutlet weak var dashboardTableView: UITableView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    var presenter: DashboardPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.configureView()
    }
    
    func configureView() {
        self.gradientView.addClearGradient(withColor: .darkBlue)
        self.configureTableView()
        self.configureCollectionView()
        self.favoriteCountLabel.text = self.presenter?.getFavoriteCount()
    }
    
    func configureData() {
        self.presenter = DashboardPresenter()
        self.presenter?.view = self
    }
    
    func configureTableView() {
        self.dashboardTableView.delegate = self
        self.dashboardTableView.dataSource = self
        self.dashboardTableView.tableHeaderView = headerView
        self.dashboardTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 96))
    }
    
    func configureCollectionView() {
        let nib: UINib = UINib(nibName: Constants.UsersCollectionViewCell.rawValue, bundle: nil)
        self.dashboardCollectionView.register(nib, forCellWithReuseIdentifier: Constants.UsersCollectionViewCell.rawValue)
        self.dashboardCollectionView.delegate = self
        self.dashboardCollectionView.dataSource = self
    }
    
    @IBAction func favoriteDidTouchUpInside(_ sender: Any) {
    
        self.presenter?.didFavorite()
        self.favoriteCountLabel.text = self.presenter?.getFavoriteCount()
        var frame: CGRect = favoriteButton.frame
        frame.origin = (favoriteButton.superview?.convert(favoriteButton.frame.origin, to: nil))!
        let animationLabel: UILabel = UILabel(frame: frame)
        animationLabel.font = UIFont.boldSystemFont(ofSize: 21)
        animationLabel.text = "+" + (self.presenter?.getFavoriteCount())!
        animationLabel.textColor = self.presenter?.getFavoriteColor()
        animationLabel.textAlignment = .center
        animationLabel.isUserInteractionEnabled = false
        self.view.addSubview(animationLabel)
        
        let animationView: UIView = UIView(frame: frame)
        animationView.layer.cornerRadius = favoriteButton.layer.cornerRadius
        animationView.backgroundColor = .opaqueDarkOrange
        animationView.isUserInteractionEnabled = false
        self.view.addSubview(animationView)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            animationLabel.transform = CGAffineTransform.init(translationX: 0, y: -350)
            animationView.transform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
            animationLabel.alpha = 0.25
            animationView.alpha = 0.25
        }) { (_) in
            animationLabel.removeFromSuperview()
            animationView.removeFromSuperview()
        }
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.numberOfRows(inSection: section))!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CommentTableViewCell = (tableView.dequeueReusableCell(withIdentifier: Constants.CommentTableViewCell.rawValue) as? CommentTableViewCell)!
        cell.comment =  self.presenter?.commentFor(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.presenter?.didSelectComment(atIndexPath: indexPath)
    }
}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.presenter?.numberOfItems(inSection: section))!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UsersCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: Constants.UsersCollectionViewCell.rawValue, for: indexPath) as? UsersCollectionViewCell)!
        
        cell.user = self.presenter?.userFor(indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        self.presenter?.didSelectUser(atIndexPath: indexPath)
    }
}

extension DashboardViewController: DashboardViewProtocol {
    
}
