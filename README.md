# WorldTimeAPI-ios

[![main](https://github.com/Take111/WorldTimeAPI-ios/actions/workflows/main.yml/badge.svg)](https://github.com/Take111/WorldTimeAPI-ios/actions/workflows/main.yml)

WorldTimeAPI-ios is a Swift package that provides a convenient way to interact with the WorldTime API. It allows iOS developers to easily fetch current time information for various timezones in their applications.

> [!NOTE] 
> WorldTimeAPI-ios utilizes the WorldTime API. For detailed information and documentation about the WorldTime API, please refer to the following link:
[WorldTime API Documentation](http://worldtimeapi.org/)

## Installation

### Swift Package Manager

You can add WorldTimeAPI-ios to your project using Swift Package Manager. In Xcode, go to File > Swift Packages > Add Package Dependency and enter the repository URL:

```
https://github.com/Take111/WorldTimeAPI-ios.git
```

Alternatively, you can add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/Take111/WorldTimeAPI-ios.git", from: "0.1.0")
]
```

## How to Use

Here's a quick example of how to use WorldTimeAPI-ios in your project:

```swift
import WorldTimeAPIiOS

let client = WorldTimeClient()

// Fetch current time for a specific timezone
do {
    let currentTime = try await client.fetchCurrentTime(with: .etc(.utc))
    print("Current UTC time: \(currentTime.datetime)")
} catch {
    print("Error fetching time: \(error)")
}

// Fetch current UTC time as a TimeInterval
do {
    if let timeInterval = try await client.fetchUTCDateTimeInterval() {
        print("Current UTC time interval: \(timeInterval)")
    }
} catch {
    print("Error fetching UTC time interval: \(error)")
}

// Fetch current UTC time as a Date
do {
    if let date = try await client.fetchUTCDateTime() {
        print("Current UTC date: \(date)")
    }
} catch {
    print("Error fetching UTC date: \(error)")
}
```

## Contribution

Contributions to WorldTimeAPI-ios are welcome! Here's how you can contribute:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please make sure to update tests as appropriate and adhere to the project's coding style.

## License

This project is licensed under the MIT License. However, please note that the API used in this project belongs to WorldTimeAPI. Be sure to check the WorldTimeAPI's terms and conditions for usage of their API.
