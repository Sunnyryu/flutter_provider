## 프로바이더 강의



#### 페이지 랜더링 프로세스 of 스테이트풀 위젯
create an element(BuildContext) => initState => didChangeDependencies => Build

페이지 완성 후 할 수 있는것 

. initState
페이지 랜더링 도중! (마운팅 되고있는 중)
콘텍스트를 그릴 수 없음!
다른 페이지에 해주세요!

addPostFrameCallback
현재 프레임이 완료된 이후에 콜백을 수행해라(진행되는 것을 현재 이후로 해라!)
ex) WidgetBinding.instance!.addPostFrameCallback((Duration timestamp){
    // Do something
})



#### Error

1. ProviderNotFound Exception

main.dart hotrestart 해주기
routes를 잘못 읽을 떄
build를 잘못 걸었을 때

##### provider and action

perform actions based on the value of state

ui를 변경시키는 게 아닌 다이로그 보여줌, 스낵바, 바텀 시트, 네비에이션등은 주의가 필요함

액션 수행 3가지

ChangeNotifier를 이용 => 에러가 발생한 그 시점에서 dialog 표시, 비즈니스 로직, ui 명확히 구별 안됌
ui 액션 부분 이용 => 에러가 트리거된 함수에서 다이어로그 표시 방식, 관련된 로직을 한 군데에서 처리하는 방식, 
changeNotifier의 addlistner의 콜백이용 => 로직이 클리어하지만, 리스너를 등록 / dispose 하는 보일러 플레이트 코드를 만들어야하는 점이 있음 / 프로그램 로직상 리스너가 적절히 디스포짓 되지 않고 동일한 수행하는 여러가지 리스너가 있으므로 주의해서 사용해야함

강의자는 2/3번을 주로 사용함

