# PressableView

[![Platform](https://img.shields.io/cocoapods/p/PressableView.svg?style=flat)](https://cocoapods.org/pods/PressableView)
[![Version](https://img.shields.io/cocoapods/v/PressableView.svg?style=flat)](https://cocoapods.org/pods/PressableView)
[![CI Status](https://img.shields.io/travis/linusgeffarth/PressableView.svg?style=flat)](https://travis-ci.org/linusgeffarth/PressableView)
[![License](https://img.shields.io/cocoapods/l/PressableView.svg?style=flat)](https://cocoapods.org/pods/PressableView)

## Table of Contents:
1. [Requirements](#requirements)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Credits](#credits)
5. [License](#license)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 11.0
- Swift 4.0
- Xcode 9

## Installation

PressableView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PressableView'
```

## Usage

To use a `PressableView`, simply drag a regular `UIView` into your view inside the storyboard. Then assign the class `PressableView` to it:

![assign class](https://github.com/LinusGeffarth/PressableView/blob/master/assets/screenshots/screenshot%20assign%20class.png)

Then, you may assign a custom value for how much the view should shrink when pressed.
The unit for this is `%`. Hence, setting it to `0.5` will make the view shrink to half of its original size. Setting it to `1` will make it not shrink at all.

The default value is `0.96`.

![assign value](https://github.com/LinusGeffarth/PressableView/blob/master/assets/screenshots/screenshot%20assign%20value.png)

Now, hook up any actions, you'd like it to perform. You may use any of the following:

- `primaryActionTriggered` (acts like `touchUpInside`)
- `touchUpInside`
- `touchDown`
- `touchDragInside`
- `touchDragOutside`

You can either hook up the actions directly through the interface builder, or by assigning a target in code:

![assign actions](https://github.com/LinusGeffarth/PressableView/blob/master/assets/screenshots/screenshot%20assign%20actions.png)

However, you can also make use of the `PressableViewDelegate`.  
It holds the following method:

    @objc optional func pressableViewDidTrigger(_ pressableView: PressableView)

Note, though, that this delegate method will only be called when `primaryActionTriggered` / `touchUpInside` is called - so like a regular button.

To make use of the delegate, make your view controller conform to the protocol first:

    class ViewController: UIViewController, PressableViewDelegate

Then, assign the view controller to the `_pressableDelegate` property of your `PressableVeiw`:

    pressableView._pressableDelegate = self

Note, that you can also do this in interface builder.

## Collaboration

If you find any bugs, or want to propose enhancements, please make sure to open an [issue](https://github.com/LinusGeffarth/PressableView/issues), or submit a [pull request](https://github.com/LinusGeffarth/PressableView/pulls) if you have made any changes you'd like for me to merge.

## Credits

Linus Geffarth

## License

PressableView is available under the MIT license. See the LICENSE file for more info.
