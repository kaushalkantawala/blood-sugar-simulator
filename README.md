# blood-sugar-simulator
Blood Sugar Simulator

## Usage

Inputs to this project are in the form of a plist file in the following format:

    <person_name>-<yyyy-mm-dd>.plist
e.g. kaushal-2015-08-11.plist

The plist file contains an array of blood sugar modifiers (food/exercise) and each element of the array is a dictionary with the following keys:
Type (NSString *)
Name (NSString *)
LoggingTS (NSDate *)

The output is a list of blood sugar and glycation values printed on console every 5 minutes along with the corresponding timestamp.

Simply running the program in the XCode simulator prints the output on console.

To use a different set of inputs, modify the existing plist file or add a new plist file in the format described above and point to it in LoggingController : create

## Project Organization

Source Code files are divided into the following groups in XCode:

 Core: Files common to any iOS project.

 Utilities: App wide defines, constants, categories and extensions, etc.

 Models: Data models of objects.

 Views: Views for when the project has a UI component.

 Controllers: Controllers for the app.

 Resources: Plists describing the blood sugar modifiers, storyboard and xib files.

 Supporting Files: Input plists

## Future Work

- Implement LoggingView to allow user to enter food and exercise through UI.

- Implement a display view to show the graph of blood sugar and glycation in the app.

- Save the user's food and exercise history by creating a plist from the entries through LoggingView.
