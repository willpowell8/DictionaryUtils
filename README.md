# DictionaryUtils

Dictionary utils allows you to use JSON like referencing to travers an object.

[![CI Status](http://img.shields.io/travis/willpowell8/DictionaryUtils.svg?style=flat)](https://travis-ci.org/willpowell8/DictionaryUtils)
[![Version](https://img.shields.io/cocoapods/v/DictionaryUtils.svg?style=flat)](http://cocoapods.org/pods/DictionaryUtils)
[![License](https://img.shields.io/cocoapods/l/DictionaryUtils.svg?style=flat)](http://cocoapods.org/pods/DictionaryUtils)
[![Platform](https://img.shields.io/cocoapods/p/DictionaryUtils.svg?style=flat)](http://cocoapods.org/pods/DictionaryUtils)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

DictionaryUtils is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod "DictionaryUtils"
```

## Usage
Lets say we define an aribitary dictionary that has an arrry within it. We ideally want to be able to access properties without referencing each child object, but in a more friendly fashion.

```swift
let data = ["data":["ary":[["value":1,"property1":"WELCOME"],["value":0,"property1":"WELCOME2"]]]]

```
We can find the property of a child by using the the following code

```swift
do {
    let output = try data.readString("data.ary[0].property1")
    print(output!)
}catch{
    print("ERROR")
}

```

This library will also let you do parameter based discovery within arrays like the below example:

```swift
do {
    let output = try data.readString("data.ary[value=0].property1")
    print(output!)
}catch{
    print("ERROR")
}

```



## Author

willpowell8

## License

DictionaryUtils is available under the MIT license. See the LICENSE file for more info.
