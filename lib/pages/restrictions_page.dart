import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

const Color blueBackground = Color(0xFF2675CC); // Blue background
const Color blueCard = Color(0xFF7CACE0); // Blue card
const Color blueText = Color(0xFF2575CC); // Blue text
const Color whiteText = Color(0xFFFFFFFF); // White text
const Color whiteCard = Color(0xFFFFFFFF); // White card

class RestrictionsPage extends StatefulWidget {
  const RestrictionsPage({super.key});

  @override
  _RestrictionsPageState createState() => _RestrictionsPageState();
}

class _RestrictionsPageState extends State<RestrictionsPage> {
  bool enableRestrictions = true;
  bool fractionToSaving = true;
  bool allowOnlinePayment = true;
  bool blockCardUsage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueBackground,
      appBar: AppBar(
        backgroundColor: blueBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteText),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Restrictions',
          style: TextStyle(color: whiteText, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: whiteCard,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Enable Restrictions Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enable Restrictions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CupertinoSwitch(
                  value: enableRestrictions,
                  onChanged: (value) {
                    setState(() => enableRestrictions = value);
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            const Divider(height: 40),

            // Saving Limits Account
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saving limits account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextField(
                    enabled: enableRestrictions,
                    decoration: InputDecoration(
                      hintText: 'amount...',
                      suffixText: 'KD',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: blueBackground),
                      ),
                      filled: true,
                      fillColor: enableRestrictions
                          ? Colors.white
                          : Colors.grey.shade100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Daily Spending Limits
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Daily spending limits',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextField(
                    enabled: enableRestrictions,
                    decoration: InputDecoration(
                      hintText: 'amount...',
                      suffixText: 'KD',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: blueBackground),
                      ),
                      filled: true,
                      fillColor: enableRestrictions
                          ? Colors.white
                          : Colors.grey.shade100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Block Card Usage Toggle
            _buildToggle(
              'Block the card usage',
              blockCardUsage,
              enableRestrictions,
              (value) {
                setState(() => blockCardUsage = value);
              },
            ),
            const SizedBox(height: 24),

            // Fraction to Saving Toggle
            _buildToggle(
              'Fraction to saving',
              fractionToSaving,
              enableRestrictions,
              (value) {
                setState(() => fractionToSaving = value);
              },
            ),
            const SizedBox(height: 24),

            // Allow Online Payment Toggle
            _buildToggle(
              'Allow online payment',
              allowOnlinePayment,
              enableRestrictions,
              (value) {
                setState(() => allowOnlinePayment = value);
              },
            ),
            const Spacer(),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: enableRestrictions ? () => context.pop() : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: whiteText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildToggle(
      String title, bool value, bool enabled, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: enabled ? Colors.black : Colors.grey,
          ),
        ),
        CupertinoSwitch(
          value: value,
          onChanged: enabled ? onChanged : null,
          activeColor: Colors.green,
          trackColor: Colors.grey,
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RestrictionsPage(),
    theme: ThemeData(
      primaryColor: blueBackground,
      scaffoldBackgroundColor: blueBackground,
    ),
  ));
}
