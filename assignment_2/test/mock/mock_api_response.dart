import 'package:assignment_2/models/response_category.dart';

const mockApiCategoryListResponse =
{
  "method": "GET",
  "status": true,
  "results": [
    {
      "category": "Dessert",
      "url": "https://www.masakapahariini.com/resep-masakan/resep-dessert/",
      "key": "resep-dessert"
    },
    {
      "category": "Masakan Hari Raya",
      "url": "https://www.masakapahariini.com/resep-masakan/masakan-hari-raya/",
      "key": "masakan-hari-raya"
    },
    {
      "category": "Masakan Tradisional",
      "url": "https://www.masakapahariini.com/resep-masakan/masakan-tradisional/",
      "key": "masakan-tradisional"
    },
    {
      "category": "Menu Makan Malam",
      "url": "https://www.masakapahariini.com/resep-masakan/makan-malam/",
      "key": "makan-malam"
    },
    {
      "category": "Menu Makan Siang",
      "url": "https://www.masakapahariini.com/resep-masakan/makan-siang/",
      "key": "makan-siang"
    },
    {
      "category": "Resep Ayam",
      "url": "https://www.masakapahariini.com/resep-masakan/resep-ayam/",
      "key": "resep-ayam"
    },
    {
      "category": "Resep Daging",
      "url": "https://www.masakapahariini.com/resep-masakan/resep-daging/",
      "key": "resep-daging"
    },
    {
      "category": "Resep Sayuran",
      "url": "https://www.masakapahariini.com/resep-masakan/resep-sayuran/",
      "key": "resep-sayuran"
    },
    {
      "category": "Resep Seafood",
      "url": "https://www.masakapahariini.com/resep-masakan/resep-seafood/",
      "key": "resep-seafood"
    },
    {
      "category": "Sarapan",
      "url": "https://www.masakapahariini.com/resep-masakan/sarapan/",
      "key": "sarapan"
    }
  ]
};

const mockApiCategoryListResponseStr ="{\r\n    \"method\": \"GET\",\r\n    \"status\": true,\r\n    \"results\": [\r\n        {\r\n            \"category\": \"Dessert\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/resep-dessert/\",\r\n            \"key\": \"resep-dessert\"\r\n        },\r\n        {\r\n            \"category\": \"Masakan Hari Raya\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/masakan-hari-raya/\",\r\n            \"key\": \"masakan-hari-raya\"\r\n        },\r\n        {\r\n            \"category\": \"Masakan Tradisional\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/masakan-tradisional/\",\r\n            \"key\": \"masakan-tradisional\"\r\n        },\r\n        {\r\n            \"category\": \"Menu Makan Malam\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/makan-malam/\",\r\n            \"key\": \"makan-malam\"\r\n        },\r\n        {\r\n            \"category\": \"Menu Makan Siang\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/makan-siang/\",\r\n            \"key\": \"makan-siang\"\r\n        },\r\n        {\r\n            \"category\": \"Resep Ayam\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/resep-ayam/\",\r\n            \"key\": \"resep-ayam\"\r\n        },\r\n        {\r\n            \"category\": \"Resep Daging\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/resep-daging/\",\r\n            \"key\": \"resep-daging\"\r\n        },\r\n        {\r\n            \"category\": \"Resep Sayuran\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/resep-sayuran/\",\r\n            \"key\": \"resep-sayuran\"\r\n        },\r\n        {\r\n            \"category\": \"Resep Seafood\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/resep-seafood/\",\r\n            \"key\": \"resep-seafood\"\r\n        },\r\n        {\r\n            \"category\": \"Sarapan\",\r\n            \"url\": \"https://www.masakapahariini.com/resep-masakan/sarapan/\",\r\n            \"key\": \"sarapan\"\r\n        }\r\n    ]\r\n}";

final mockGetCategory = ResponseCategory(method: "GET", 
    status: true,
    results: [Category(category: "Dessert", url: "https://www.masakapahariini.com/resep-masakan/resep-dessert/", key: "resep-dessert"),
      Category(category: "Masakan Hari Raya",
          url: "https://www.masakapahariini.com/resep-masakan/masakan-hari-raya/",
          key: "masakan-hari-raya"),
      Category(category: "Masakan Tradisional",
          url: "https://www.masakapahariini.com/resep-masakan/masakan-tradisional/",
          key: "masakan-tradisional"),
      Category(category: "Menu Makan Malam",
          url: "https://www.masakapahariini.com/resep-masakan/makan-malam/",
          key: "makan-malam"),
      Category(category: "Menu Makan Siang",
          url: "https://www.masakapahariini.com/resep-masakan/makan-siang/",
          key: "makan-siang")]);