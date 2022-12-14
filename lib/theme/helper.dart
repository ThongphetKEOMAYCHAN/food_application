import './constraint.dart';


getSvgIcon(icon) {
  return getSvgIcon(icon);
}

getImage(image) {
  return image_path + image;
}

getImageNetwork(url) {
  return url;
}

getHeight(width, [String ratio = "16:9"]) {
  var split = ratio.split(":");
  var wr = double.parse(split[0]);
  var hr = double.parse(split[1]);
  return (width / wr) * hr;
}
