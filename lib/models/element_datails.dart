class ElementDetails {
  final String id;
  final String title;
  final double price;
  final int copies;
  final String author;
  final int pages;
  final String imagesource;
  final bool assettype;
  ElementDetails(
      {required this.author,
      required this.copies,
      required this.id,
      required this.price,
      required this.title,
      required this.imagesource,
      required this.pages,
      required this.assettype});
}
