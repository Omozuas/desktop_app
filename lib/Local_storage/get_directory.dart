import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> getPicturesPath() async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  var pathList = appDocDirectory.path.split('\\');
  pathList[pathList.length - 1] = 'Downloads';
  var downloadpath = pathList.join('\\');
  print(appDocDirectory);
  print(downloadpath);
  return downloadpath;
}
