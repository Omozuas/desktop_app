import 'dart:io';

import 'package:codegraniteflutter/Local_storage/get_directory.dart';
import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/NavTabMenue/projectcontroller.dart';
import 'package:codegraniteflutter/widgets/buttons/rowWithDownlodAndShareButton.dart';
import 'package:codegraniteflutter/widgets/containers/headerContainerTitel_widget.dart';
import 'package:codegraniteflutter/widgets/progressBar/progressBar1.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';

class DetailProject extends StatelessWidget {
  const DetailProject({super.key});

  @override
  Widget build(BuildContext context) {
    String ddFile =
        'https://media.istockphoto.com/id/1352603244/photo/shot-of-an-unrecognizable-businessman-working-on-his-laptop-in-the-office.jpg?s=612x612&w=0&k=20&c=upiDYeAZEsxbUBdhX35MXm79drIXA-5Q-FcfmZk71lM=';

    final controller = Get.put(ProjectController());
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      controller.selectedIndex.value = 0;
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Text("Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Project Detail',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon:
                                                Icon(Icons.more_vert_outlined))
                                      ],
                                    ),
                                    Divider(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 15,
                                          top: 15,
                                          bottom: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Project Title:',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  'Emergency Response App (Created on 01/02/2024)',
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Project ID:',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  'EX1492-001',
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text('Project Status:',
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Flexible(
                                                child: CustomProgressBar(
                                                  height: 8,
                                                  width: 157,
                                                  progress: 153,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text('(In progress)',
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Project Owner:',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  'Karl Mbemba',
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Project Manager:',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                'Moses Oliseh',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Project Start Date:',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                '04/02/2024',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Project End Date:',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                '12/04/2024',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Total cost of project :',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          '5000',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Initial Payment :',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          '3,500',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Final Payment :',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          '1,500',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    GlobalColors.backgroundgray,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(5),
                                                        bottom:
                                                            Radius.circular(5)),
                                              ),
                                              width: 371),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Project Description:',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Empower communities and individuals with the Emergency Response App, a groundbreaking solution designed to enhance and expedite emergency assistance. This app integrates real-time location tracking, instant communication features, and emergency service coordination to provide swift response during critical situations. With an intuitive interface and seamless collaboration tools, the Emergency Response App is your go-to resource for rapid and effective crisis management. Prioritize safety and responsiveness with this essential tool for emergency situations.',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: GlobalColors.dividerLine),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(5),
                                    bottom: Radius.circular(5)),
                              ),
                              width: 800),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Project Documents',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text("See All",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: GlobalColors.deepBlue,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: GlobalColors.dividerLine),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(5),
                                    bottom: Radius.circular(5)),
                              ),
                              width: 800),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Prototype Link:",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color:
                                                      GlobalColors.DarkBorder,
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
                                                      color: GlobalColors
                                                          .DarkBorder,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                        Icons.share_sharp)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text('share',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    icon: Icon(Icons
                                                        .file_download_rounded)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("download",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: GlobalColors
                                                          .dividerLine,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                              border:
                                  Border.all(color: GlobalColors.dividerLine),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(5),
                                  bottom: Radius.circular(5)),
                            ),
                            width: 800,
                          )
                        ],
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Project Milestones',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.add_circle_outline_sharp))
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: GlobalColors.dividerLine),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(5),
                                bottom: Radius.circular(5)),
                          ),
                          width: 372))
                ],
              ),
            ),
          )
        ],
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
