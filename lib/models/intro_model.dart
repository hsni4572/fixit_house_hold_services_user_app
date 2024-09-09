class SliderModel {
  String? image;
  String? title;
  String? description;

// Constructor for variables
  SliderModel({this.title, this.description, this.image});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImage() {
    return image!;
  }

  String getTitle() {
    return title!;
  }

  String getDescription() {
    return description!;
  }
}

// List created
List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

// Item 1
  sliderModel.setImage("assets/images/on 1.png");
  sliderModel.setTitle("All Services");
  sliderModel.setDescription(
      "lorem Ipsum Dotor sit amet is a dummy text\nused worldwide.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

// Item 2
  sliderModel.setImage("assets/images/on 2.png");
  sliderModel.setTitle("Fast Shipping");
  sliderModel.setDescription(
      "lorem Ipsum Dotor sit amet is a dummy text\nused worldwide.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

// Item 3
  sliderModel.setImage("assets/images/on 3.png");
  sliderModel.setTitle("Certificate Services");
  sliderModel.setDescription(
      "lorem Ipsum Dotor sit amet is a dummy text\nused worldwide.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  // Item 4
  sliderModel.setImage("assets/images/on 4.png");
  sliderModel.setTitle("Payment Online");
  sliderModel.setDescription(
      "lorem Ipsum Dotor sit amet is a dummy text\nused worldwide.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}
