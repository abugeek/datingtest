import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'profile_image_widget_model.dart';
export 'profile_image_widget_model.dart';

class ProfileImageWidgetWidget extends StatefulWidget {
  const ProfileImageWidgetWidget({
    super.key,
    required this.height,
    required this.width,
    bool? isEdit,
    required this.imageLink,
    required this.blurHash,
  }) : this.isEdit = isEdit ?? false;

  final double? height;
  final double? width;
  final bool isEdit;
  final String? imageLink;
  final String? blurHash;

  @override
  State<ProfileImageWidgetWidget> createState() =>
      _ProfileImageWidgetWidgetState();
}

class _ProfileImageWidgetWidgetState extends State<ProfileImageWidgetWidget> {
  late ProfileImageWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileImageWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: valueOrDefault<double>(
        widget.width,
        300.0,
      ),
      height: valueOrDefault<double>(
        widget.height,
        300.0,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300.0),
            child: OctoImage(
              placeholderBuilder: (_) => SizedBox.expand(
                child: Image(
                  image: BlurHashImage(valueOrDefault<String>(
                    widget.blurHash,
                    'L6Pj0^jE.AyE_3t7t7R**0o#DgR4',
                  )),
                  fit: BoxFit.cover,
                ),
              ),
              image: CachedNetworkImageProvider(
                valueOrDefault<String>(
                  widget.imageLink,
                  'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_960_720.png',
                ),
              ),
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
              memCacheWidth: 600,
              memCacheHeight: 600,
            ),
          ),
          if (widget.isEdit)
            Align(
              alignment: AlignmentDirectional(1.0, 1.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.edit_outlined,
                  color: FlutterFlowTheme.of(context).white,
                  size: 24.0,
                ),
                onPressed: () async {
                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                    context: context,
                    storageFolderPath: 'profilePictures',
                    maxWidth: 1600.00,
                    maxHeight: 1600.00,
                    imageQuality: 90,
                    allowPhoto: true,
                    includeBlurHash: true,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    safeSetState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    var downloadUrls = <String>[];
                    try {
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();

                      downloadUrls = await uploadSupabaseStorageFiles(
                        bucketName: 'pictures',
                        selectedFiles: selectedMedia,
                      );
                    } finally {
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      safeSetState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                        _model.uploadedFileUrl = downloadUrls.first;
                      });
                    } else {
                      safeSetState(() {});
                      return;
                    }
                  }

                  if (_model.uploadedFileUrl != '') {
                    await currentUserReference!.update({
                      ...createUsersRecordData(
                        photoUrl: _model.uploadedFileUrl,
                      ),
                      ...mapToFirestore(
                        {
                          'pictures': FieldValue.arrayUnion([
                            getPhotoFirestoreData(
                              updatePhotoStruct(
                                PhotoStruct(
                                  imageLink: _model.uploadedFileUrl,
                                  hash: _model.uploadedLocalFile.blurHash,
                                ),
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        },
                      ),
                    });
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
