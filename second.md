##Provider Lecture2


context.read<T>() => Provider.of<T>(context, listen:false)
context.watch<T>() => Provider.of<T>(context)
context.select<T,R> (R selector(T value)) ->R (프로퍼티를 많이 가지고 있는 오브젝트에 특정 프로퍼티의 변화만 (listen 반복) 받고 싶을 때 => 선별적으로 가능 )
ex) context.select<Dog, String>((Dog dog)=> dog.name)

###FutureProvider

위젯트리에 빌드=> 사용될 값이 준비가 안되어서 기다려야할때 쓰임
(한번만 리빌드 되옵니다)