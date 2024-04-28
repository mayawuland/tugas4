class DataSitus {
  String imageLink;
  String link;
  String name;
  String description;
  int countFavorite;
  bool isFavorite;

  DataSitus({
    required this.imageLink,
    required this.link,
    required this.name,
    required this.description,
    required this.countFavorite,
    required this.isFavorite,
  });
}

var listSitus = [
  DataSitus(
    imageLink:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-9lcYDIqsCvzJ6SjX6jtmlDT91M3Wdm2r_jqPWD8twg&s",
    link: "https://id.quora.com/",
    name: "Quora",
    description: "Quora adalah tempat untuk mendapatkan dan membagikan pengetahuan. Quora mengumpulkan pertanyaan-pertanyaan dan jawabannya pada topik-topik tertentu dan memperbolehkan pengguna untuk ikut berkolaborasi dengan memberikan suara atau mengusulkan perbaikan jawaban.",
    countFavorite: 2024,
    isFavorite: false,
  ),
  DataSitus(
    imageLink:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGwZCRH9pWGwHDjvS1dsb8fVHcnw3H0BNeHYlwtMix4A&s",
    link: "https://medium.com/",
    name: "Medium",
    description: "Medium adalah platform terbuka di mana pembaca menemukan pemikiran dinamis, dan di mana para ahli dan suara yang belum ditemukan dapat berbagi tulisan mereka tentang topik apa pun.",
    countFavorite: 2004,
    isFavorite: false,
  ),
  DataSitus(
    imageLink:
    "https://pbs.twimg.com/profile_images/1729909787029078016/dBjB3Fnr_400x400.jpg",
    link: "https://www.reddit.com/",
    name: "Reddit",
    description: "Reddit adalah jaringan komunitas tempat orang dapat menyelami minat dan hobi mereka.",
    countFavorite: 1998,
    isFavorite: false,
  ),
  DataSitus(
    imageLink:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcf4cIJO4TmrzxvcUvXd13E2mYb51jYmpvNWt-X2QkPQ&s",
    link: "https://www.ted.com/talks",
    name: "TED Talks",
    description: "TED Talks adalah video berpengaruh dari pembicara ahli di bidang pendidikan, bisnis, sains, teknologi, dan kreativitas, dengan subtitle dalam 100+ bahasa.",
    countFavorite: 1965,
    isFavorite: false,
  ),
  DataSitus(
    imageLink:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQacQ3Fm5-auawCN4ygk5sXx426jqxvq_QRQfwd-LlCo2MXImsDn3iw-U4TOxWL-IqPjmg&usqp=CAU",
    link: "https://stackexchange.com/",
    name: "Stack Exchange",
    description: "Stack Exchange adalah jaringan situs web tanya jawab tentang topik di berbagai bidang, setiap situs mencakup topik tertentu, di mana pertanyaan, jawaban, dan pengguna tunduk pada proses penghargaan reputasi.",
    countFavorite: 1948,
    isFavorite: false,
  ),
  DataSitus(
    imageLink:
    "https://play-lh.googleusercontent.com/TpK0AcjPn5-XDKgSZ5jAob1H7MsQuJILOMR4M4QYkTt5CBPgTJVr7mysrKM6Ia8SrX8=w240-h480-rw",
    link: "https://id.khanacademy.org/",
    name: "Khan Academy",
    description: "Belajar gratis tentang matematika, seni, pemrograman komputer, ekonomi, fisika, kimia, biologi, kedokteran, keuangan, sejarah, dan lainnya.",
    countFavorite: 1945,
    isFavorite: false,
  ),
  DataSitus(
    imageLink:
    "https://pict.sindonews.net/dyn/850/pena/news/2020/12/15/700/268496/cerita-wattpad-indonesia-turn-on-live-with-my-ketos-dan-paradise-garden-akan-dibuat-serialnya-zdt.jpg",
    link: "https://www.wattpad.com/",
    name: "Wattpad",
    description: "Wattpad adalah sebuah platform daring yang memungkinkan penggunanya untuk membaca dan menulis cerita.",
    countFavorite: 911,
    isFavorite: false,
  ),
  DataSitus(
    imageLink:
    "https://i.pinimg.com/736x/e0/1d/ae/e01daed3210ece29f7f1cb7a8b2df8ae.jpg",
    link: "https://www.bbc.com/news",
    name: "BBC News",
    description: "Kunjungi BBC News untuk berita terkini, berita terhangat, video, audio, dan berita utama.",
    countFavorite: 59,
    isFavorite: false,
  ),
  DataSitus(
    imageLink:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJFhNWqZgAGscvN-zCF9yKkwGXksJmxSUxL217dQaz5A&s",
    link: "https://www.gutenberg.org/",
    name: "Project Gutenberg",
    description: "Project Gutenberg adalah perpustakaan yang berisi lebih dari 70.000 eBook gratis. Pilih di antara epub dan eBook Kindle gratis, unduh atau baca secara online. Anda akan menemukan literatur terbaik dunia di sini, dengan fokus pada karya-karya lama yang hak cipta AS telah habis masa berlakunya. Ribuan relawan mendigitalkan dan rajin mengoreksi eBook, untuk Anda nikmati.",
    countFavorite: 25,
    isFavorite: false,
  ),
  DataSitus(
    imageLink:
    "https://www.shutterstock.com/image-vector/frame-photo-yellow-template-logo-260nw-2247355747.jpg",
    link: "https://nationalgeographic.grid.id/",
    name: "National Geographic",
    description: "National Geographic Indonesia mengulas sains, penjelajahan, sejarah alam Indonesia dan dunia, konservasi lingkungan serta keanekaragaman hayati.",
    countFavorite: 16,
    isFavorite: false,
  ),
];
