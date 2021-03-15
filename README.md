# News App

News application with [New York Times open API](https://developer.nytimes.com)


## Usage

Get your NYT API Key and put the key below
```swift
private func getUrlString() -> String {
     if let apiKey = ApiKey.getApiKey() {
         return NewsRoutes.shared.getNews(apiKey: apiKey)
     } else {
         /// put your own api key
         return NewsRoutes.shared.getNews(apiKey: "")
    }
}
```

## Screenshot

<img src="https://github.com/bagasstb/NewsApp/blob/develop/Screenshot/home.png" width="300">
