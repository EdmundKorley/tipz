# Pre-work - *Tipz*

**Tipz** is a simple tip calculator for iOS 📱

Submitted by: **Edmund Korley**
Time spent: **12** hours spent in total

# User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations.
* [ ] Remembering the bill amount across app restarts (if <10mins).
* [ ] Using local-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to start using the app. They just launch the app and start typing.

The following **additional** features are implemented:

- [x] A subview in settings of a fully implementation calculator (with +,-,/,\*,% operations) in case the user wants to do something a little more complicated with the tip.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/HpldBoB.gif' title='Tipz Video Walkthrough' width='' alt='Tipz Video Walkthrough' />

GIF created with [LiceCap](https://www.cockos.com/licecap/).

## Notes

iOS (Xcode) APIs very much fall into an object-oriented paradigm. Key to being proficient might lie in mastery of Swift and knowledge of available abstractions and how they work.

Need to get better at knowing what is an optional and what isn't. I guess this a part of knowing the Xcode API.

Going forward, need to figure the best way to pass data between views. This way I could pass the current bill being calculate to the full calculator view, and vice versa. Using AppDelegate.h file to declare an app-wide global var.

## License

	Copyright 2016 Edmund Korley

	Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
