//
//  MovieStorage.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 31/01/21.
//

import CoreData

public struct MovieStorage {
    
    let movieQueue = DispatchQueue(label: "MovieDispatchQueue")
    let store: HeroDataStore
    
    public init(_ store: HeroDataStore) {
        self.store = store
    }
}

extension MovieStorage: MovieStorageProtocol {
    
    public func save(moviePage: MoviePage) {
        
        var movies = moviePage.results
        for index in 0 ..< movies.count {
            movies[index].page = moviePage.page
            self.save(movie: movies[index])
        }
    }
    
    public func save(movie: Movie) {
        movieQueue.sync {
            let context = self.store.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieDB")
            request.predicate = NSPredicate(format: "id == %i", Int16(movie.id))
            request.returnsObjectsAsFaults = true
            if let results = try? context.fetch(request) as? [MovieDB],
               let firstSaved = results.first {
                firstSaved.title = movie.title
                firstSaved.poster_path = movie.poster_path
                firstSaved.vote_average = movie.vote_average
                firstSaved.vote_count = movie.vote_count
                firstSaved.overview = movie.overview
                store.save()
            } else {
                let movieDBtoSave = MovieDatabaseWrapper(movie, context: context).getMovieDB()
                dump(movieDBtoSave)
                print("MovieDb saved")
                store.save()
            }
        }
    }
    
    public func retrieve(movie id: Int) -> Movie? {
        movieQueue.sync {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieDB")
            request.predicate = NSPredicate(format: "id == %i", Int16(id))
            request.returnsObjectsAsFaults = true
            let context = self.store.persistentContainer.viewContext
            do {
                if let results = try context.fetch(request) as? [MovieDB],
                   let first = results.first {
                    return MovieDatabaseWrapper(first).getMovie()
                }
            } catch {
                print("Error fetching Movie: \(error.localizedDescription)")
            }
            return nil
        }
    }
    
    public func retrieveAllMovies() -> [Movie] {
        movieQueue.sync {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieDB")
            request.returnsObjectsAsFaults = true
            let context = self.store.persistentContainer.viewContext
            do {
                if let results = try context.fetch(request) as? [MovieDB] {
                    return results.compactMap { MovieDatabaseWrapper($0).getMovie() }
                }
            } catch {
                print("Error fetching All Movies: \(error.localizedDescription)")
            }
            return []
        }
    }
    
    public func retrieveAllMovies(_ page: Int) -> [Movie] {
        movieQueue.sync {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieDB")
            request.predicate = NSPredicate(format: "page == %i", Int16(page))
            request.returnsObjectsAsFaults = true
            let context = self.store.persistentContainer.viewContext
            do {
                if let results = try context.fetch(request) as? [MovieDB] {
                    return results.compactMap { MovieDatabaseWrapper($0).getMovie() }
                }
            } catch {
                print("Error fetching Movies: \(error.localizedDescription)")
            }
            return []
        }
    }
    
    func movieCount() -> Int {
        movieQueue.sync {
            let context = self.store.persistentContainer.viewContext
            let request: NSFetchRequest<MovieDB> = MovieDB.fetchRequest()
            return (try? context.count(for: request)) ?? -1
        }
    }
}
