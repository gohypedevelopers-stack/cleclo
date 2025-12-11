import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;
  
  // Sample transaction data
  final List<Map<String, dynamic>> _transactions = [
    {
      'type': 'added',
      'title': 'Payment Added',
      'date': 'Oct 12, 10:45 AM',
      'amount': '+₹500.00',
      'isPositive': true,
    },
    {
      'type': 'used',
      'title': 'Service Booking',
      'date': 'Oct 11, 08:15 PM',
      'amount': '-₹250.00',
      'isPositive': false,
    },
    {
      'type': 'refund',
      'title': 'Refund Initiated',
      'date': 'Oct 10, 09:00 AM',
      'amount': '+₹150.00',
      'isPositive': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _getFilteredTransactions() {
    switch (_selectedTabIndex) {
      case 1: // Added
        return _transactions.where((t) => t['type'] == 'added').toList();
      case 2: // Used
        return _transactions.where((t) => t['type'] == 'used').toList();
      case 3: // Refunds
        return _transactions.where((t) => t['type'] == 'refund').toList();
      default: // All
        return _transactions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'My Wallet',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            
            // Balance Card
            _buildBalanceCard(),
            
            const SizedBox(height: 28),
            
            // Recent Transactions Section
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Transaction Tabs
            _buildTransactionTabs(),
            
            const SizedBox(height: 16),
            
            // Transaction List
            _buildTransactionList(),
            
            const SizedBox(height: 24),
            
            // Quick Actions
            _buildQuickAction(
              icon: Icons.history,
              title: 'Transaction History',
              onTap: () {},
            ),
            
            const SizedBox(height: 12),
            
            _buildQuickAction(
              icon: Icons.credit_card,
              title: 'Payment Methods',
              onTap: () {},
            ),
            
            const SizedBox(height: 12),
            
            _buildQuickAction(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Manage UPI / Cards',
              onTap: () {},
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F9F5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8F0E8), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Wallet Balance',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '₹5,250.75',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Available Balance',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'Add Money',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionTabs() {
    final tabs = ['All', 'Added', 'Used', 'Refunds'];
    
    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = _selectedTabIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTabIndex = index;
              _tabController.animateTo(index);
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: index < tabs.length - 1 ? 24 : 0),
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.grey.shade500,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTransactionList() {
    final filteredTransactions = _getFilteredTransactions();
    
    if (filteredTransactions.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Text(
            'No transactions found',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      );
    }
    
    return Column(
      children: filteredTransactions.map((transaction) {
        return _buildTransactionItem(transaction);
      }).toList(),
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    IconData iconData;
    Color iconBgColor;
    Color iconColor;
    
    switch (transaction['type']) {
      case 'added':
        iconData = Icons.add;
        iconBgColor = const Color(0xFFF0FDF4);
        iconColor = AppColors.primary;
        break;
      case 'used':
        iconData = Icons.remove;
        iconBgColor = const Color(0xFFFEF2F2);
        iconColor = Colors.red;
        break;
      case 'refund':
        iconData = Icons.refresh;
        iconBgColor = const Color(0xFFF0FDF4);
        iconColor = AppColors.primary;
        break;
      default:
        iconData = Icons.attach_money;
        iconBgColor = const Color(0xFFF5F5F5);
        iconColor = Colors.grey;
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction['title'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction['date'],
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            transaction['amount'],
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: transaction['isPositive'] ? AppColors.primary : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey.shade700,
              size: 22,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
