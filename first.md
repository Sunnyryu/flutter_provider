##Provider Lecture


프로바이더 강의 순서
![provider_1](https://i.imgur.com/1HMSH7x.png)


#### StateNotifier / StateNotifierProvider

핸들링하는 state의 type을 명확히 알 수 있으며,
다른 프로바이드에 연결을 쉽게 할 수 있음

프로바이드를 상태관리 매니저로 더욱 강해게 해줌!


#### why provider

프로바이더는 상태 관리를 위해 쓰임!

상태관리는 무엇인가?
(프로바이더가 제공하는 상태관리 기법은요?)

##State Management
위젯에서 필요한 데이터를 쉽게 엑세스
변환 데이터에 맞춰 ui를 그리는 기능을 가져야함

provider는 ui에 영향을 미치는 스테이트 핸들링하는 것에 영향을 미치지 않음(수단만 제공)

프로바이더는 위젯이자 아키텍처 같음..


ChangeNotifier => extends해서 사용 / mixed한 것을 사용할 수 있음
addlistener를 사용시에는 dispose를 이용해서 removeListener 시켜줘야함!

## ChangeNotifierProvier

ChangeNotifierProvider = ChangeNotifier + Provider

ChangeNotifier의 인스턴스 생성
1. 필요시 인스턴스를 만듬 (OVERRIDE THIS)
2. 필요없을시 메모리에서 제거 (dispose)
ChangeNotifier의 접근을 쉽게하고 필요시 UI를 리빌드함
1.Provider.of를 이용해서 쉽게 엑서스 할 수 있음
2.Provider.of에서 type T를 인스턴스 접근 
변화가 있으면 ui 리빌드 가능
false를 통해서는 changeNotifier를 받아오기만 하고 변화는 못함!
