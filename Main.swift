// This program reads information from file, 
// it then sorts using selection sort.

//
//  Created by Sarah Andrew

//  Created on 2023-03-22.

//  Version 1.0

//  Copyright (c) 2023 Sarah. All rights reserved.
import Foundation

// Create class for song.
class Song {
    // Declaring variable
    var title: String
    var artist: String
    var duration: Int

    // Create constructors.
    init(title: String, artist: String, duration: Int) {
        // Refernecing object.
        self.title = title
        self.artist = artist
        self.duration = duration
    }
}


// Creating another class for user.
class User {
    // Declare instance & fields.
    var _currentIndex: Int
    var _name: String
    var _songs: [Song]
    var _currentSong: Song?

    // Creating constructor.
    init(name: String) {
        // Referencing object.
        self._name = name
        self._songs = []
        self._currentSong = nil
        self._currentIndex = -1
    }

    // Define method.
    func getSong() -> [Song] {
        // Return.
        return _songs
    }

    // Method for adding song to playlist.
    func addSong(song: Song) {
        // Adding a new song.
        _songs.append(song)
        // If statement to add song.
        if _currentIndex == -1 {
            // Reset.
            _currentIndex = 0
            _currentSong = song
        }
         
        // Update the playlist with the new songs.
        playlist.setSongs(songs: _songs)
    }

}

// Class for playlist options!
class Playlist {
    // Declare field & instances.
    var _isShuffle: Bool = false
    var _songs: [Song]
    var _currentSong: Song?
    var _currentIndex: Int
    var _isRepeat: Bool = false

    // Creating playlist constructor.
    init() {
        // Referencing object.
        self._songs = []
        self._currentIndex = -1
    }

    // Method for defining shuffle mode.
    func setShuffle(isShuffle: Bool) {
        // Referencing object.
        self._isShuffle = isShuffle
        // Setting shuffle mode.
        if isShuffle {
            shufflePlaylist()
        }
    }

    // Define method to set song.
    func setSongs(songs: [Song]) {
        self._songs = songs
        // Resets index.
        _currentIndex = 0
    }

    // Define method for current index.
    func getCurrentIndex() -> Int {
        return _currentIndex
    }

    // Method allowing to repeat, setting repeat on.
    func setRepeat(isRepeat: Bool) {
        self._isRepeat = isRepeat
    }

    // Method for repeating function.
    func repeatCurrentSong() {
        // See if the list is empty, if not, play song
        // if empty, display to user no songs to repeat.
        if !_songs.isEmpty {
            playCurrentSong()
        } else {
            print("There are no songs to repeat.")
        }
    }

    // Defining method to pause song.
    func pause() {
        // Checking to see if list is empty,
        // if not, play song, if so, display no song 
        // to pause.
        if !_songs.isEmpty {
            print("Song has been paused!")
            print()
        } else {
            print("Seems like there are no songs to pause.")
        }
    }

    // Defining method to remove song.
    func removeSong() {
        // Checking to see if the list is empty or not.
        if !_songs.isEmpty {
            // Defining a specific range.
            if _currentIndex >= 0 && _currentIndex < _songs.count {
                // Displaying & allowing song to be removed 
                // at specific index.
                let songRemove = _songs.remove(at: _currentIndex)
                print("Removed song: \(songRemove.title)")
                print()

                // Decrements counter.
                _currentIndex -= 1

                // Sets a specified range.
                if _currentIndex >= 0 && _currentIndex < _songs.count {
                    // Calls method.
                    playCurrentSong()
                } else {
                    // Shrinks llist
                    _currentIndex = _songs.count - 1
                }
            } else {
                print("No song is currently playing.")
                print()
            }
        } else {
            print("No songs in the playlist.")
            print()
        }
    }

    // Defining function for back tracking.
    func backTrack() {
        // See if list is empty.
        if !_songs.isEmpty {
            // Decrement counters.
            _currentIndex -= 1
            
            // Defining range.
            if _currentIndex >= 0 && _currentIndex < _songs.count {
                playCurrentSong()
            } else {
                // Checking to see how far user can go
                // in terms of backtracking for list.
                if _currentIndex < 0 {
                    print("Beginning of playlist reached.")
                    // Resets index & calls method.
                    _currentIndex = 0
                    playCurrentSong()
                } else {
                    // Display and shortens list.
                    print("End of playlist reached.")
                    _currentIndex = _songs.count - 1
                    print()
                }
            }
        } else {
            print("No songs in the playlist.")
            print()
        }
    }

    // Defining method for skipping song.
    func skipForward() {
        // Checks to see if list is empty.
        if !_songs.isEmpty {
            // Increments counter
            _currentIndex += 1

            // Defines a specific range & calls method.
            if _currentIndex >= 0 && _currentIndex < _songs.count {
                playCurrentSong()
            } else {
                print("End of playlist reached.")
                /// Shrinks list.l
                _currentIndex = _songs.count - 1
                print()
            }
        } else {
            print("No songs in the playlist.")
            print()
        }
    }
    
    // Defining method for playing song & displaying to user.
    func playSong() {
        if let currentSong = _currentSong {
            print("Now playing... \(currentSong.title) by \(currentSong.artist) for \(currentSong.duration) seconds.")
            print()
        } else {
            print("No song is currently playing.")
        }
    }

    // Define method to shuffle song.
    func shufflePlaylist() {
        // Seeing if list is empty.
        if _songs.isEmpty {
            print("Playlist is empty. No songs to shuffle.")
            print()
            return
        }
    
        // Setting equal to list length.
        let length = _songs.count
        var counter = length - 1

        // Loop made in order to shuffle song.
        while counter > 0 {
            // Generating at random index, shuffling song, and 
            // swapping, then decrementing counter.
            let counter1 = Int.random(in: 0...counter)
            _songs.swapAt(counter, counter1)
            counter -= 1
        }
        // Resets index  and sets currentSong
        // to that specific index.
        _currentIndex = 0
        _currentSong = _songs[_currentIndex]
        playCurrentSong()
    }

    // Defining method for playing song.
    func playCurrentSong() {
        // Checking to see if song is empty.
        if !_songs.isEmpty {
            // Defining  range then playing song.
            if _currentIndex >= 0 && _currentIndex < _songs.count {
                _currentSong = _songs[_currentIndex]
                playSong()
            } else {
                print("No song is currently playing.")
            }
        } else {
            print("No songs in the playlist.")
        }
    }
}


// Define input & output paths.
let inputFile = "input.txt"
let outputFile = "output.txt"

// Creating user instance.
let user = User(name: "Sandy")

// Creating instance for playlist.
let playlist = Playlist()

// Declare variables.
var userChoice = 0
var songTitle = ""
var songArtist = ""
var songDuration = 0
var currentIndex = -1
var isSongAdded = false


// Usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for opening.")
        exit(1)
    }

    // Read context for file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string into lines, ensuring reading empty line
    // also creating list.
    let inputLines = inputString.components(separatedBy: .newlines)
    

    // Processing each line of input.
    for line in inputLines {
        // Split line by spaces.
        let dataPlaylist = line.components(separatedBy: " ")

        // Checking if line contains all elements.
        if dataPlaylist.count == 3 {
            // Get song information.
            songTitle = dataPlaylist[0]
            songArtist = dataPlaylist[1]
            songDuration = Int(dataPlaylist[2]) ?? 0
            
            // Creating song instance.
            let song = Song(title: songTitle, artist: songArtist, duration: songDuration)

            // Add song to the playlist.
            user.addSong(song: song)

            // Display song info to user.
            print("Title: \(songTitle)")
            print("Artist: \(songArtist)")
            print("Duration: \(songDuration)")
            print()

            // Write said info to output file.
            let data1 = Data("Title: \(songTitle)\n".utf8)
            output.write(data1)
            let data2 = Data("Artist: \(songArtist)\n".utf8)
            output.write(data2)
            let data3 = Data("Duration: \(songDuration)\n".utf8)
            output.write(data3)

            // Set flags and indexes.
            isSongAdded = true
            currentIndex = 0
        }
    }
    // Close input & output file.
    input.closeFile()
    output.closeFile()
} catch {
    // If error occurs reading file.
    print("error reading input file:", error)
    exit(1)
}

// Setting playlist song.
playlist.setSongs(songs: user.getSong())
// Usage of loop to execute choices.
repeat {
    // Display choices.
    print("Here are the choices you may execute on the playlist!")
    print("01 | Play song.")
    print("02 | Shuffling song.")
    print("03 | Repeat song.")
    print("04 | Skip forward.")
    print("05 | Backtrack song.")
    print("06 | Remove track.")
    print("07 | Add song.")
    print("08 | Pause song.")
    print("0  | Exit program.")
    print()

    // Receive user input.
    if let userInput = Int(readLine()!) {
        // Set equal to one another.
        userChoice = userInput

        // If statement to reflect user input.
        if userChoice == 1 {
            // Check if currentIndex is within valid range.
            if currentIndex >= 0 && currentIndex < user._songs.count {
                // Declare variable.
                var currentSong: Song

                // Checks to see if song has been added.
                if isSongAdded {
                    currentSong = user._songs[user._songs.count - 1]
                } else {
                    currentSong = user._songs[currentIndex]
                }
                print("Now playing... \(currentSong.title) by \(currentSong.artist) for \(currentSong.duration) seconds.")
                print()
            } else {
                print("No songs has been added.")
                print()
                
            }
        } else if userChoice == 2 {
            // Call method
            playlist.setShuffle(isShuffle: true)
        } else if userChoice == 3 {
            playlist.repeatCurrentSong()
        } else if userChoice == 4 {
            playlist.skipForward()
        } else if userChoice == 5 {
            playlist.backTrack()
        } else if userChoice == 6 {
            playlist.removeSong()
        } else if userChoice == 8 {
            playlist.pause()
        } else if userChoice == 0 {
            print("Program is now closing...")
        } else if userChoice == 7 {
            // If user would like to
            // add song to playlist & receiving user input.
            print()
            print("Enter song details (title, artist, duration): ")

            let songInfo = readLine()

            // Separating by comma, followed by space, also checking to see
            // if line contains all elements.
            if let songData = songInfo?.components(separatedBy: ", "), songData.count == 3 {
                songTitle = songData[0]
                songArtist = songData[1]

            // Parsing checking for right format & data.
            if let duration = Int(songData[2]) {
                songDuration = duration

                // Create a new song instance.
                let newSong = Song(title: songTitle, artist: songArtist, duration: songDuration)

                // Add the song to the user's playlist.
                user.addSong(song: newSong)
                print("New song has been added to the playlist!")
                print()
                

                // Display current playlist.
                print("Title: \(songTitle)")
                print("Artist: \(songArtist)")
                print("Duration: \(songDuration)")
                print()
            } else {
                print("Invalid details, song has not been added.")
                print()
                
            }
    
        } else {
            // Display to user.
            print("Invalid! Please enter either or options, listed above.")
            print()
        }
    
    } else {
        // Display to user.
        print("Invalid, please enter valid input.")
    }
    
}
// Condition for loop to break out.
} while userChoice != 0

