class Babies {
  final int age;

  Babies({required this.age});

  Future<int> getBabies() async {
    await Future.delayed(const Duration(seconds: 3));

    if (age > 1 && age < 5) {
      return 4;
    } else if (age < 1) {
      return 0;
    } else {
      return 2;
    }
  }

  Stream<String> bark() async* {
    // 요청이 있을때까지 연산하는 걸 안하다가 필요할때 처리
    for (int i = 1; i < age; i++) {
      await Future.delayed(const Duration(seconds: 2));
      yield 'Bark $i items';

      // 리턴해도 함수가 종료되지 않음 => iterable 또는 stream 반환
    }
  }
}
