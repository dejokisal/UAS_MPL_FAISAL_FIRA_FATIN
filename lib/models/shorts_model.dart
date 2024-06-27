class ShortsModel {
  String video_url,
      channel_name,
      channel_profile,
      likes,
      dislikes,
      comment_count,
      title;

  ShortsModel(this.video_url, this.channel_name, this.channel_profile,
      this.likes, this.dislikes, this.comment_count, this.title);
}

List<ShortsModel> shorts = shortsData
    .map((item) => ShortsModel(
        item['video_url']!,
        item['channel_name']!,
        item['channel_profile']!,
        item['likes']!,
        item['dislikes']!,
        item['comment_count']!,
        item['title']!))
    .toList();

var shortsData = [
  {
    "video_url": "assets/shorts/1.mp4",
    "channel_name": "John Cena",
    "channel_profile": "assets/profile_pics/1.jpg",
    "likes": "20K",
    "dislikes": "Dislike",
    "comment_count": "15",
    "title":
        "Cara Membuat Super Smooth Slow Motion Video di Adobe Premiere Pro"
  },
  {
    "video_url": "assets/shorts/2.mp4",
    "channel_name": "Meet Gada",
    "channel_profile": "assets/profile_pics/2.jpg",
    "likes": "1M",
    "dislikes": "Dislike",
    "comment_count": "100K",
    "title":
        "Pemandangan Indah Kota #shorts"
  },
  {
    "video_url": "assets/shorts/3.mp4",
    "channel_name": "Smit Shah",
    "channel_profile": "assets/profile_pics/3.jpg",
    "likes": "100",
    "dislikes": "Dislike",
    "comment_count": "12",
    "title": "Dewa King Cobra India  #shorts"
  },
  {
    "video_url": "assets/shorts/4.mp4",
    "channel_name": "Faisal",
    "channel_profile": "assets/profile_pics/4.jpg",
    "likes": "500k",
    "dislikes": "Dislike",
    "comment_count": "100k",
    "title": "Cuman Mau Pamer? #Bali #kute"
  },
  {
    "video_url": "assets/shorts/5.mp4",
    "channel_name": "fira",
    "channel_profile": "assets/profile_pics/5.jpg",
    "likes": "700k",
    "dislikes": "Dislike",
    "comment_count": "200k",
    "title": "Jembatan Merah Palembang #shorts #healing"
  },
  {
    "video_url": "assets/shorts/6.mp4",
    "channel_name": "Smit Shah",
    "channel_profile": "assets/profile_pics/6.jpg",
    "likes": "800k",
    "dislikes": "Dislike",
    "comment_count": "1M",
    "title": "Pantai Melasti #MelastiBeach"
  },
  {
    "video_url": "assets/shorts/7.mp4",
    "channel_name": "Smit Shah",
    "channel_profile": "assets/profile_pics/7.jpg",
    "likes": "10M",
    "dislikes": "Dislike",
    "comment_count": "5M",
    "title": "Lari Lari aja #shorts"
  }

];
