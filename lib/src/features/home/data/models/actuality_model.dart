class ActualityModel {
  final String? title;
  final String? description;
  final String? fileName;
  final bool? hasFile;
  final String? link;
  final String? linkName;
  final bool? hasLink;
  final String? datas;
  final String? mimeType;

  ActualityModel(
      {this.title,
      this.description,
      this.fileName,
      this.hasFile,
      this.datas,
      this.mimeType,
      this.link,
      this.hasLink,
      this.linkName});

  factory ActualityModel.fromMap(Map<String, dynamic> map) {
    return ActualityModel(
      title: map['Titre'],
      description: map['Description'],
      fileName: map['FileName'],
      hasFile: map['HasFile'],
      link: map['Link'],
      linkName: map['LinkName'],
      hasLink: map['HasLink'],
      datas: map['Datas'],
      mimeType: map['MimeType'],
    );
  }
}
