import 'package:cleclo/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookServiceScreen extends StatefulWidget {
  final String initialCategory;
  
  const BookServiceScreen({super.key, this.initialCategory = 'Women'});

  @override
  State<BookServiceScreen> createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  late String _selectedMainCategory;
  late String _selectedSubCategory;

  @override
  void initState() {
    super.initState();
    _selectedMainCategory = widget.initialCategory;
    // Set default sub-category based on main category
    switch (widget.initialCategory) {
      case 'Women':
        _selectedSubCategory = 'Casual';
        break;
      case 'Men':
        _selectedSubCategory = 'Casual';
        break;
      case 'Kids':
        _selectedSubCategory = 'Casual';
        break;
      case 'Household':
        _selectedSubCategory = 'Bedding';
        break;
      case 'Institutions':
        _selectedSubCategory = 'Bedding';
        break;
      case 'Others':
        _selectedSubCategory = 'Outerwear';
        break;
      default:
        _selectedSubCategory = 'Casual';
    }
  }

  // Women Categories with images
  final List<Map<String, String>> _womenCategories = [
    {'name': 'Casual', 'image': 'assets/files/women/w-casual.png'},
    {'name': 'Denim', 'image': 'assets/files/women/w-denim.jpg'},
    {'name': 'Active', 'image': 'assets/files/women/w-active.jpg'},
    {'name': 'Hosiery', 'image': 'assets/files/women/w-Hosiery.jpg'},
    {'name': 'Swim', 'image': 'assets/files/women/w-swim.jpg'},
    {'name': 'Bottoms', 'image': 'assets/files/women/w-Bottoms.jpg'},
    {'name': 'Basics', 'image': 'assets/files/women/w-Basics.jpg'},
    {'name': 'Tops', 'image': 'assets/files/women/w-Tops.jpg'},
    {'name': 'Formal', 'image': 'assets/files/women/w-Formal.jpg'},
    {'name': 'Ethnic Wear', 'image': 'assets/files/women/w-ethnic.jpg'},
    {'name': 'Embellished', 'image': 'assets/files/women/w-embellished.jpg'},
    {'name': 'Accessories', 'image': 'assets/files/women/w-Accessories.jpg'},
    {'name': 'Outerwear', 'image': 'assets/files/women/w-Outerwear.jpg'},
    {'name': 'Knitwear', 'image': 'assets/files/women/w-Knitwear.jpg'},
    {'name': 'Western', 'image': 'assets/files/women/w-Western.jpg'},
  ];

  // Men Categories
  final List<Map<String, String>> _menCategories = [
    {'name': 'Casual', 'image': 'assets/files/men/m-casual.jpg'},
    {'name': 'Nightwear', 'image': 'assets/files/men/m-nightwear.jpg'},
    {'name': 'Active', 'image': 'assets/files/men/m-active.jpg'},
    {'name': 'Home', 'image': 'assets/files/men/m-home.jpg'},
    {'name': 'Innerwear', 'image': 'assets/files/men/m-innerwear.jpg'},
    {'name': 'Swim', 'image': 'assets/files/men/m-swim.jpg'},
    {'name': 'Formal', 'image': 'assets/files/men/m-formal.jpg'},
    {'name': 'Ethnic', 'image': 'assets/files/men/m-ethnic.jpg'},
    {'name': 'Knitwear', 'image': 'assets/files/men/m-knitwear.jpg'},
    {'name': 'Outerwear', 'image': 'assets/files/men/m-outerwear.jpg'},
    {'name': 'Accessories', 'image': 'assets/files/men/m-accessories.jpg'},
    {'name': 'Sports', 'image': 'assets/files/men/m-sports.jpg'},
  ];

  // Kids Categories
  final List<Map<String, String>> _kidsCategories = [
    {'name': 'Casual', 'image': 'assets/files/kids/k-casual.jpg'},
    {'name': 'Ethnic', 'image': 'assets/files/kids/k-ethnic.jpg'},
    {'name': 'Nightwear', 'image': 'assets/files/kids/k-nightwear.jpg'},
    {'name': 'Active', 'image': 'assets/files/kids/k-active.jpg'},
    {'name': 'Sports', 'image': 'assets/files/kids/k-sports.jpg'},
    {'name': 'Knitwear', 'image': 'assets/files/kids/k-knitwear.jpg'},
    {'name': 'Outerwear', 'image': 'assets/files/kids/k-outerwear.jpg'},
    {'name': 'Formal', 'image': 'assets/files/kids/k-formal.jpg'},
    {'name': 'Swim', 'image': 'assets/files/kids/k-swim.jpg'},
    {'name': 'Accessories', 'image': 'assets/files/kids/k-accessories.jpg'},
  ];

  // Household Categories
  final List<Map<String, String>> _householdCategories = [
    {'name': 'Bedding', 'image': 'assets/files/household/h-bedding.jpg'},
    {'name': 'Furnishing', 'image': 'assets/files/household/h-furnishing.jpg'},
    {'name': 'Towels', 'image': 'assets/files/household/h-towels.jpg'},
    {'name': 'Dining', 'image': 'assets/files/household/h-dining.jpg'},
    {'name': 'Accessories', 'image': 'assets/files/household/h-accessories.jpg'},
    {'name': 'Linens', 'image': 'assets/files/household/h-linens.jpg'},
    {'name': 'Floors', 'image': 'assets/files/household/h-floors.jpg'},
    {'name': 'Hosiery', 'image': 'assets/files/household/h-hosiery.jpg'},
    {'name': 'Window', 'image': 'assets/files/household/h-window.jpg'},
  ];

  // Institutional Categories
  final List<Map<String, String>> _institutionsCategories = [
    {'name': 'Bedding', 'image': 'assets/files/institutions/i-bedding.jpg'},
    {'name': 'Towels', 'image': 'assets/files/institutions/i-towels.jpg'},
    {'name': 'Furnishing', 'image': 'assets/files/institutions/i-furnishing.jpg'},
    {'name': 'Floors', 'image': 'assets/files/institutions/i-floors.jpg'},
    {'name': 'Dining', 'image': 'assets/files/institutions/i-dining.jpg'},
  ];

  // Others Categories
  final List<Map<String, String>> _othersCategories = [
    {'name': 'Outerwear', 'image': 'assets/files/others/o-outerwear.jpg'},
    {'name': 'Accessories', 'image': 'assets/files/others/o-accessories.jpg'},
    {'name': 'Auto', 'image': 'assets/files/others/o-auto.jpg'},
    {'name': 'Toys', 'image': 'assets/files/others/o-toys.jpg'},
  ];

  // Get current categories based on selected main category
  List<Map<String, String>> get _currentCategories {
    switch (_selectedMainCategory) {
      case 'Women':
        return _womenCategories;
      case 'Men':
        return _menCategories;
      case 'Kids':
        return _kidsCategories;
      case 'Household':
        return _householdCategories;
      case 'Institutions':
        return _institutionsCategories;
      case 'Others':
        return _othersCategories;
      default:
        return _womenCategories;
    }
  }

  // ============ WOMEN ITEMS - Per Client Specification ============
  // Women > Casual (T-Shirt, Shirt, Capri, Slacks, Skirt, Dangree, Jumpsuit, Skirt Long)
  final List<Map<String, dynamic>> _womenCasualItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 15.00, 'quantity': 0},
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 18.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Dangree', 'image': 'assets/files/women/w-s-Dangree.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 35.00, 'quantity': 0},
    {'name': 'Skirt Long', 'image': 'assets/files/women/w-s-skirtlong.jpg', 'price': 25.00, 'quantity': 0},
  ];

  // Women > Denim (Jeans)
  final List<Map<String, dynamic>> _womenDenimItems = [
    {'name': 'Jeans', 'image': 'assets/files/women/w-s-Jeans.jpg', 'price': 25.00, 'quantity': 0},
  ];

  // Women > Active (Trackpant)
  final List<Map<String, dynamic>> _womenActiveItems = [
    {'name': 'Trackpant', 'image': 'assets/files/women/w-s-trackpant.jpg', 'price': 25.00, 'quantity': 0},
  ];

  // Women > Hosiery (Stocking)
  final List<Map<String, dynamic>> _womenHosieryItems = [
    {'name': 'Stocking', 'image': 'assets/files/women/w-s-Stocking.jpg', 'price': 15.00, 'quantity': 0},
  ];

  // Women > Swim (Swimming Costume, Bikini)
  final List<Map<String, dynamic>> _womenSwimItems = [
    {'name': 'Swimming Costume', 'image': 'assets/files/women/w-s-swimcostume.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Bikini', 'image': 'assets/files/women/w-s-Bikini.jpg', 'price': 25.00, 'quantity': 0},
  ];

  // Women > Bottoms (Women Leggings)
  final List<Map<String, dynamic>> _womenBottomsItems = [
    {'name': 'Women Leggings', 'image': 'assets/files/women/w-s-leggings.jpg', 'price': 20.00, 'quantity': 0},
  ];

  // Women > Basics (Petticoat)
  final List<Map<String, dynamic>> _womenBasicsItems = [
    {'name': 'Petticoat', 'image': 'assets/files/women/w-s-Petticoat.jpg', 'price': 20.00, 'quantity': 0},
  ];

  // Women > Tops (Women Top)
  final List<Map<String, dynamic>> _womenTopsItems = [
    {'name': 'Women Top', 'image': 'assets/files/women/w-s-womentop.jpg', 'price': 20.00, 'quantity': 0},
  ];

  // Women > Formal (Dress, Gown, Dress Long)
  final List<Map<String, dynamic>> _womenFormalItems = [
    {'name': 'Dress', 'image': 'assets/files/women/w-s-Dress.jpg', 'price': 50.00, 'quantity': 0},
    {'name': 'Gown', 'image': 'assets/files/women/w-s-Gown.jpg', 'price': 100.00, 'quantity': 0},
    {'name': 'Dress Long', 'image': 'assets/files/women/w-s-dresslong.jpg', 'price': 70.00, 'quantity': 0},
  ];

  // Women > Ethnic Wear (Kameez, Salwar, Ladies Suit Ethnic, Lehnga, Choli, Saree, Blouse, Sharara, Plazzo)
  final List<Map<String, dynamic>> _womenEthnicWearItems = [
    {'name': 'Kameez', 'image': 'assets/files/women/w-s-Kameez.jpg', 'price': 40.00, 'quantity': 0},
    {'name': 'Salwar', 'image': 'assets/files/women/w-s-Salwar.jpg', 'price': 35.00, 'quantity': 0},
    {'name': 'Ladies Suit Ethnic', 'image': 'assets/files/women/w-s-ladiesetnicsuit.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Lehnga', 'image': 'assets/files/women/w-s-Lehnga.jpg', 'price': 150.00, 'quantity': 0},
    {'name': 'Choli', 'image': 'assets/files/women/w-s-choli.jpg', 'price': 50.00, 'quantity': 0},
    {'name': 'Saree', 'image': 'assets/files/women/w-s-saree.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Blouse', 'image': 'assets/files/women/w-s-blouse.jpg', 'price': 40.00, 'quantity': 0},
    {'name': 'Sharara', 'image': 'assets/files/women/w-s-sharara.jpg', 'price': 60.00, 'quantity': 0},
    {'name': 'Plazzo', 'image': 'assets/files/women/w-s-plazzo.jpg', 'price': 45.00, 'quantity': 0},
  ];

  // Women > Embellished (Kameez Embellishment, Salwar Embellishment, Plazzo Embellishment, Saree Embellishment, Dress Embellishment)
  final List<Map<String, dynamic>> _womenEmbellishedItems = [
    {'name': 'Kameez Embellishment', 'image': 'assets/files/women/w-s-kameezembellish.jpg', 'price': 60.00, 'quantity': 0},
    {'name': 'Salwar Embellishment', 'image': 'assets/files/women/w-s-salwarembellish.jpg', 'price': 50.00, 'quantity': 0},
    {'name': 'Plazzo Embellishment', 'image': 'assets/files/women/w-s-plazzoembellish.jpg', 'price': 55.00, 'quantity': 0},
    {'name': 'Saree Embellishment', 'image': 'assets/files/women/w-s-sareeembellish.jpg', 'price': 100.00, 'quantity': 0},
    {'name': 'Dress Embellishment', 'image': 'assets/files/women/w-s-dressembellish.jpg', 'price': 80.00, 'quantity': 0},
  ];

  // Women > Accessories (Dupatta, Scarf, Handgloves)
  final List<Map<String, dynamic>> _womenAccessoriesItems = [
    {'name': 'Dupatta', 'image': 'assets/files/women/w-s-Dupatta.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Scarf', 'image': 'assets/files/women/w-s-Scarf.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Handgloves', 'image': 'assets/files/women/w-s-Handgloves.png', 'price': 15.00, 'quantity': 0},
  ];

  // Women > Outerwear (Jacket, Jacket Half, Sports Jacket, Coat, Long Coat, Over Coat, Jacket Long)
  final List<Map<String, dynamic>> _womenOuterwearItems = [
    {'name': 'Jacket', 'image': 'assets/files/women/w-s-jacket.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Jacket Half', 'image': 'assets/files/women/w-s-jackethalf.jpg', 'price': 60.00, 'quantity': 0},
    {'name': 'Sports Jacket', 'image': 'assets/files/women/w-s-sportsjacket.jpg', 'price': 70.00, 'quantity': 0},
    {'name': 'Coat', 'image': 'assets/files/women/w-s-coat.jpg', 'price': 100.00, 'quantity': 0},
    {'name': 'Long Coat', 'image': 'assets/files/women/w-s-longcoat.jpg', 'price': 150.00, 'quantity': 0},
    {'name': 'Over Coat', 'image': 'assets/files/women/w-s-overcoat.jpg', 'price': 120.00, 'quantity': 0},
    {'name': 'Jacket Long', 'image': 'assets/files/women/w-s-jacketlong.jpg', 'price': 90.00, 'quantity': 0},
  ];

  // Women > Knitwear (Pullover, Cardigan, Jumper)
  final List<Map<String, dynamic>> _womenKnitwearItems = [
    {'name': 'Pullover', 'image': 'assets/files/women/w-s-Pullover.jpg', 'price': 45.00, 'quantity': 0},
    {'name': 'Cardigan', 'image': 'assets/files/women/w-s-Cardigan.jpg', 'price': 50.00, 'quantity': 0},
    {'name': 'Jumper', 'image': 'assets/files/women/w-s-Jumper.jpg', 'price': 55.00, 'quantity': 0},
  ];

  // Women > Western (Ladies Suit Western)
  final List<Map<String, dynamic>> _womenWesternItems = [
    {'name': 'Ladies Suit Western', 'image': 'assets/files/women/w-s-ladieswesternsuit.jpg', 'price': 120.00, 'quantity': 0},
  ];


  // ============ MEN ITEMS ============
  final List<Map<String, dynamic>> _menCasualItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/men/m-s-tshirt.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Jeans', 'image': 'assets/files/men/m-s-jeans.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Shorts', 'image': 'assets/files/men/m-s-shorts.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/men/m-s-capri.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Cargo Pants', 'image': 'assets/files/men/m-s-cargo.jpg', 'price': 35.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menNightwearItems = [
    {'name': 'Pyjama', 'image': 'assets/files/men/m-s-pyjama.jpg', 'price': 20.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menActiveItems = [
    {'name': 'Sweatpants', 'image': 'assets/files/men/m-s-sweatpants.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Trackpants', 'image': 'assets/files/men/m-s-trackpants.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Sweatshirt', 'image': 'assets/files/men/m-s-sweatshirt.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Track Suit', 'image': 'assets/files/men/m-s-tracksuit.jpg', 'price': 50.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menHomeItems = [
    {'name': 'Bathrobe', 'image': 'assets/files/men/m-s-bathrobe.jpg', 'price': 40.00, 'quantity': 0},
    {'name': 'Napkin', 'image': 'assets/files/men/m-s-napkin.jpg', 'price': 10.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menInnerwearItems = [
    {'name': 'Undershirt', 'image': 'assets/files/men/m-s-undershirt.jpg', 'price': 15.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menSwimItems = [
    {'name': 'Swimming Costume', 'image': 'assets/files/men/m-s-swimwear.jpg', 'price': 30.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menFormalItems = [
    {'name': 'Pants / Trouser', 'image': 'assets/files/men/m-s-trousers.jpg', 'price': 35.00, 'quantity': 0},
    {'name': 'Shirt', 'image': 'assets/files/men/m-s-shirt.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Blazer', 'image': 'assets/files/men/m-s-blazer.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Suit (2 Pc)', 'image': 'assets/files/men/m-s-suit2pc.jpg', 'price': 150.00, 'quantity': 0},
    {'name': 'Suit (3 Pc)', 'image': 'assets/files/men/m-s-suit3pc.jpg', 'price': 200.00, 'quantity': 0},
    {'name': 'Safari Suit', 'image': 'assets/files/men/m-s-safari.jpg', 'price': 120.00, 'quantity': 0},
    {'name': 'Waist Coat', 'image': 'assets/files/men/m-s-waistcoat.jpg', 'price': 60.00, 'quantity': 0},
    {'name': 'Achkan', 'image': 'assets/files/men/m-s-achkan.jpg', 'price': 150.00, 'quantity': 0},
    {'name': 'Sherwani', 'image': 'assets/files/men/m-s-sherwani.jpg', 'price': 200.00, 'quantity': 0},
    {'name': 'Pathani Suit', 'image': 'assets/files/men/m-s-pathani.jpg', 'price': 100.00, 'quantity': 0},
    {'name': 'Tuxedo', 'image': 'assets/files/men/m-s-tuxedo.jpg', 'price': 250.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menEthnicItems = [
    {'name': 'Kurta', 'image': 'assets/files/men/m-s-kurta.jpg', 'price': 40.00, 'quantity': 0},
    {'name': 'Dhoti Kurta', 'image': 'assets/files/men/m-s-dhotikurta.jpg', 'price': 60.00, 'quantity': 0},
    {'name': 'Kurta Pyjama', 'image': 'assets/files/men/m-s-kurtapyjama.jpg', 'price': 70.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menKnitwearItems = [
    {'name': 'Pullover', 'image': 'assets/files/men/m-s-pullover.jpg', 'price': 45.00, 'quantity': 0},
    {'name': 'Sweater', 'image': 'assets/files/men/m-s-sweater.jpg', 'price': 50.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menOuterwearItems = [
    {'name': 'Coat', 'image': 'assets/files/men/m-s-coat.jpg', 'price': 120.00, 'quantity': 0},
    {'name': 'Jacket Half', 'image': 'assets/files/men/m-s-jackethalf.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Jacket', 'image': 'assets/files/men/m-s-jacket.jpg', 'price': 100.00, 'quantity': 0},
    {'name': 'Overcoat', 'image': 'assets/files/men/m-s-overcoat.jpg', 'price': 150.00, 'quantity': 0},
    {'name': 'Long Coat', 'image': 'assets/files/men/m-s-longcoat.jpg', 'price': 180.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menAccessoriesItems = [
    {'name': 'Pocket Square', 'image': 'assets/files/men/m-s-pocketsquare.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Tie', 'image': 'assets/files/men/m-s-tie.jpg', 'price': 20.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _menSportsItems = [
    {'name': 'Sports Jacket', 'image': 'assets/files/men/m-s-sportsjacket.jpg', 'price': 80.00, 'quantity': 0},
  ];

  // ============ KIDS ITEMS ============
  final List<Map<String, dynamic>> _kidsCasualItems = [
    {'name': 'Shirt', 'image': 'assets/files/kids/k-s-shirt.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Jeans', 'image': 'assets/files/kids/k-s-jeans.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Pant', 'image': 'assets/files/kids/k-s-pant.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'T-Shirt', 'image': 'assets/files/kids/k-s-tshirt.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/kids/k-s-capri.jpg', 'price': 18.00, 'quantity': 0},
    {'name': 'Shorts', 'image': 'assets/files/kids/k-s-shorts.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Dangree', 'image': 'assets/files/kids/k-s-dangree.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/kids/k-s-skirt.jpg', 'price': 18.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _kidsEthnicItems = [
    {'name': 'Kurta', 'image': 'assets/files/kids/k-s-kurta.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Kurta Pyjama', 'image': 'assets/files/kids/k-s-kurtapyjama.jpg', 'price': 40.00, 'quantity': 0},
    {'name': 'Sherwani', 'image': 'assets/files/kids/k-s-sherwani.jpg', 'price': 100.00, 'quantity': 0},
    {'name': 'Girl Suit Ethnic', 'image': 'assets/files/kids/k-s-girlsuit.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Lehenga', 'image': 'assets/files/kids/k-s-lehenga.jpg', 'price': 90.00, 'quantity': 0},
    {'name': 'Choli', 'image': 'assets/files/kids/k-s-choli.jpg', 'price': 40.00, 'quantity': 0},
    {'name': 'Pathani Suit', 'image': 'assets/files/kids/k-s-pathani.jpg', 'price': 70.00, 'quantity': 0},
    {'name': 'Achkan', 'image': 'assets/files/kids/k-s-achkan.jpg', 'price': 100.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _kidsNightwearItems = [
    {'name': 'Pyjama', 'image': 'assets/files/kids/k-s-pyjama.jpg', 'price': 15.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _kidsActiveItems = [
    {'name': 'Track Pant', 'image': 'assets/files/kids/k-s-trackpant.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Sweatshirt', 'image': 'assets/files/kids/k-s-sweatshirt.jpg', 'price': 25.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _kidsSportsItems = [
    {'name': 'Sports Jacket', 'image': 'assets/files/kids/k-s-sportsjacket.jpg', 'price': 60.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _kidsKnitwearItems = [
    {'name': 'Pullover', 'image': 'assets/files/kids/k-s-pullover.jpg', 'price': 35.00, 'quantity': 0},
    {'name': 'Sweater Half', 'image': 'assets/files/kids/k-s-sweaterhalf.jpg', 'price': 40.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _kidsOuterwearItems = [
    {'name': 'Jacket', 'image': 'assets/files/kids/k-s-jacket.jpg', 'price': 60.00, 'quantity': 0},
    {'name': 'Coat', 'image': 'assets/files/kids/k-s-coat.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Long Coat', 'image': 'assets/files/kids/k-s-longcoat.jpg', 'price': 100.00, 'quantity': 0},
    {'name': 'Jacket Half', 'image': 'assets/files/kids/k-s-jackethalf.jpg', 'price': 50.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _kidsFormalItems = [
    {'name': 'Suit (2 Pc)', 'image': 'assets/files/kids/k-s-suit2pc.jpg', 'price': 100.00, 'quantity': 0},
    {'name': 'Suit (3 Pc)', 'image': 'assets/files/kids/k-s-suit3pc.jpg', 'price': 130.00, 'quantity': 0},
    {'name': 'Dress Long', 'image': 'assets/files/kids/k-s-dresslong.jpg', 'price': 50.00, 'quantity': 0},
    {'name': 'Dress', 'image': 'assets/files/kids/k-s-dress.jpg', 'price': 40.00, 'quantity': 0},
    {'name': 'Gown', 'image': 'assets/files/kids/k-s-gown.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Waist Coat', 'image': 'assets/files/kids/k-s-waistcoat.jpg', 'price': 45.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _kidsSwimItems = [
    {'name': 'Swimming Costume', 'image': 'assets/files/kids/k-s-swimwear.jpg', 'price': 25.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _kidsAccessoriesItems = [
    {'name': 'Tie', 'image': 'assets/files/kids/k-s-tie.jpg', 'price': 15.00, 'quantity': 0},
  ];

  // ============ HOUSEHOLD ITEMS ============
  final List<Map<String, dynamic>> _householdBeddingItems = [
    {'name': 'Bedsheet Single', 'image': 'assets/files/household/h-s-bedsheetsingle.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Bedsheet Double', 'image': 'assets/files/household/h-s-bedsheetdouble.jpg', 'price': 50.00, 'quantity': 0},
    {'name': 'Pillow Covers', 'image': 'assets/files/household/h-s-pillowcovers.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Blanket Single', 'image': 'assets/files/household/h-s-blanketsingle.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Blanket Double', 'image': 'assets/files/household/h-s-blanketdouble.jpg', 'price': 120.00, 'quantity': 0},
    {'name': 'Duvet', 'image': 'assets/files/household/h-s-duvet.jpg', 'price': 150.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _householdFurnishingItems = [
    {'name': 'Curtain', 'image': 'assets/files/household/h-s-curtain.jpg', 'price': 60.00, 'quantity': 0},
    {'name': 'Cushion Cover', 'image': 'assets/files/household/h-s-cushioncover.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Chair Cover', 'image': 'assets/files/household/h-s-chaircover.jpg', 'price': 50.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _householdTowelsItems = [
    {'name': 'Hand Towel', 'image': 'assets/files/household/h-s-handtowel.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Towel', 'image': 'assets/files/household/h-s-towel.jpg', 'price': 25.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _householdDiningItems = [
    {'name': 'Table Cloth', 'image': 'assets/files/household/h-s-tablecloth.jpg', 'price': 35.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _householdAccessoriesItems = [
    {'name': 'Fabric Bag', 'image': 'assets/files/household/h-s-fabricbag.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Gloves', 'image': 'assets/files/household/h-s-gloves.jpg', 'price': 15.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _householdLinensItems = [
    {'name': 'Handkerchief', 'image': 'assets/files/household/h-s-handkerchief.jpg', 'price': 5.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _householdFloorsItems = [
    {'name': 'Foot Mats', 'image': 'assets/files/household/h-s-footmats.jpg', 'price': 30.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _householdHosieryItems = [
    {'name': 'Socks', 'image': 'assets/files/household/h-s-socks.jpg', 'price': 10.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _householdWindowItems = [
    {'name': 'Sheer Curtain', 'image': 'assets/files/household/h-s-sheercurtain.jpg', 'price': 40.00, 'quantity': 0},
  ];

  // ============ INSTITUTIONAL ITEMS ============
  final List<Map<String, dynamic>> _institutionsBeddingItems = [
    {'name': 'Bedsheet Single', 'image': 'assets/files/institutions/i-s-bedsheetsingle.jpg', 'price': 40.00, 'quantity': 0},
    {'name': 'Bedsheet Double', 'image': 'assets/files/institutions/i-s-bedsheetdouble.jpg', 'price': 60.00, 'quantity': 0},
    {'name': 'Bedspread Single', 'image': 'assets/files/institutions/i-s-bedspreadsingle.jpg', 'price': 50.00, 'quantity': 0},
    {'name': 'Bedspread Double', 'image': 'assets/files/institutions/i-s-bedspreaddouble.jpg', 'price': 70.00, 'quantity': 0},
    {'name': 'Blanket Single', 'image': 'assets/files/institutions/i-s-blanketsingle.jpg', 'price': 100.00, 'quantity': 0},
    {'name': 'Blanket Double', 'image': 'assets/files/institutions/i-s-blanketdouble.jpg', 'price': 140.00, 'quantity': 0},
    {'name': 'Quilt Single', 'image': 'assets/files/institutions/i-s-quiltsingle.jpg', 'price': 120.00, 'quantity': 0},
    {'name': 'Quilt Double', 'image': 'assets/files/institutions/i-s-quiltdouble.jpg', 'price': 160.00, 'quantity': 0},
    {'name': 'Duvet', 'image': 'assets/files/institutions/i-s-duvet.jpg', 'price': 180.00, 'quantity': 0},
    {'name': 'Pillow Covers', 'image': 'assets/files/institutions/i-s-pillowcovers.jpg', 'price': 20.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _institutionsTowelsItems = [
    {'name': 'Towel', 'image': 'assets/files/institutions/i-s-towel.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Hand Towels', 'image': 'assets/files/institutions/i-s-handtowels.jpg', 'price': 15.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _institutionsFurnishingItems = [
    {'name': 'Chair Cover', 'image': 'assets/files/institutions/i-s-chaircover.jpg', 'price': 60.00, 'quantity': 0},
    {'name': 'Curtain', 'image': 'assets/files/institutions/i-s-curtain.jpg', 'price': 80.00, 'quantity': 0},
    {'name': 'Cushion Cover', 'image': 'assets/files/institutions/i-s-cushioncover.jpg', 'price': 40.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _institutionsFloorsItems = [
    {'name': 'Foot Mats', 'image': 'assets/files/institutions/i-s-footmats.jpg', 'price': 50.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _institutionsDiningItems = [
    {'name': 'Table Cloth', 'image': 'assets/files/institutions/i-s-tablecloth.jpg', 'price': 45.00, 'quantity': 0},
  ];

  // ============ OTHERS ITEMS ============
  final List<Map<String, dynamic>> _othersOuterwearItems = [
    {'name': 'Rain Coat', 'image': 'assets/files/others/o-s-raincoat.jpg', 'price': 60.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _othersAccessoriesItems = [
    {'name': 'Hat', 'image': 'assets/files/others/o-s-hat.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Belt', 'image': 'assets/files/others/o-s-belt.jpg', 'price': 25.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _othersAutoItems = [
    {'name': 'Car Seatcover', 'image': 'assets/files/others/o-s-carseatcover.jpg', 'price': 100.00, 'quantity': 0},
  ];
  final List<Map<String, dynamic>> _othersToysItems = [
    {'name': 'Stuff Toy', 'image': 'assets/files/others/o-s-stufftoy.jpg', 'price': 40.00, 'quantity': 0},
  ];

  // Default items
  final List<Map<String, dynamic>> _defaultItems = [
    {'name': 'Item', 'image': 'assets/images/washing.png', 'price': 10.00, 'quantity': 0},
  ];

  List<Map<String, dynamic>> get _currentItems {
    switch (_selectedMainCategory) {
      case 'Women':
        switch (_selectedSubCategory) {
          case 'Casual': return _womenCasualItems;
          case 'Denim': return _womenDenimItems;
          case 'Active': return _womenActiveItems;
          case 'Hosiery': return _womenHosieryItems;
          case 'Bottoms': return _womenBottomsItems;
          case 'Tops': return _womenTopsItems;
          case 'Formal': return _womenFormalItems;
          case 'Swim': return _womenSwimItems;
          case 'Basics': return _womenBasicsItems;
          case 'Ethnic Wear': return _womenEthnicWearItems;
          case 'Embellished': return _womenEmbellishedItems;
          case 'Accessories': return _womenAccessoriesItems;
          case 'Outerwear': return _womenOuterwearItems;
          case 'Knitwear': return _womenKnitwearItems;
          case 'Western': return _womenWesternItems;
          default: return _womenCasualItems;
        }
      case 'Men':
        switch (_selectedSubCategory) {
          case 'Casual': return _menCasualItems;
          case 'Nightwear': return _menNightwearItems;
          case 'Active': return _menActiveItems;
          case 'Home': return _menHomeItems;
          case 'Innerwear': return _menInnerwearItems;
          case 'Swim': return _menSwimItems;
          case 'Formal': return _menFormalItems;
          case 'Ethnic': return _menEthnicItems;
          case 'Knitwear': return _menKnitwearItems;
          case 'Outerwear': return _menOuterwearItems;
          case 'Accessories': return _menAccessoriesItems;
          case 'Sports': return _menSportsItems;
          default: return _menCasualItems;
        }
      case 'Kids':
        switch (_selectedSubCategory) {
          case 'Casual': return _kidsCasualItems;
          case 'Ethnic': return _kidsEthnicItems;
          case 'Nightwear': return _kidsNightwearItems;
          case 'Active': return _kidsActiveItems;
          case 'Sports': return _kidsSportsItems;
          case 'Knitwear': return _kidsKnitwearItems;
          case 'Outerwear': return _kidsOuterwearItems;
          case 'Formal': return _kidsFormalItems;
          case 'Swim': return _kidsSwimItems;
          case 'Accessories': return _kidsAccessoriesItems;
          default: return _kidsCasualItems;
        }
      case 'Household':
        switch (_selectedSubCategory) {
          case 'Bedding': return _householdBeddingItems;
          case 'Furnishing': return _householdFurnishingItems;
          case 'Towels': return _householdTowelsItems;
          case 'Dining': return _householdDiningItems;
          case 'Accessories': return _householdAccessoriesItems;
          case 'Linens': return _householdLinensItems;
          case 'Floors': return _householdFloorsItems;
          case 'Hosiery': return _householdHosieryItems;
          case 'Window': return _householdWindowItems;
          default: return _householdBeddingItems;
        }
      case 'Institutions':
        switch (_selectedSubCategory) {
          case 'Bedding': return _institutionsBeddingItems;
          case 'Towels': return _institutionsTowelsItems;
          case 'Furnishing': return _institutionsFurnishingItems;
          case 'Floors': return _institutionsFloorsItems;
          case 'Dining': return _institutionsDiningItems;
          default: return _institutionsBeddingItems;
        }
      case 'Others':
        switch (_selectedSubCategory) {
          case 'Outerwear': return _othersOuterwearItems;
          case 'Accessories': return _othersAccessoriesItems;
          case 'Auto': return _othersAutoItems;
          case 'Toys': return _othersToysItems;
          default: return _othersOuterwearItems;
        }
      default:
        return _defaultItems;
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedCount = _currentItems.fold(0, (sum, item) => sum + (item['quantity'] as int));
    double totalAmount = _currentItems.fold(0, (sum, item) => sum + (item['quantity'] as int) * (item['price'] as double));

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54, size: 20),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Book Now',
          style: TextStyle(
            color: Color(0xFF1B5E20),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Color(0xFFBDBDBD)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Search for laundry services',
                      style: TextStyle(color: Color(0xFFBDBDBD)),
                    ),
                  ),
                  Icon(Icons.mic, color: Color(0xFFBDBDBD)),
                ],
              ),
            ),
          ),

          // Main Categories (Men, Women, Kids, Household, Institutions, Others)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['Men', 'Women', 'Kids', 'Household', 'Institutions', 'Others'].map((category) {
                  final isSelected = _selectedMainCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMainCategory = category;
                          // Reset sub-category to first item of new main category
                          switch (category) {
                            case 'Women':
                              _selectedSubCategory = 'Casual';
                              break;
                            case 'Men':
                              _selectedSubCategory = 'Casual';
                              break;
                            case 'Kids':
                              _selectedSubCategory = 'Casual';
                              break;
                            case 'Household':
                              _selectedSubCategory = 'Bedding';
                              break;
                            case 'Institutions':
                              _selectedSubCategory = 'Bedding';
                              break;
                            case 'Others':
                              _selectedSubCategory = 'Outerwear';
                              break;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: isSelected 
                            ? Border.all(color: const Color(0xFF43A047), width: 1.5)
                            : null,
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? const Color(0xFF43A047) : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Sub-Categories (Horizontal scroll with images) - All categories
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _currentCategories.length,
              itemBuilder: (context, index) {
                final category = _currentCategories[index];
                final isSelected = _selectedSubCategory == category['name'];
                return GestureDetector(
                  onTap: () => setState(() => _selectedSubCategory = category['name']!),
                  child: Container(
                    width: 95,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected 
                            ? const Color(0xFF43A047) 
                            : const Color(0xFFE8E8E8),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Image container inside the bordered card
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                category['image']!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.image, color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Label inside the bordered card
                        Text(
                          category['name']!,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Items List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: _currentItems.length,
              itemBuilder: (context, index) {
                final item = _currentItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Item Image
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item['image'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.image, color: Colors.grey, size: 24),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      // Item Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1B5E20),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '₹${item['price'].toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF43A047),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Quantity Counter
                      Row(
                        children: [
                          _buildCounterButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (item['quantity'] > 0) {
                                setState(() => item['quantity']--);
                              }
                            },
                          ),
                          SizedBox(
                            width: 32,
                            child: Text(
                              '${item['quantity']}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          _buildCounterButton(
                            icon: Icons.add,
                            isAdd: true,
                            onTap: () {
                              setState(() => item['quantity']++);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bottom Bar
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Items: $selectedCount',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Total: ₹${totalAmount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B5E20),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Get only items with quantity > 0
                      final selectedItemsList = _currentItems
                          .where((item) => (item['quantity'] as int) > 0)
                          .toList();
                      context.push(
                        RouteConstants.yourCollectionScreen,
                        extra: selectedItemsList,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF43A047),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Select Items',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton({required IconData icon, required VoidCallback onTap, bool isAdd = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isAdd ? const Color(0xFF43A047) : const Color(0xFFF5F5F5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: isAdd ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
