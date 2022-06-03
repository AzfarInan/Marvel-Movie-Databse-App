//
//  ViewController.swift
//  Marvel Movie Database App
//
//  Created by BS851 on 3/6/22.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var movieData = [MovieData]()
    var movieManager = MovieManager()
    
//    var limit = 20
//    var totalEntries = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.dataSource = self
        movieTableView.delegate = self
        movieManager.delegate = self
        
        movieManager.fetchMovieList(pageNumber: 1)
        
        movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "movieViewCell")
    }
}

extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("index: \(indexPath.row)")
    
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "movieViewCell", for: indexPath) as! MovieCell
        
        cell.setMovie(movie: movieData[indexPath.row])
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//
//        if indexPath.row == movieData.count - 1 {
//            if movieData.count - 1 < totalEntries {
//                var index = movieData.count
//                limit = index + 20
//                while index < limit {
//                    print("index inside willDisplay: \(index)")
//                    movieData[indexPath.row] = MovieData(title: "Test Movie", detail: "Test Details", image: "/w2PMyoyLU22YvrGK3smVM9fW1jj.jpg")
//                    index = index + 1
//                }
//                self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
//            }
//        }
//    }
    
    @objc func loadTable() {
        self.movieTableView.reloadData()
    }
    
}

extension MovieViewController : MovieManagerDelegate {
    func didUpdateMovieList(_ movieManager: MovieManager, movieData: [MovieData]) {
        print("Calling")
        self.movieData = movieData
        
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

