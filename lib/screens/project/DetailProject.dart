import 'dart:io';

import 'package:codegraniteflutter/Local_storage/get_directory.dart';
import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/project/change_staus_dialog.dart';
import 'package:codegraniteflutter/screens/project/create_new_milestone.dart';
import 'package:codegraniteflutter/screens/project/create_project_dialog.dart';
import 'package:codegraniteflutter/screens/project/delete_milestone.dart';
import 'package:codegraniteflutter/screens/project/delete_project_dialog.dart';
import 'package:codegraniteflutter/screens/project/edit_project_dialog.dart';
import 'package:codegraniteflutter/screens/project/edit_milestone.dart';
import 'package:codegraniteflutter/widgets/NavTabMenue/projectcontroller.dart';
import 'package:codegraniteflutter/widgets/buttons/rowWithDownlodAndShareButton.dart';
import 'package:codegraniteflutter/widgets/buttons/smallButton.dart';
import 'package:codegraniteflutter/widgets/imageContainee/circlerImageContainer_widget.dart';
import 'package:codegraniteflutter/widgets/popUp_widget/firstPopup.dart';
import 'package:codegraniteflutter/widgets/progressBar/progressBar1.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:popover/popover.dart';

class DetailProject extends StatelessWidget {
  const DetailProject({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey4 = GlobalKey<FormState>();
    TextEditingController bioController = TextEditingController();
    String ddFile =
        'https://media.istockphoto.com/id/1352603244/photo/shot-of-an-unrecognizable-businessman-working-on-his-laptop-in-the-office.jpg?s=612x612&w=0&k=20&c=upiDYeAZEsxbUBdhX35MXm79drIXA-5Q-FcfmZk71lM=';

    final controller = Get.put(ProjectController());
    List<dynamic> status = [
      'completed',
      'inprogress',
      'pending',
      'inprogress',
      'completed',
      'completed',
      'inprogress',
      'pending',
      'inprogress',
      'completed',
      'completed',
      'inprogress',
      'pending',
      'inprogress',
      'completed'
    ];
    List<dynamic> dummydata = [
      'Requirements gathering & Analysis',
      'Project Initiation and planning',
      'Technology stack selection',
      'Database design and setup',
      'User Interface (UI) design',
      'User authentication and autho...',
      'Document upload and indexing',
      'Search and retrieval functionality',
      'Security and compliance',
      'User testing and quality assurance',
      'Deployment',
      'User authentication and autho...',
      'Technology stack selection',
      'Database design and setup',
      'Search and retrieval functionality',
    ];
    Color color;

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
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text("Back",
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
                  const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: GlobalColors.dividerLine),
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(5),
                                    bottom: Radius.circular(5)),
                              ),
                              width: 800,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Project Detail',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Popupf(
                                          munelist: [
                                            PopupMenuItem(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (builder) =>
                                                          const EditProjectDialog());
                                                  print('Button tapped');
                                                },
                                                child: ListTile(
                                                  leading: Image.asset(
                                                      'assets/images/edit-2.png'),
                                                  title: const Text('Edit Project'),
                                                )),
                                            PopupMenuItem(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (builder) =>
                                                          const DeleteProjectDialog());
                                                },
                                                child: ListTile(
                                                  leading: Image.asset(
                                                      'assets/images/trash.png'),
                                                  title: const Text('Delete Project'),
                                                ))
                                          ],
                                          icon: Image.asset(
                                              'assets/images/more.png'),
                                        )
                                      ],
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 15,
                                          top: 15,
                                          bottom: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Row(
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Text('Project Status:',
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Flexible(
                                                child: CustomProgressBar(
                                                  height: 8,
                                                  width: 157,
                                                  progress: 153,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const Text('(In progress)',
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Row(
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Row(
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Row(
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Row(
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    GlobalColors.backgroundgray,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    const BorderRadius.vertical(
                                                        top: Radius.circular(5),
                                                        bottom:
                                                            Radius.circular(5)),
                                              ),
                                              width: 371,
                                              child: const Padding(
                                                padding:
                                                    EdgeInsets.all(15.0),
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
                                              )),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      'Project Description:',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Empower communities and individuals with the Emergency Response App, a groundbreaking solution designed to enhance and expedite emergency assistance. This app integrates real-time location tracking, instant communication features, and emergency service coordination to provide swift response during critical situations. With an intuitive interface and seamless collaboration tools, the Emergency Response App is your go-to resource for rapid and effective crisis management. Prioritize safety and responsiveness with this essential tool for emergency situations.',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: GlobalColors.dividerLine),
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(5),
                                    bottom: Radius.circular(5)),
                              ),
                              width: 800,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Project Documents',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
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
                                    const Divider(),
                                    const SizedBox(
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
                                    const Divider(),
                                    const SizedBox(
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
                                    const Divider(),
                                    const SizedBox(
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
                                    const Divider(),
                                    const SizedBox(
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
                                    const Divider(),
                                    const SizedBox(
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
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: GlobalColors.dividerLine),
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(5),
                                  bottom: Radius.circular(5)),
                            ),
                            width: 800,
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
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
                                            const SizedBox(width: 5),
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
                                        const Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {},
                                                    child: Image.asset(
                                                        'assets/images/share.png')),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Text('share',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {},
                                                    child: Image.asset(
                                                        'assets/images/document-download.png')),
                                                const SizedBox(
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
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Comments',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // Text(
                          //   'There are no comments yet for this project',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //       fontSize: 14, fontWeight: FontWeight.w400),
                          // ),
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: GlobalColors.dividerLine),
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(5),
                                    bottom: Radius.circular(5)),
                              ),
                              width: 800,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CirclerImageContainer(
                                              image:
                                                  'assets/images/person2.png',
                                              width: 35,
                                              circleZize: 44,
                                              height: 35,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'JohnDoe',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Text(
                                              '2 hours ago',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Everything is looking good',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Popupf(
                                      munelist: [
                                        PopupMenuItem(
                                            onTap: () {},
                                            child: ListTile(
                                              leading: Image.asset(
                                                  'assets/images/repeat.png'),
                                              title: const Text('Reply to comment'),
                                            )),
                                        PopupMenuItem(
                                            onTap: () {},
                                            child: ListTile(
                                              leading: Image.asset(
                                                  'assets/images/trash.png'),
                                              title: const Text('Delete Comment'),
                                            )),
                                      ],
                                      icon: Image.asset(
                                          'assets/images/more (1).png'),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: GlobalColors.dividerLine),
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(5),
                                    bottom: Radius.circular(5)),
                              ),
                              width: 800,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CirclerImageContainer(
                                              image:
                                                  'assets/images/person2.png',
                                              width: 35,
                                              circleZize: 44,
                                              height: 35,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'JohnDoe',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Text(
                                              '2 hours ago',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Everything is looking good',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Popupf(
                                      munelist: [
                                        PopupMenuItem(
                                            onTap: () {},
                                            child: ListTile(
                                              leading: Image.asset(
                                                  'assets/images/repeat.png'),
                                              title: const Text('Reply to comment'),
                                            )),
                                        PopupMenuItem(
                                            onTap: () {},
                                            child: ListTile(
                                              leading: Image.asset(
                                                  'assets/images/trash.png'),
                                              title: const Text('Delete Comment'),
                                            )),
                                      ],
                                      icon: Image.asset(
                                          'assets/images/more (1).png'),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: GlobalColors.dividerLine),
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(5),
                                    bottom: Radius.circular(5)),
                              ),
                              width: 800,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CirclerImageContainer(
                                              image:
                                                  'assets/images/person2.png',
                                              width: 35,
                                              circleZize: 44,
                                              height: 35,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'JohnDoe',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Text(
                                              '2 hours ago',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Everything is looking good',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Popupf(
                                      munelist: [
                                        PopupMenuItem(
                                            onTap: () {},
                                            child: ListTile(
                                              leading: Image.asset(
                                                  'assets/images/repeat.png'),
                                              title: const Text('Reply to comment'),
                                            )),
                                        PopupMenuItem(
                                            onTap: () {},
                                            child: ListTile(
                                              leading: Image.asset(
                                                  'assets/images/trash.png'),
                                              title: const Text('Delete Comment'),
                                            )),
                                      ],
                                      icon: Image.asset(
                                          'assets/images/more (1).png'),
                                    ),
                                  ],
                                ),
                              )),

                        const  SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CirclerImageContainer(
                                image: 'assets/images/person2.png',
                                width: 30,
                                circleZize: 44,
                                height: 30,
                              ),
                             const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: SizedBox(
                                  width: 560,
                                  child: TextFormField(
                                    maxLines: 5,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-z A-Z]+$')
                                              .hasMatch(value!)) {
                                        return "Enter Your Full Name";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: bioController,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 14),
                                        hintText: 'Leave comment...',
                                        hintMaxLines: 5,
                                        helperStyle:const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    GlobalColors.lightBorder),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: GlobalColors.DarkBorder),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        const  SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 129,
                                child: SmallButton(
                                  buttonHeight: 50,
                                  onPressed: () async {},
                                  buttonWidth: 12,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'comment',
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: TextStyle(
                                                color: GlobalColors.whiteText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                     const   SizedBox(
                                          width: 1,
                                        ),
                                        Image.asset('assets/images/send-2.png')
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                const  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: GlobalColors.dividerLine),
                      shape: BoxShape.rectangle,
                      borderRadius:const BorderRadius.vertical(
                          top: Radius.circular(5), bottom: Radius.circular(5)),
                    ),
                    width: 372,
                    child: Padding(
                      padding:const EdgeInsets.only(
                          left: 5, right: 5, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             const Text(
                                'Project Milestones',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Popupf(
                                munelist: [
                                  PopupMenuItem(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (builder) =>
                                                const CreateNewMilestone());
                                      },
                                      child:const ListTile(
                                        leading: Icon(Icons.add),
                                        title: Text('Add Milestone'),
                                      )),
                                ],
                                icon:
                                    Image.asset('assets/images/add-circle.png'),
                              )
                            ],
                          ),
                       const   Divider(),
                         const SizedBox(
                            height: 10,
                          ),
                          // Center(
                          //   child: Column(children: [
                          //     Padding(
                          //       padding:
                          //           EdgeInsets.only(top: 15, bottom: 15),
                          //       child: ImageConainerWithAddProjectButton4(
                          //           ontap: () {
                          //             // showDialog(
                          //             //     context: context,
                          //             //     builder: (builder) => ShowForm());
                          //           },
                          //           imageAsset:
                          //               "assets/images/eempty box.png",
                          //           buttonTitle: 'Create Milestones',
                          //           textTitle:
                          //               'No milestones have been created for this project yet, your milestones will appear here once they’ve been created.'),
                          //     )
                          //   ]),
                          // ),
                          SizedBox(
                            height: 550,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics:const AlwaysScrollableScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: dummydata.length,
                                itemBuilder: (BuildContext context, index) {
                                  if (status[index] == 'completed') {
                                    color = GlobalColors.successGreen;
                                  } else if (status[index] == 'inprogress') {
                                    color = Colors.yellow;
                                  } else if (status[index] == 'pending') {
                                    color = GlobalColors.DarkBorder;
                                  } else {
                                    // Default to green if progress exceeds 157%
                                    color = Colors.green;
                                  }
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(5),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 1),
                                                  color: GlobalColors.deepBlue,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              Text(
                                                '${dummydata[index]}',
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                style:const TextStyle(
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          Popupf(
                                            munelist: [
                                              PopupMenuItem(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (builder) =>
                                                            const EditMilestone());
                                                  },
                                                  child: ListTile(
                                                    leading: Image.asset(
                                                        'assets/images/edit-2.png'),
                                                    title:
                                                       const Text('Edit Milestone'),
                                                  )),
                                              PopupMenuItem(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (builder) =>
                                                         const   DeleteMilestone());
                                                  },
                                                  child: ListTile(
                                                    leading: Image.asset(
                                                        'assets/images/trash.png'),
                                                    title:const Text(
                                                        'Delete Milestone'),
                                                  )),
                                              PopupMenuItem(
                                                  onTap: () {
                                                    showDialog(context: context,builder: (builder) =>const ChangeStatusDialog() ,);
                                                  },
                                                  child: ListTile(
                                                    leading: Image.asset(
                                                        'assets/images/status.png'),
                                                    title:
                                                       const Text('Change status'),
                                                  )),
                                            ],
                                            icon: Image.asset(
                                                'assets/images/more.png'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Status',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                         const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '(${status[index]})',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: color,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ))
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
