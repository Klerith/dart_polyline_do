# Polyline_do

## Mapbox supported

Polyline encoding is a lossy compression algorithm that allows you to store a series of coordinates as a single string.

Polyline is a dart port of Google's Polyline Algorithm explained [here](https://developers.google.com/maps/documentation/utilities/polylinealgorithm). Inspired by Mapbox's polyline.js. Compatible with Dart 3.

## Usage

### A simple usage example

Two named constructors are provided Polyline.Decode and Polyline.Encode.

Calling `Polyline.encode` will compute the __encodedString__ and set the passed in coordinates to __decodedCoords__ on the instance of Polyline so that each instance of Polyline has access to the correct encoded string and subsequent decoded coordinates. Likewise, calling `Polyline.decode` computes the list of coordinates from the encoded string and sets the passed in encoded string to the instance of Polyline.

Note that a precision of 6 is standard.

```dart
import 'package:polyline_do/polyline_do.dart';

void main() {
  Polyline polyline;

  /// List<List<double> coordinates;
  const coordinates = [
    [33.80119, -84.34788],
    [35.10566, -80.8762],
    [30.4526, -81.71116],
    [28.57888, -81.2717]
  ];
  const precision = 5;
  const encoded = 'mxhmEfeyaO}w}F_aeTrxk[nabDv}lJsytA';

  // Encode a list of coordinates with precision 5 to produce the encoded string
  polyline = Polyline.encode(decodedCoords: coordinates, precision: 5);
  print('Encoded String: ${polyline.encodedString}, Coords: ${polyline.decodedCoords}');

  // Decode an encoded string to a list of coordinates
  polyline = Polyline.decode(encodedString: encoded, precision: precision);
  print('Decoded Coords: ${polyline.decodedCoords}');
  print('String: ${polyline.encodedString}');

  // Calculate the distance of an encoded polyline, and decode the polyline
  polyline =  Polyline.distance(encodedString: encoded,  unit: 'kilometers');
  // By calling  length the encodedString, decodedCoords, and distance variables
  // of the Polyline class are available
  print('Distance: ${polyline.distance!.floor()}km , Encoded String: ${polyline.encodedString} Decoded Coords: ${polyline.decodedCoords}');

}
```
