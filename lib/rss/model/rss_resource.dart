class RssResource{
  String id, name;
  String startDescriptionRegrex, endDescriptionRegrex;
  String startImageRegrex, endImageRegrex;
  Map<String, String> resourceHeaders;// Key: tên đầu mục báo,Value: url của đầu mục báo

  RssResource({
    required this.id,
    required this.name,
    required this.startDescriptionRegrex,
    required this.endDescriptionRegrex,
    required this.startImageRegrex,
    required this.endImageRegrex,
    required this.resourceHeaders,
  });
}

List<RssResource> rssResource = [
  RssResource(
      id: "vnexpress",
      name: "VN Express",
      startDescriptionRegrex: "</a></br>",
      endDescriptionRegrex: "",
      startImageRegrex: 'img src="',
      endImageRegrex: '"',
      resourceHeaders:{
        "Trang chủ":"https://vnexpress.net/rss/tin-moi-nhat.rss",
        "Thế giới":"https://vnexpress.net/rss/the-gioi.rss",
        "Thời sự":"https://vnexpress.net/rss/thoi-su.rss",
        "Sức khỏe":"https://vnexpress.net/rss/suc-khoe.rss",
        "Thể thao":"https://vnexpress.net/rss/the-thao.rss",
      }),//VN Express
  RssResource(
      id: "thanhnien",
      name: "Thanh niên",
      startDescriptionRegrex:"</a> ",
      endDescriptionRegrex:"",
      startImageRegrex:'img src="',
      endImageRegrex:'"',
      resourceHeaders:{
        "Trang chủ":"https://thanhnien.vn/rss/home.rss",
        "Thế giới":"https://thanhnien.vn/rss/the-gioi.rss",
        "Thời sự":"https://thanhnien.vn/rss/thoi-su.rss",
        "Sức khỏe":"https://thanhnien.vn/rss/suc-khoe.rss",
        "Thể thao":"https://thanhnien.vn/rss/the-thao.rss",
      }),//Thanh niên
  RssResource(
      id: "dantri",
      name: "Dân trí",
      startDescriptionRegrex:"</a></br>",
      endDescriptionRegrex:".",
      startImageRegrex:"img src='",
      endImageRegrex:"'",
      resourceHeaders:{
        "Trang chủ":"https://dantri.com.vn/rss/home.rss",
        "Thế giới":"https://dantri.com.vn/rss/the-gioi.rss",
        "Sự kiện":"https://dantri.com.vn/rss/su-kien.rss",
        "Sức khỏe":"https://dantri.com.vn/rss/suc-khoe.rss",
        "Thể thao":"https://dantri.com.vn/rss/the-thao.rss",
      }),//Dân trí
];