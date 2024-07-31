
/// -- Create a model to store and display api data

class EmployeeInfo {
  final int id;
  final String image;
  final String firstname;
  final String lastname;
  final String gender;
  final int age;
  final String designation;
  final String phone;
  final String state;
  final String country;

  EmployeeInfo({
    required this.id,
    required this.image,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.age,
    required this.designation,
    required this.phone,
    required this.state,
    required this.country,
});

  factory EmployeeInfo.fromJson(Map<String, dynamic> json) {
    return EmployeeInfo(
      id: json['id'],
      image: json['image'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      gender: json['gender'],
      age: json['age'],
      designation: json['company']['title'],
      phone: json['phone'],
      state: json['address']['state'],
      country: json['address']['city'],
    );
  }
}