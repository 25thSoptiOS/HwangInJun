import UIKit

var str = "Hello, playground"


class ASDF {
    
    var a = 4;
    func name() {
        print("asdf")
    }
}

dump(ASDF())
print(ASDF())

 var a : (String, String,String) = ("asdf","asdf","aa")

print(a)



[“Tryndamere”, “Udyr”, “Ahri”, “Vayne”, “Pyke”]
select.forEach{ index in
   champArr
       .filter{ “\(index)” == $0.key }
       .compactMap{ names.append($0.name) }
}
select.compactMap{ key in
   champArr
       .first{ $0.key == “\(key)” }
       .flatMap{ names.append($0.name) }
}
//위와같은 상황일경우 forEach와 compactMap의 동작은 같은가 성능은 어느것이 좋은가?
//아래같은경우는 select순서대로 검색불가
champArr.compactMap{ champ in
   select.filter{ champ.key == “\($0)” }.map{ _ in
       names.append( champ.name ) }
}
