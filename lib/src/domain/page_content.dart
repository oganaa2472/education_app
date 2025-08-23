import 'package:education_app/core/res/media_res.dart';
import 'package:equatable/equatable.dart';

class PageContent extends Equatable{
  const PageContent({required this.image,required this.title,required this.decoration});
  final String image;
  final String title;
  final String decoration;
  

  const PageContent.first():this(image:MediaRes.casualReading,title: 'Brand new curriculum',
  decoration: 'This is the first online education platform designed by the '
  "world's top professors");
    const PageContent.second():this(image:MediaRes.casualReading,title: 'Brand new curriculum',
  decoration: 'This is the first online education platform designed by the '
  "world's top professors");
    const PageContent.third():this(image:MediaRes.casualReading,title: 'Brand new curriculum',
  decoration: 'This is the first online education platform designed by the '
  "world's top professors");
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}