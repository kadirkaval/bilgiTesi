import './soru.dart';

class TestListesi{
  int _soruIndex =0;

  void indexSifirla(){
    _soruIndex=0;
  }

  final List<Soru> _sorular = [
    Soru(soruMetni: "Soru 1", soruCevap: false),
    Soru(soruMetni: "Soru 2", soruCevap: true),
    Soru(soruMetni: "Soru 3", soruCevap: true),
    Soru(soruMetni: "Soru 4", soruCevap: false),
    Soru(soruMetni: "Soru 5", soruCevap: true)
  ];

  String getSoruMetni(){
    return _sorular[_soruIndex].soruMetni;
  }
  bool getSoruCevap(){
    return _sorular[_soruIndex].soruCevap;
  }

  void setIndex(){
    if(_soruIndex+1<_sorular.length){
      _soruIndex++;
    }
  }
  bool testBittiMi(){
    if(_soruIndex+1 >= _sorular.length){
     return true;
    }else{
      return false;
    }
  }
}