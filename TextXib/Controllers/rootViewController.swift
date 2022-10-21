//
//  rootViewController.swift
//  TextXib
//
//  Created by Zaggle on 22/09/22.
//

import UIKit
import Alamofire

class rootViewController: UIViewController {
    
    
    var movies = [Movie]()
    var page:Int = 1
    @IBOutlet weak var movieTable: UITableView!
    
    @IBOutlet weak var  collectionView:UICollectionView!
//    let movieCount:Int?
    var movieManeger = MovieManeger()
    let k = DetailsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieTable.register(UINib(nibName: "TableViewTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewTableViewCell")
        
        // Do any additional setup after loading the view.

        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CollectionViewCell")
        movieManeger.getData(completion: { data in
            self.movies = data!
            self.movieTable.reloadData()
            self.collectionView.reloadData()
        },pageNo:page)
        
        movieManeger.delegate = self
        movieTable.delegate = self
        movieTable.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @objc func loadTable(){
        self.movieTable.reloadData()
    }

    
}


extension rootViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let newurl = "https://image.tmdb.org/t/p/original\(movies[indexPath.row].poster_path ?? "")"
        
        let cell:TableViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewTableViewCell") as! TableViewTableViewCell
        
        cell.setProperties(title: movies[indexPath.row].title!, date: movies[indexPath.row].release_date!, rating: movies[indexPath.row].vote_average!, urlNew: newurl)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newurl = "https://image.tmdb.org/t/p/original\(movies[indexPath.row].poster_path ?? "")"
        k.coverTitle = movies[indexPath.row].title ?? ""
        k.release = movies[indexPath.row].release_date ?? ""
        k.overview = movies[indexPath.row].overview ?? ""
         let url = URL(string: newurl)
        k.imgUrl = url!
        self.navigationController?.pushViewController(k, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == movies.count-1){
            self.movieManeger.getData(completion: { data in
                self.movies += data!
                self.movieTable.reloadData()
                self.collectionView.reloadData()

            },pageNo:page+1)
            
        }
    }
   
}

extension rootViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let newurl = "https://image.tmdb.org/t/p/original\(movies[indexPath.row].poster_path ?? "")"
        
        
        
        collectionCell.setProperties(url:newurl)
        return collectionCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.movies.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 170, height: 300)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let k = DetailsViewController()
        let newurl = "https://image.tmdb.org/t/p/original\(movies[indexPath.row].poster_path ?? "")"
        
        k.coverTitle = movies[indexPath.row].title ?? ""
        k.release = movies[indexPath.row].release_date ?? ""
        k.overview = movies[indexPath.row].overview ?? ""
         let url = URL(string: newurl)
        k.imgUrl = url!
        self.navigationController?.pushViewController(k, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}




extension rootViewController:movieManegerDelegate{
    func didUpdatedNowShowing(movie:MovieModel){
        debugPrint(movie)
    }
    func didUpdateMovies(){
        
    }
    func didFailWithError(error:Error){
        print(error)
    }
}
