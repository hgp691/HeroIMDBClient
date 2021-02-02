//
//  MovieDatabaseWrapper.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 31/01/21.
//

import CoreData

public struct MovieDatabaseWrapper {
    
    private(set) var movie: Movie?
    private(set) var movieDB: MovieDB?
    
    var context: NSManagedObjectContext?
    
    public init(_ movie: Movie, context: NSManagedObjectContext? = nil) {
        self.movie = movie
        self.context = context
    }
    
    public init(_ movieDB: MovieDB) {
        self.movieDB = movieDB
    }
    
    public init() { }
    
    public func getMovie() -> Movie? {
        if let movie = self.movie {
            return movie
        } else if let movieDB = self.movieDB {
            return getMovie(movieDB: movieDB)
        } else {
            return nil
        }
    }
    
    public func getMovieDB() -> MovieDB? {
        if let movieDB = self.movieDB {
            return movieDB
        } else if let movie = self.movie,
                  let context = self.context {
            return getMovieDB(movie: movie, with: context)
        } else {
            return nil
        }
    }
    
    private func getMovieDB(movie: Movie, with context: NSManagedObjectContext) -> MovieDB {
        let movieDB = MovieDB(context: context)
        movieDB.id = Int16(movie.id)
        movieDB.title = movie.title
        movieDB.poster_path = movie.poster_path
        movieDB.vote_average = movie.vote_average
        movieDB.vote_count = movie.vote_count
        movieDB.overview = movie.overview
        movieDB.page = Int16(movie.page)
        return movieDB
    }
    
    private func getMovie(movieDB: MovieDB) -> Movie {
        
        let movie = Movie(id: Int(movieDB.id),
                          title: movieDB.title ?? "",
                          poster_path: movieDB.poster_path ?? "",
                          vote_average: movieDB.vote_average,
                          vote_count: movieDB.vote_count,
                          overview: movieDB.overview ?? "",
                          page: Int(movieDB.page))
        return movie
    }
}
