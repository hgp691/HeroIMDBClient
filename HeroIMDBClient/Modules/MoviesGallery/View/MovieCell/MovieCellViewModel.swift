//
//  MovieCellViewModel.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 3/02/21.
//

import Foundation

public class MovieCellViewModel {
    
    static var reuseIdentifier = "MovieCell"
    static var nibName = "MovieCell"

    private let imageBaseURLString = "https://image.tmdb.org/t/p/"
    private let imageSizeString = "w300"
    
    let movie: Movie
    
    public init(_ movie: Movie) {
        self.movie = movie
    }
    
    public var imageURL: URL? {
        let imageURLString = imageBaseURLString + imageSizeString + movie.poster_path
        return URL(string: imageURLString)
    }
}

extension MovieCellViewModel: Hashable {
    
    public static func == (lhs: MovieCellViewModel, rhs: MovieCellViewModel) -> Bool {
        return lhs.movie.id == rhs.movie.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(movie.id)
    }
}
