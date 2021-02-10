//
//  ImageButtonCellViewModel.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import Foundation

class ImageButtonCellViewModel: TableViewCellViewModelProtocol {
    
    static var reuseID: String = "ImageButtonCell"
    static var nibName: String = "ImageButtonCell"
    
    private let imageBaseURLString = "https://image.tmdb.org/t/p/"
    private let imageSizeString = "w500"
    
    private let movie: Movie
    
    init(_ movie: Movie) {
        self.movie = movie
    }
     
    public var imageURL: URL? {
        let imageURLString = imageBaseURLString + imageSizeString + movie.poster_path
        return URL(string: imageURLString)
    }
    
    public var shouldShowButton: Bool {
        return true
    }
}
