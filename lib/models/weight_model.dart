class WeightModel{
  String? weight;
  String? dateTime;
  String? uId;
  String? wid;

  WeightModel({
    this.weight,
    this.dateTime,
    this.uId,
    this.wid
});

  WeightModel.fromJson(Map<String,dynamic> json){
    weight= json['weight'];
    dateTime= json['dateTime'];
    uId= json['uId'];
    wid= json['wid'];
  }

  Map<String,dynamic> toMap(){
    return {
      'weight' : weight,
      'dateTime' : dateTime,
      'uId' : uId,
      'wid' : wid,
    };
  }
}