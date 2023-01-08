class CharacterModel {
  late int charId;
  late String name;
  late String birthday;
  late String nickName;
  late String image;
  late List<dynamic> occupation;
  late String status;
  late List<String> appearanceOfBreakingBad;
  late String portrayed;
  late String category;
  late List<String> appearanceOfBetterCallSaul;

  CharacterModel.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    birthday = json["birthday"];
    nickName = json["nickname"];
    image = json["img"];
    occupation = json["occupation"];
    status = json["status"];
    appearanceOfBreakingBad = json["appearance"];
    portrayed = json["portrayed"];
    category = json["category"];
    appearanceOfBetterCallSaul = json["better_call_saul_appearance"];
  }
}
