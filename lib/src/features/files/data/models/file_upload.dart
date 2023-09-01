class FileUploadModel {
  final String photoBytes;
  final String name;
  final String extention;
  final String primaryKey;
  final String pictureKey;
  final String userId;
  final int length;
  final int height;
  final int width;
  final String dateAjoutUtc;

  const FileUploadModel(
      {required this.photoBytes,
      required this.name,
      required this.extention,
      required this.primaryKey,
      required this.pictureKey,
      required this.userId,
      required this.length,
      required this.height,
      required this.width,
      required this.dateAjoutUtc});

  factory FileUploadModel.fromMap(Map<String, dynamic> map) {
    return FileUploadModel(
      photoBytes: map['photoBytes'],
      name: map['name'],
      extention: map['extention'],
      primaryKey: map['primaryKey'],
      pictureKey: map['pictureKey'],
      userId: map['userId'],
      length: map['length'],
      height: map['height'],
      width: map['width'],
      dateAjoutUtc: map['dateAjoutUtc'],
    );
  }
}
