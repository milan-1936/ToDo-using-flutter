class Users{
  final String gender;
  final String email;
  final Name name;
  final Address add;
  final String profilePic;

  Users({
    required this.name,
    required this.add,
    required this.gender,
    required this.email,
    required this.profilePic,
  });
}


class Name{
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });
}

class Address{
  final String city;
  final String state;
  final String country;

  Address({
    required this.city,
    required this.state,
    required this.country,
  });
}