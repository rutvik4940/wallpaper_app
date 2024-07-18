class AnimalModel
{
  int? total,totalHits;
  List<HintModel>?l1=[];

  AnimalModel({
    this.total, this.totalHits, this.l1});
  factory AnimalModel.mapToModel(Map m1)
  {
    List l2=m1['hits'];
    List<HintModel> l3=l2.map((e) => HintModel.mapToModel(e)).toList();
    return
      AnimalModel(total: m1['total'],totalHits:m1['totalHits'] ,l1:l3);
  }

}
class HintModel
{
  String?pageURL,previewURL,webformatURL,largeImageURL,userImageURL;

  HintModel(
      {this.pageURL,
        this.previewURL,
        this.webformatURL,
        this.largeImageURL,
        this.userImageURL});
  factory HintModel.mapToModel(Map m1)
  {
    return HintModel(pageURL: m1['userImageURL'],previewURL:m1['previewURL'] ,webformatURL:m1['webformatURL'] ,largeImageURL:m1['largeImageURL'] ,userImageURL:m1['userImageURL'] );
  }
}