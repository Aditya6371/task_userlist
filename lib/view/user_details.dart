import 'package:flutter/material.dart';
import 'package:task_userlist/model/model.dart';

class UserDetails extends StatelessWidget {
  final UserModel user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? "User Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserCard(),
            const SizedBox(height: 16),
            _buildAddressCard(),
            const SizedBox(height: 16),
            _buildCompanyCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Personal Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(user.name ?? "N/A"),
              subtitle: const Text("Name"),
            ),
            ListTile(
              leading: const Icon(Icons.alternate_email),
              title: Text(user.username ?? "N/A"),
              subtitle: const Text("Username"),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(user.email ?? "N/A"),
              subtitle: const Text("Email"),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(user.phone ?? "N/A"),
              subtitle: const Text("Phone"),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(user.website ?? "N/A"),
              subtitle: const Text("Website"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard() {
    final address = user.address;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Address",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(address?.street ?? "N/A"),
              subtitle: const Text("Street"),
            ),
            ListTile(
              leading: const Icon(Icons.location_city),
              title: Text(address?.city ?? "N/A"),
              subtitle: const Text("City"),
            ),
            ListTile(
              leading: const Icon(Icons.apartment),
              title: Text(address?.suite ?? "N/A"),
              subtitle: const Text("Suite"),
            ),
            ListTile(
              leading: const Icon(Icons.mail_outline),
              title: Text(address?.zipcode ?? "N/A"),
              subtitle: const Text("Zipcode"),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: Text(
                "Lat: ${address?.geo?.lat ?? "N/A"}, Lng: ${address?.geo?.lng ?? "N/A"}",
              ),
              subtitle: const Text("Geo Coordinates"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyCard() {
    final company = user.company;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Company Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.business),
              title: Text(company?.name ?? "N/A"),
              subtitle: const Text("Name"),
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb),
              title: Text(company?.catchPhrase ?? "N/A"),
              subtitle: const Text("Catch Phrase"),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(company?.bs ?? "N/A"),
              subtitle: const Text("Business"),
            ),
          ],
        ),
      ),
    );
  }
}
