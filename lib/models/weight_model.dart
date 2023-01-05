class WeightModel{
  String? weight;
  String? dateTime;
  String? uId;
  String? id;

  WeightModel({
    this.weight,
    this.dateTime,
    this.uId,
    this.id
});

  WeightModel.fromJson(Map<String,dynamic> json){
    weight= json['weight'];
    dateTime= json['dateTime'];
    uId= json['uId'];
    uId= json['id'];
  }

  Map<String,dynamic> toMap(){
    return {
      'weight' : weight,
      'dateTime' : dateTime,
      'uId' : uId,
      'uId' : id,
    };
  }
}