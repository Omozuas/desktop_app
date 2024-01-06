import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:codegraniteflutter/Local_storage/get_directory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:codegraniteflutter/widgets/buttons/rowWithDownlodAndShareButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';
import '../../colorsConstrain/colorsHex.dart';

class DetailAccountWorkInfo extends StatefulWidget {
  DetailAccountWorkInfo({
    super.key,
  });

  @override
  State<DetailAccountWorkInfo> createState() => _DetailAccountWorkInfoState();
}

class _DetailAccountWorkInfoState extends State<DetailAccountWorkInfo> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  // late VideoPlayerController _videoPlayerController;
  // ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    // _videoPlayerController = VideoPlayerController.asset(
    //     'assets/videos/AnimePahe_Rurouni_Kenshin_-_Meiji_Kenkaku_Romantan_2023_-_04_360p_SubsPlease.mp4');
    // _videoPlayerController.initialize().then((_) {
    //   setState(() {});
    // });
  }

  // @override
  // void dispose() {
  //   _videoPlayerController.dispose();
  //   super.dispose();
  // }

  String ddFile =
      'https://media.istockphoto.com/id/1352603244/photo/shot-of-an-unrecognizable-businessman-working-on-his-laptop-in-the-office.jpg?s=612x612&w=0&k=20&c=upiDYeAZEsxbUBdhX35MXm79drIXA-5Q-FcfmZk71lM=';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: GlobalColors.whiteText,
      child: Container(
        width: 725,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.whiteText),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 28.0, left: 28, right: 28, bottom: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("John doe project",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: GlobalColors.DarkBorder,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      width: 200,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Documents",
                            style: TextStyle(
                              fontSize: 18,
                              color: GlobalColors.DarkBorder,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        RowWithDownloadAndShareButton(
                          nameofproject: 'Project proposal .pdf',
                          share: 'Share',
                          sharebutton: () {},
                          download: 'Download',
                          downloadbutton: () => {
                            downloadFile(ddFile)
                            // FileDownloader.downloadFile(
                            //     url: ddFile.trim(),
                            //     onProgress: (name, progress) {
                            //       setState(() {
                            //         _progress = progress;
                            //       });
                            //     },
                            //     onDownloadCompleted: (value) {
                            //       success(
                            //           context: context,
                            //           message: 'success: $value');
                            //       setState(() {
                            //         _progress = null;
                            //       });
                            //     })
                          },
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        RowWithDownloadAndShareButton(
                          nameofproject: 'Project proposal .pdf',
                          share: 'Share',
                          sharebutton: () {},
                          download: 'Download',
                          downloadbutton: () => {
                            // downloadFile(ddFile)
                            // FileDownloader.downloadFile(
                            //     url: ddFile.trim(),
                            //     onProgress: (name, progress) {
                            //       setState(() {
                            //         _progress = progress;
                            //       });
                            //     },
                            //     onDownloadCompleted: (value) {
                            //       success(
                            //           context: context,
                            //           message: 'success: $value');
                            //       setState(() {
                            //         _progress = null;
                            //       });
                            //     })
                          },
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        RowWithDownloadAndShareButton(
                          nameofproject: 'Project proposal .pdf',
                          share: 'Share',
                          sharebutton: () {},
                          download: 'Download',
                          downloadbutton: () => {
                            // downloadFile(ddFile)
                            // FileDownloader.downloadFile(
                            //     url: ddFile.trim(),
                            //     onProgress: (name, progress) {
                            //       setState(() {
                            //         _progress = progress;
                            //       });
                            //     },
                            //     onDownloadCompleted: (value) {
                            //       success(
                            //           context: context,
                            //           message: 'success: $value');
                            //       setState(() {
                            //         _progress = null;
                            //       });
                            //     })
                          },
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        RowWithDownloadAndShareButton(
                          nameofproject: 'Project proposal .pdf',
                          share: 'Share',
                          sharebutton: () {},
                          download: 'Download',
                          downloadbutton: () => {
                            // downloadFile(ddFile)
                            // FileDownloader.downloadFile(
                            //     url: ddFile.trim(),
                            //     onProgress: (name, progress) {
                            //       setState(() {
                            //         _progress = progress;
                            //       });
                            //     },
                            //     onDownloadCompleted: (value) {
                            //       success(
                            //           context: context,
                            //           message: 'success: $value');
                            //       setState(() {
                            //         _progress = null;
                            //       });
                            //     })
                          },
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        Text("See All",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: GlobalColors.dividerLine),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5), bottom: Radius.circular(5)),
                  ),
                  width: 687,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Prototype",
                            style: TextStyle(
                              fontSize: 18,
                              color: GlobalColors.DarkBorder,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Prototype Link:",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: GlobalColors.DarkBorder,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        // launchUrlString(
                                        //     'https://www.figma.com/proto/ABCDE12345/My-Project?page-id=67890%3A1&node-id=67891%3A456',
                                        //     mode:
                                        //         LaunchMode.externalApplication);
                                      },
                                      child: Text(
                                          "https://www.figma.com/proto/ABCDE12345/My-Project?page-id=67890%3A1&node-id=67891%3A456",
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: GlobalColors.DarkBorder,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              // Container(
                              //   width: 350,
                              //   height: 380,
                              //   child:
                              //       _videoPlayerController.value.isInitialized
                              //           ? VideoPlayer(_videoPlayerController)
                              //           : Container(),
                              // ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.share_sharp)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('share',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.file_download_rounded)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("download",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: GlobalColors.dividerLine,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: GlobalColors.dividerLine),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5), bottom: Radius.circular(5)),
                  ),
                  width: 687,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void downloadFile(url) async {
  // Get the downloads directory path
  String pixPath = await getPicturesPath();
  print(pixPath);

  // Create a save path in the downloads directory
  String savePath = join(pixPath, 'downloaded_filed1.pdf');

  final response = await http
      .get(Uri.parse('https://www.africau.edu/images/default/sample.pdf'));

  if (response.statusCode == 200) {
    final file = File(savePath);
    file.writeAsBytes(response.bodyBytes);
    // Prompt the user to choose the download location

    print('File downloaded to: $savePath');
  } else {
    print('Failed to download file. Status code: ${response.statusCode}');
  }
}

String getDownloadsDirectoryPath() {
  if (Platform.isWindows) {
    // On Windows, use environment variables
    final userProfile = Platform.environment['USERPROFILE'];
    if (userProfile != null) {
      return join(userProfile, 'Downloads');
    }
  }
  // Add logic for other platforms or fallback if needed
  throw UnsupportedError(
      'Unsupported platform or missing USERPROFILE environment variable.');
}

// class VcController extends GetxController {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     initializedPlayer();
//   }

//   Future<void> initializedPlayer() async {
//     _videoPlayerController = VideoPlayerController.asset(
//         'assets/videos/AnimePahe_Rurouni_Kenshin_-_Meiji_Kenkaku_Romantan_2023_-_04_360p_SubsPlease.mp4');

//     await Future.wait([_videoPlayerController.initialize()]);
//     _chewieController=
//   }
// }
