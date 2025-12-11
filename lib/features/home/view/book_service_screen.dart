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
        _selectedSubCategory = 'Boys';
        break;
      case 'Household':
        _selectedSubCategory = 'Bedding';
        break;
      case 'Institutions':
        _selectedSubCategory = 'Hotels';
        break;
      case 'Others':
        _selectedSubCategory = 'Footwear';
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
    {'name': 'Swimwear', 'image': 'assets/files/women/w- Swimwear.jpg'},
    {'name': 'Bottoms', 'image': 'assets/files/women/w-Bottoms.jpg'},
    {'name': 'Basics', 'image': 'assets/files/women/w-Basics.jpg'},
    {'name': 'Tops', 'image': 'assets/files/women/w-Tops.jpg'},
    {'name': 'Formal', 'image': 'assets/files/women/w-Formal.jpg'},
    {'name': 'Ethnic Wear', 'image': 'assets/files/women/w- Ethnic Wear.jpg'},
    {'name': 'Embellished', 'image': 'assets/files/women/w- Embellished.jpg'},
    {'name': 'Accessories', 'image': 'assets/files/women/w-Accessories.jpg'},
    {'name': 'Outerwear', 'image': 'assets/files/women/w-Outerwear.jpg'},
    {'name': 'Knitwear', 'image': 'assets/files/women/w-Knitwear.jpg'},
    {'name': 'Western', 'image': 'assets/files/women/w-Western.jpg'},
  ];

  // Men Categories - Add your images to assets/files/men folder
  final List<Map<String, String>> _menCategories = [
    {'name': 'Casual', 'image': 'assets/files/men/m-casual.jpg'},
    {'name': 'Formal', 'image': 'assets/files/men/m-formal.jpg'},
    {'name': 'Denim', 'image': 'assets/files/men/m-denim.jpg'},
    {'name': 'Sports', 'image': 'assets/files/men/m-sports.jpg'},
    {'name': 'Ethnic', 'image': 'assets/files/men/m-ethnic.jpg'},
    {'name': 'Accessories', 'image': 'assets/files/men/m-accessories.jpg'},
    {'name': 'Outerwear', 'image': 'assets/files/men/m-outerwear.jpg'},
    {'name': 'Knitwear', 'image': 'assets/files/men/m-knitwear.jpg'},
  ];

  // Kids Categories - Add your images to assets/files/kids folder
  final List<Map<String, String>> _kidsCategories = [
    {'name': 'Boys', 'image': 'assets/files/kids/k-boys.jpg'},
    {'name': 'Girls', 'image': 'assets/files/kids/k-girls.jpg'},
    {'name': 'Infants', 'image': 'assets/files/kids/k-infants.jpg'},
    {'name': 'School Uniform', 'image': 'assets/files/kids/k-school.jpg'},
    {'name': 'Party Wear', 'image': 'assets/files/kids/k-party.jpg'},
  ];

  // Household Categories - Add your images to assets/files/household folder
  final List<Map<String, String>> _householdCategories = [
    {'name': 'Bedding', 'image': 'assets/files/household/h-bedding.jpg'},
    {'name': 'Curtains', 'image': 'assets/files/household/h-curtains.jpg'},
    {'name': 'Towels', 'image': 'assets/files/household/h-towels.jpg'},
    {'name': 'Table Linen', 'image': 'assets/files/household/h-table.jpg'},
    {'name': 'Upholstery', 'image': 'assets/files/household/h-upholstery.jpg'},
    {'name': 'Rugs & Carpets', 'image': 'assets/files/household/h-rugs.jpg'},
  ];

  // Institutions Categories - Add your images to assets/files/institutions folder
  final List<Map<String, String>> _institutionsCategories = [
    {'name': 'Hotels', 'image': 'assets/files/institutions/i-hotels.jpg'},
    {'name': 'Hospitals', 'image': 'assets/files/institutions/i-hospitals.jpg'},
    {'name': 'Restaurants', 'image': 'assets/files/institutions/i-restaurants.jpg'},
    {'name': 'Schools', 'image': 'assets/files/institutions/i-schools.jpg'},
    {'name': 'Offices', 'image': 'assets/files/institutions/i-offices.jpg'},
  ];

  // Others Categories - Add your images to assets/files/others folder
  final List<Map<String, String>> _othersCategories = [
    {'name': 'Footwear', 'image': 'assets/files/others/o-footwear.jpg'},
    {'name': 'Bags', 'image': 'assets/files/others/o-bags.jpg'},
    {'name': 'Toys', 'image': 'assets/files/others/o-toys.jpg'},
    {'name': 'Pet Items', 'image': 'assets/files/others/o-pet.jpg'},
    {'name': 'Specialty', 'image': 'assets/files/others/o-specialty.jpg'},
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

  // Women Items for Casual category
  final List<Map<String, dynamic>> _womenCasualItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 6.00, 'quantity': 0},
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Dangree', 'image': 'assets/files/women/w-s-Dangree.jpg', 'price': 17.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Top', 'image': 'assets/files/women/w-s-Women Top.jpg', 'price': 10.00, 'quantity': 0},
  ];

  // Women Items for Denim category
  final List<Map<String, dynamic>> _womenDenimItems = [
    {'name': 'Jeans', 'image': 'assets/files/women/w-s-Jeans.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Dangree', 'image': 'assets/files/women/w-s-Dangree.jpg', 'price': 17.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
  ];

  // Women Items for Active category
  final List<Map<String, dynamic>> _womenActiveItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 6.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Leggings', 'image': 'assets/files/women/w-s-Women Leggings.jpg', 'price': 8.00, 'quantity': 0},
  ];

  // Women Items for Hosiery category
  final List<Map<String, dynamic>> _womenHosieryItems = [
    {'name': 'Stocking', 'image': 'assets/files/women/w-s-Stocking.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Women Leggings', 'image': 'assets/files/women/w-s-Women Leggings.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 6.00, 'quantity': 0},
  ];

  // Women Items for Bottoms category
  final List<Map<String, dynamic>> _womenBottomsItems = [
    {'name': 'Jeans', 'image': 'assets/files/women/w-s-Jeans.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 6.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt Long', 'image': 'assets/files/women/w-s-Skirt Long.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Leggings', 'image': 'assets/files/women/w-s-Women Leggings.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Petticoat', 'image': 'assets/files/women/w-s-Petticoat.jpg', 'price': 10.00, 'quantity': 0},
  ];

  // Women Items for Tops category
  final List<Map<String, dynamic>> _womenTopsItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Top', 'image': 'assets/files/women/w-s-Women Top.jpg', 'price': 10.00, 'quantity': 0},
    {'name': 'Kameez', 'image': 'assets/files/women/w-s-Kameez.jpg', 'price': 15.00, 'quantity': 0},
  ];

  // Women Items for Formal category
  final List<Map<String, dynamic>> _womenFormalItems = [
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Ladies Suit Western', 'image': 'assets/files/women/w-s-Ladies Suit Western.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Dress', 'image': 'assets/files/women/w-s-Dress.jpg', 'price': 18.00, 'quantity': 0},
  ];

  // Women Items for Swimwear category
  final List<Map<String, dynamic>> _womenSwimwearItems = [
    {'name': 'Bikini', 'image': 'assets/files/women/w-s-Bikini.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 12.00, 'quantity': 0},
  ];

  // Women Items for Basics category
  final List<Map<String, dynamic>> _womenBasicsItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Top', 'image': 'assets/files/women/w-s-Women Top.jpg', 'price': 10.00, 'quantity': 0},
    {'name': 'Petticoat', 'image': 'assets/files/women/w-s-Petticoat.jpg', 'price': 10.00, 'quantity': 0},
  ];

  // Women Items for Ethnic Wear category
  final List<Map<String, dynamic>> _womenEthnicWearItems = [
    {'name': 'Kameez', 'image': 'assets/files/women/w-s-Kameez.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Salwar', 'image': 'assets/files/women/w-s-Salwar.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Lehnga', 'image': 'assets/files/women/w-s-Lehnga.jpg', 'price': 35.00, 'quantity': 0},
    {'name': 'Dupatta', 'image': 'assets/files/women/w-s-Dupatta.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Gown', 'image': 'assets/files/women/w-s-Gown.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Dress Long', 'image': 'assets/files/women/w-s-Dress Long.jpg', 'price': 22.00, 'quantity': 0},
  ];

  // Women Items for Embellished category
  final List<Map<String, dynamic>> _womenEmbellishedItems = [
    {'name': 'Kameez Embellishment', 'image': 'assets/files/women/w-s-Kameez Embellishment.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Salwar Embellishment', 'image': 'assets/files/women/w-s-Salwar Embellishment.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Plazzo Embellishment', 'image': 'assets/files/women/w-s-Plazzo Embellishment.jpg', 'price': 22.00, 'quantity': 0},
    {'name': 'Lehnga', 'image': 'assets/files/women/w-s-Lehnga.jpg', 'price': 35.00, 'quantity': 0},
    {'name': 'Gown', 'image': 'assets/files/women/w-s-Gown.jpg', 'price': 30.00, 'quantity': 0},
  ];

  // Women Items for Accessories category
  final List<Map<String, dynamic>> _womenAccessoriesItems = [
    {'name': 'Scarf', 'image': 'assets/files/women/w-s-Scarf.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Dupatta', 'image': 'assets/files/women/w-s-Dupatta.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Handgloves', 'image': 'assets/files/women/w-s-Handgloves.png', 'price': 6.00, 'quantity': 0},
    {'name': 'Stocking', 'image': 'assets/files/women/w-s-Stocking.jpg', 'price': 8.00, 'quantity': 0},
  ];

  // Women Items for Outerwear category
  final List<Map<String, dynamic>> _womenOuterwearItems = [
    {'name': 'Cardigan', 'image': 'assets/files/women/w-s-Cardigan.jpg', 'price': 18.00, 'quantity': 0},
    {'name': 'Jumper', 'image': 'assets/files/women/w-s-Jumper.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Pullover', 'image': 'assets/files/women/w-s-Pullover.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 12.00, 'quantity': 0},
  ];

  // Women Items for Knitwear category
  final List<Map<String, dynamic>> _womenKnitwearItems = [
    {'name': 'Cardigan', 'image': 'assets/files/women/w-s-Cardigan.jpg', 'price': 18.00, 'quantity': 0},
    {'name': 'Pullover', 'image': 'assets/files/women/w-s-Pullover.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Jumper', 'image': 'assets/files/women/w-s-Jumper.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Scarf', 'image': 'assets/files/women/w-s-Scarf.jpg', 'price': 8.00, 'quantity': 0},
  ];

  // Women Items for Western category
  final List<Map<String, dynamic>> _womenWesternItems = [
    {'name': 'Jeans', 'image': 'assets/files/women/w-s-Jeans.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Ladies Suit Western', 'image': 'assets/files/women/w-s-Ladies Suit Western.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Dress', 'image': 'assets/files/women/w-s-Dress.jpg', 'price': 18.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
  ];

  // ============ MEN ITEMS ============
  // Men Items for Casual category
  final List<Map<String, dynamic>> _menCasualItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/men/m-s-tshirt.jpg', 'price': 5.00, 'quantity': 0},
    {'name': 'Polo Shirt', 'image': 'assets/files/men/m-s-polo.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Shorts', 'image': 'assets/files/men/m-s-shorts.jpg', 'price': 6.00, 'quantity': 0},
    {'name': 'Chinos', 'image': 'assets/files/men/m-s-chinos.jpg', 'price': 10.00, 'quantity': 0},
  ];

  // Men Items for Formal category
  final List<Map<String, dynamic>> _menFormalItems = [
    {'name': 'Shirt', 'image': 'assets/files/men/m-s-shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Trousers', 'image': 'assets/files/men/m-s-trousers.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Suit', 'image': 'assets/files/men/m-s-suit.jpg', 'price': 35.00, 'quantity': 0},
    {'name': 'Blazer', 'image': 'assets/files/men/m-s-blazer.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Tie', 'image': 'assets/files/men/m-s-tie.jpg', 'price': 5.00, 'quantity': 0},
  ];

  // Men Items for Denim category
  final List<Map<String, dynamic>> _menDenimItems = [
    {'name': 'Jeans', 'image': 'assets/files/men/m-s-jeans.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Denim Jacket', 'image': 'assets/files/men/m-s-denim-jacket.jpg', 'price': 18.00, 'quantity': 0},
    {'name': 'Denim Shirt', 'image': 'assets/files/men/m-s-denim-shirt.jpg', 'price': 15.00, 'quantity': 0},
  ];

  // Men Items for Sports category
  final List<Map<String, dynamic>> _menSportsItems = [
    {'name': 'Track Pants', 'image': 'assets/files/men/m-s-track.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Sports Jersey', 'image': 'assets/files/men/m-s-jersey.jpg', 'price': 10.00, 'quantity': 0},
    {'name': 'Gym Wear', 'image': 'assets/files/men/m-s-gym.jpg', 'price': 8.00, 'quantity': 0},
  ];

  // Men Items for Ethnic category
  final List<Map<String, dynamic>> _menEthnicItems = [
    {'name': 'Kurta', 'image': 'assets/files/men/m-s-kurta.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Sherwani', 'image': 'assets/files/men/m-s-sherwani.jpg', 'price': 40.00, 'quantity': 0},
    {'name': 'Pyjama', 'image': 'assets/files/men/m-s-pyjama.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Nehru Jacket', 'image': 'assets/files/men/m-s-nehru.jpg', 'price': 20.00, 'quantity': 0},
  ];

  // ============ KIDS ITEMS ============
  final List<Map<String, dynamic>> _kidsBoysItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/kids/k-s-tshirt.jpg', 'price': 4.00, 'quantity': 0},
    {'name': 'Shorts', 'image': 'assets/files/kids/k-s-shorts.jpg', 'price': 4.00, 'quantity': 0},
    {'name': 'Jeans', 'image': 'assets/files/kids/k-s-jeans.jpg', 'price': 8.00, 'quantity': 0},
  ];

  final List<Map<String, dynamic>> _kidsGirlsItems = [
    {'name': 'Dress', 'image': 'assets/files/kids/k-s-dress.jpg', 'price': 10.00, 'quantity': 0},
    {'name': 'Frock', 'image': 'assets/files/kids/k-s-frock.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/kids/k-s-skirt.jpg', 'price': 6.00, 'quantity': 0},
  ];

  final List<Map<String, dynamic>> _kidsInfantsItems = [
    {'name': 'Romper', 'image': 'assets/files/kids/k-s-romper.jpg', 'price': 5.00, 'quantity': 0},
    {'name': 'Baby Suit', 'image': 'assets/files/kids/k-s-babysuit.jpg', 'price': 6.00, 'quantity': 0},
  ];

  // ============ HOUSEHOLD ITEMS ============
  final List<Map<String, dynamic>> _householdBeddingItems = [
    {'name': 'Bedsheet', 'image': 'assets/files/household/h-s-bedsheet.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Pillow Cover', 'image': 'assets/files/household/h-s-pillow.jpg', 'price': 5.00, 'quantity': 0},
    {'name': 'Blanket', 'image': 'assets/files/household/h-s-blanket.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Comforter', 'image': 'assets/files/household/h-s-comforter.jpg', 'price': 30.00, 'quantity': 0},
  ];

  final List<Map<String, dynamic>> _householdCurtainsItems = [
    {'name': 'Curtain', 'image': 'assets/files/household/h-s-curtain.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Drapes', 'image': 'assets/files/household/h-s-drapes.jpg', 'price': 25.00, 'quantity': 0},
  ];

  final List<Map<String, dynamic>> _householdTowelsItems = [
    {'name': 'Bath Towel', 'image': 'assets/files/household/h-s-towel.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Hand Towel', 'image': 'assets/files/household/h-s-handtowel.jpg', 'price': 4.00, 'quantity': 0},
  ];

  // ============ INSTITUTIONS ITEMS ============
  final List<Map<String, dynamic>> _institutionsHotelsItems = [
    {'name': 'Hotel Bedsheet', 'image': 'assets/files/institutions/i-s-bedsheet.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Hotel Towel', 'image': 'assets/files/institutions/i-s-towel.jpg', 'price': 10.00, 'quantity': 0},
    {'name': 'Table Cloth', 'image': 'assets/files/institutions/i-s-tablecloth.jpg', 'price': 15.00, 'quantity': 0},
  ];

  final List<Map<String, dynamic>> _institutionsHospitalsItems = [
    {'name': 'Hospital Gown', 'image': 'assets/files/institutions/i-s-gown.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Lab Coat', 'image': 'assets/files/institutions/i-s-labcoat.jpg', 'price': 15.00, 'quantity': 0},
  ];

  // ============ OTHERS ITEMS ============
  final List<Map<String, dynamic>> _othersFootwearItems = [
    {'name': 'Shoes', 'image': 'assets/files/others/o-s-shoes.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Sneakers', 'image': 'assets/files/others/o-s-sneakers.jpg', 'price': 18.00, 'quantity': 0},
  ];

  final List<Map<String, dynamic>> _othersBagsItems = [
    {'name': 'Handbag', 'image': 'assets/files/others/o-s-handbag.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Backpack', 'image': 'assets/files/others/o-s-backpack.jpg', 'price': 15.00, 'quantity': 0},
  ];

  // Default items for categories without specific items
  final List<Map<String, dynamic>> _defaultItems = [
    {'name': 'Item 1', 'image': 'assets/images/washing.png', 'price': 10.00, 'quantity': 0},
    {'name': 'Item 2', 'image': 'assets/images/washing.png', 'price': 15.00, 'quantity': 0},
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
          case 'Swimwear': return _womenSwimwearItems;
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
          case 'Formal': return _menFormalItems;
          case 'Denim': return _menDenimItems;
          case 'Sports': return _menSportsItems;
          case 'Ethnic': return _menEthnicItems;
          default: return _menCasualItems;
        }
      case 'Kids':
        switch (_selectedSubCategory) {
          case 'Boys': return _kidsBoysItems;
          case 'Girls': return _kidsGirlsItems;
          case 'Infants': return _kidsInfantsItems;
          default: return _kidsBoysItems;
        }
      case 'Household':
        switch (_selectedSubCategory) {
          case 'Bedding': return _householdBeddingItems;
          case 'Curtains': return _householdCurtainsItems;
          case 'Towels': return _householdTowelsItems;
          default: return _householdBeddingItems;
        }
      case 'Institutions':
        switch (_selectedSubCategory) {
          case 'Hotels': return _institutionsHotelsItems;
          case 'Hospitals': return _institutionsHospitalsItems;
          default: return _institutionsHotelsItems;
        }
      case 'Others':
        switch (_selectedSubCategory) {
          case 'Footwear': return _othersFootwearItems;
          case 'Bags': return _othersBagsItems;
          default: return _othersFootwearItems;
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
                              _selectedSubCategory = 'Boys';
                              break;
                            case 'Household':
                              _selectedSubCategory = 'Bedding';
                              break;
                            case 'Institutions':
                              _selectedSubCategory = 'Hotels';
                              break;
                            case 'Others':
                              _selectedSubCategory = 'Footwear';
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
                      context.push(RouteConstants.yourCollectionScreen);
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
