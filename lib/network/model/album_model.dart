import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()
 class AlbumModel{
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  AlbumModel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}