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
  print(
      'Encoded String: ${polyline.encodedString}, Coords: ${polyline.decodedCoords}');

  // Decode an encoded string to a list of coordinates
  polyline = Polyline.decode(encodedString: encoded, precision: precision);
  print('Decoded Coords: ${polyline.decodedCoords}');
  print('String: ${polyline.encodedString}');

  // Calculate the distance of an encoded polyline, and decode the polyline
  polyline = Polyline.distance(encodedString: encoded, unit: 'kilometers');
  // By calling  length the encodedString, decodedCoords, and distance variables
  // of the Polyline class are available
  print(
      'Distance: ${polyline.distance!.floor()}km , Encoded String: ${polyline.encodedString} Decoded Coords: ${polyline.decodedCoords}');
}
