import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "TERMS & CONDITIONS"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: RichText(
          text: TextSpan(
            style: TextStyles.size14Promptlight.copyWith(height: 2),
            children: [
              const TextSpan(
                text: '''
Welcome to the official website of Ram Cinemas Wattala. By accessing or using this website, you agree to comply with and be bound by the following Terms and Conditions. Please read them carefully before making any purchases or using the services on this website.

1. General Use
1.1 This website is owned and operated by Ram Cinemas Wattala.
1.2 You agree to use the website only for lawful purposes and in a manner that does not infringe the rights of or restrict the use and enjoyment of this site by any third party.

2. Booking and Payments 
2.1 All ticket bookings are subject to availability. 
2.2 Payment for tickets must be completed at the time of booking. Tickets will only be confirmed upon successful payment.
2.3 Prices listed on the website are in [insert currency] and are subject to change without prior notice. 
2.4 Once a booking is confirmed, it cannot be canceled, modified, or refunded unless otherwise stated in our refund policy or required by law. 

3. Ticket Collection and Admission 
3.1 Tickets must be presented for entry to the cinema. Digital or printed tickets are acceptable unless otherwise specified. 
3.2 Ram Cinemas Wattala reserves the right to refuse admission in cases where:

The ticket is invalid or tampered with. The patron fails to adhere to the cinema's policies (e.g., age restrictions, prohibited items).

4. Movie Schedules and Screenings 
4.1 Movie schedules, durations, and details are subject to change without prior notice. 
4.2 Ram Cinemas Wattala is not responsible for cancellations or rescheduling of screenings due to unforeseen circumstances.

5. Liability 
5.1 Ram Cinemas Wattala is not liable for:

Any technical errors, interruptions, or downtime experienced on the website. 
Loss of data or unauthorized access due to third-party breaches. 
Personal injury, property damage, or other incidents occurring at the cinema premises unless caused by gross negligence.

6. Intellectual Property 
6.1 All content on this website, including logos, images, text, and designs, is the property of Ram Cinemas Wattala and is protected by applicable intellectual property laws.
6.2 Unauthorized reproduction, distribution, or modification of website content is strictly prohibited.

7. Amendments 
7.1 Ram Cinemas Wattala reserves the right to update or modify these Terms and Conditions at any time without prior notice. Continued use of the website constitutes acceptance of the revised terms.

8. Contact Us 
For any inquiries regarding these Terms and Conditions, please contact us at:
''',
              ),

              // Phone label
              TextSpan(text: '\nPhone: ', style: TextStyles.size14Promptlight),
              // Phone value
              TextSpan(
                text: '071 1200 220',
                style: TextStyles.size14Promptlightgold,
              ),

              // Email label
              TextSpan(text: '\nEmail: ', style: TextStyles.size14Promptlight),
              // Email value
              TextSpan(
                text: 'info.ramcinemas@gmail.com',
                style: TextStyles.size14Promptlightgold,
              ),

              const TextSpan(
                text: '''

Thank you for choosing Ram Cinemas Wattala for your movie experience.
''',
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }
}
