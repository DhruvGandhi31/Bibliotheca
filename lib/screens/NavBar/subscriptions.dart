import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int _selectedPlanIndex = 0;
  bool _isAutoRenewEnabled = true;
  TextEditingController? _promoCodeController;

  List<SubscriptionPlan> _subscriptionPlans = [
    SubscriptionPlan(
      name: 'Basic',
      price: '9.99',
      description: 'Get access to 10 books per month',
      features: [
        '10 Books per month',
        'Unlimited access to articles',
        'Access to discussion forums',
      ],
    ),
    SubscriptionPlan(
      name: 'Standard',
      price: '14.99',
      description: 'Get access to 20 books per month',
      features: [
        '20 Books per month',
        'Unlimited access to articles',
        'Access to discussion forums',
        'Offline reading support',
      ],
    ),
    SubscriptionPlan(
      name: 'Premium',
      price: '24.99',
      description: 'Get access to 50 books per month',
      features: [
        '50 Books per month',
        'Unlimited access to articles',
        'Access to discussion forums',
        'Offline reading support',
        'Priority customer support',
      ],
    ),
  ];

  @override
  void initState() {
    _promoCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    final _promoCodeController = this._promoCodeController;
    if (_promoCodeController != null) {
      _promoCodeController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAAD9FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF303F9F),
        title: Text('Subscription'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a plan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _subscriptionPlans.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SubscriptionPlanTile(
                    subscriptionPlan: _subscriptionPlans[index],
                    isSelected: index == _selectedPlanIndex,
                    onTap: () {
                      setState(() {
                        _selectedPlanIndex = index;
                      });
                    },
                  ),
                );
              },
            ),

            SizedBox(height: 32.0),
            Text(
              'Payment method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            PaymentMethodTile(
              paymentMethod: PaymentMethod(
                name: 'Credit Card',
                icon: Icons.credit_card,
              ),
              isSelected: true,
            ),
            // SizedBox(height: 16.0),
            SizedBox(height: 32.0),
            Text(
              'Auto-renew',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enable auto-renew',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Switch(
                  value: _isAutoRenewEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isAutoRenewEnabled = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Text(
              'Promo code',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _promoCodeController,
              decoration: InputDecoration(
                hintText: 'Enter promo code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement subscription logic
                },
                child: Text('Subscribe'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionPlan {
  final String name;
  final String price;
  final String description;
  final List<String> features;

  SubscriptionPlan({
    required this.name,
    required this.price,
    required this.description,
    required this.features,
  });
}

class SubscriptionPlanTile extends StatelessWidget {
  final SubscriptionPlan subscriptionPlan;
  final bool isSelected;
  final VoidCallback onTap;

  SubscriptionPlanTile({
    required this.subscriptionPlan,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: onTap,
      title: Text(
        subscriptionPlan.name,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.0),
          Text(
            '${subscriptionPlan.price}/month',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black),
          ),
          SizedBox(height: 8.0),
          Text(
            subscriptionPlan.description,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
          SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String feature in subscriptionPlan.features)
                Text(
                  '- $feature',
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                ),
            ],
          ),
        ],
      ),
      trailing: isSelected
          ? Icon(Icons.check, color: Colors.blue)
          : Icon(Icons.check, color: Colors.transparent),
    );
  }
}

class PaymentMethod {
  final String name;
  final IconData icon;

  PaymentMethod({
    required this.name,
    required this.icon,
  });
}

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool isSelected;

  PaymentMethodTile({
    required this.paymentMethod,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: () {},
      leading: Icon(paymentMethod.icon),
      title: Text(
        paymentMethod.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check, color: Colors.blue)
          : Icon(Icons.check, color: Colors.transparent),
    );
  }
}
