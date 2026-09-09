# Dart 언어

## 1. Introduction to Dart

`Introduction to Dart`는 Dart 문법을 하나씩 깊게 배우는 페이지라기보다는 앞으로 배울 주요 기능을 전체적으로 한 번 보여주는 페이지다.

여기서 나오는 변수, 클래스, Enum, 비동기 처리 같은 내용은 뒤의 개별 문서에서 다시 더 자세하게 나온다.

그래서 여기서는

> Dart에 어떤 기능이 있는지 전체적인 구조를 파악하는 것

을 목표로 보면 된다.

---

### 1-1. Dart 기본 구조

#### main 함수

**중요: 반드시 이해**

```dart
void main() {
  print('Hello, World!');
}
```

Dart 프로그램은 `main()` 함수에서 시작한다.

```dart
void main()
```

- `void`
  - 함수가 실행된 뒤 별도의 값을 반환하지 않는다는 뜻
- `main`
  - Dart 프로그램의 시작점으로 사용하는 함수
- `print()`
  - 값을 콘솔에 출력하는 함수

프로그램 안에는 여러 함수가 있을 수 있기 때문에 어디서부터 실행할지 정해진 시작점이 필요하다.

Dart에서는 그 역할을 `main()`이 한다.

---

#### 변수와 타입 추론

**중요: 반드시 이해**

```dart
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
```

Dart에서는 변수의 타입을 직접 적지 않고 `var`를 사용할 수 있다.

```dart
var name = 'Voyager I';
```

Dart가 오른쪽의 초기값을 보고 변수의 타입을 추론한다.

- `'Voyager I'` → `String`
- `1977` → `int`
- `3.7` → `double`

중요한 점은 `var`가 아무 타입이나 계속 넣을 수 있다는 뜻은 아니라는 것이다.

```dart
var year = 1977;
```

처음 값이 `int`이므로 `year`의 타입도 `int`로 결정된다.

즉,

```text
var = 타입이 없는 변수
```

가 아니라

```text
var = 타입 작성을 Dart에게 맡기는 문법
```

이라고 이해하는 것이 좋다.

왜 사용할까?

```dart
String name = 'Bob';
```

처럼 오른쪽 값만 봐도 타입이 너무 명확한 경우

```dart
var name = 'Bob';
```

처럼 작성하면 중복되는 타입 표현을 줄일 수 있다.

C#의 `var`도 초기값을 보고 타입이 결정된다는 점에서 거의 같은 개념이다.

---

#### 조건문과 반복문

**보통: 개념 이해**

```dart
if (year >= 2001) {
  print('21st century');
}

for (int month = 1; month <= 12; month++) {
  print(month);
}

while (year < 2016) {
  year += 1;
}
```

`if`, `for`, `while`의 기본 형태는 다른 프로그래밍 언어와 크게 다르지 않다.

기존에 알고 있다면 빠르게 확인하고 넘어가도 된다.

다만 다음 반복문은 한 번 봐두는 것이 좋다.

```dart
for (final object in flybyObjects) {
  print(object);
}
```

`flybyObjects` 안에 들어 있는 값을 하나씩 꺼내 `object`에 넣는다.

예를 들어

```dart
var flybyObjects = [
  'Jupiter',
  'Saturn',
  'Uranus'
];
```

라면 반복 중에는 다음 순서로 값이 들어온다.

```text
object = 'Jupiter'
object = 'Saturn'
object = 'Uranus'
```

여기서 `final`을 사용한 이유는 현재 반복에서 꺼낸 `object` 값을 다시 다른 값으로 바꿀 필요가 없기 때문이다.

C#의 `foreach`와 비슷한 방식이다.

---

#### 함수

**중요: 반드시 이해**

```dart
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;

  return fibonacci(n - 1) + fibonacci(n - 2);
}
```

여기서는 피보나치 계산 방법보다 함수의 구조를 보는 것이 중요하다.

```dart
int fibonacci(int n)
```

구조를 나누면 다음과 같다.

```text
int        fibonacci       (int n)
반환 타입    함수 이름         매개변수
```

##### 반환 타입

```dart
int
```

함수 실행이 끝난 뒤 `int` 값을 돌려준다는 뜻이다.

##### 함수 이름

```dart
fibonacci
```

함수를 호출할 때 사용하는 이름이다.

##### 매개변수

```dart
int n
```

함수를 호출할 때 정수 값을 하나 전달받는다.

```dart
fibonacci(20);
```

이라고 호출하면 함수 안에서는

```text
n = 20
```

이 된다.

##### return

```dart
return ...
```

함수가 계산한 결과를 호출한 곳으로 돌려준다.

```dart
var result = fibonacci(20);
```

`fibonacci(20)`의 반환값이 `result`에 저장된다.

---

##### 화살표 문법 `=>`

**중요: 알아두기**

```dart
(name) => name.contains('turn')
```

Dart에서는 한 줄짜리 표현식을 `=>`를 사용해 짧게 표현할 수 있다.

위 코드는 `name`을 받아서

```dart
name.contains('turn')
```

의 결과를 바로 반환한다.

즉, 짧은 함수를 만들 때 코드를 줄일 수 있다.

또한 이런 함수를 다른 함수의 인수로 전달하는 경우가 많다.

C#의 람다식에서 사용하던 `=>`와 개념적으로 비슷하다.

---

#### 주석

**보통**

```dart
// 일반 한 줄 주석
```

```dart
/// 문서화 주석
```

```dart
/*
여러 줄 주석
*/
```

`//`와 `/* */`는 일반적인 주석이다.

`///`는 클래스, 메서드, 라이브러리 등을 설명하는 문서화용 주석이다.

IDE나 Dart 문서화 도구에서 일반 주석과 다르게 처리할 수 있다.

---

#### import

**중요: 개념 이해**

다른 라이브러리나 파일의 기능을 사용하려면 `import`를 사용한다.

##### Dart 기본 라이브러리

```dart
import 'dart:math';
```

##### 외부 패키지

```dart
import 'package:test/test.dart';
```

##### 다른 Dart 파일

```dart
import 'path/to/my_other_file.dart';
```

프로젝트의 모든 기능을 하나의 파일에 작성할 수는 없다.

그래서 기능을 여러 파일이나 라이브러리로 나누고 필요한 곳에서 가져와 사용한다.

Flutter에서는 다음과 같은 형태를 자주 보게 된다.

```dart
import 'package:flutter/material.dart';
```

C#의 `using`과 목적은 비슷하지만 사용하는 방식과 라이브러리 구조는 다르다.

---

### 1-2. 객체 지향 문법

#### 클래스

**중요: 반드시 이해**

```dart
class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {
  }
}
```

클래스의 기본 개념은 C#에서 사용하던 클래스와 비슷하다.

다만 Dart에서 새롭게 보이는 문법들이 있다.

---

##### 필드

```dart
String name;
```

`Spacecraft` 객체가 가지고 있을 이름을 저장한다.

```dart
DateTime? launchDate;
```

발사 날짜를 저장한다.

여기서 중요한 것은 `?`이다.

```dart
DateTime?
```

은

```text
DateTime 값
또는
null
```

을 허용한다.

왜 발사 날짜에 `null`을 허용했을까?

아직 발사하지 않은 우주선은 발사 날짜 자체가 존재하지 않을 수 있기 때문이다.

```text
발사 완료
→ 날짜 있음

아직 발사하지 않음
→ 날짜 없음
→ null
```

즉, 실제 데이터에서 값이 존재하지 않는 상태도 의미가 있을 때 nullable 타입을 사용한다.

---

##### Getter

```dart
int? get launchYear => launchDate?.year;
```

`launchDate`에서 연도만 가져오는 getter다.

여기서 반환 타입이 `int?`인 이유가 중요하다.

`launchDate`가 `null`일 수 있기 때문이다.

```text
launchDate 있음
→ 연도 있음

launchDate 없음
→ 연도도 없음
```

그래서 일반 `int`가 아니라 `int?`를 반환한다.

---

##### `?.`

```dart
launchDate?.year
```

`launchDate`가 `null`이 아닐 때만 `year`에 접근한다.

반대로 `launchDate`가 `null`이면 `year`를 읽지 않고 결과도 `null`이 된다.

왜 이런 문법이 필요할까?

```text
null.year
```

처럼 객체가 존재하지 않는데 멤버에 접근하면 오류가 발생할 수 있기 때문이다.

이 문법은 뒤에서 Null Safety와 함께 다시 자세히 본다.

---

##### 생성자 축약 문법

```dart
Spacecraft(this.name, this.launchDate)
```

생성자로 전달받은 값을 현재 객체의 필드에 바로 저장한다.

개념적으로는

```text
name 값 전달
↓
this.name에 저장

launchDate 값 전달
↓
this.launchDate에 저장
```

하는 과정이다.

Dart에서는 이 과정을 짧게 작성할 수 있다.

---

#### Enum

**보통: 개념 이해**

```dart
enum PlanetType {
  terrestrial,
  gas,
  ice
}
```

Enum은 사용할 수 있는 값을 미리 정해두는 기능이다.

예를 들어 문자열을 직접 사용하면

```text
gas
Gas
gass
```

처럼 오타나 표현 차이가 생길 수 있다.

Enum을 사용하면

```dart
PlanetType.gas
```

처럼 미리 정의된 값만 사용할 수 있다.

즉,

> 상태나 종류처럼 가능한 값이 정해져 있을 때 사용한다.

기본적인 enum 개념은 C#과 비슷하다.

---

##### Enhanced Enum

Dart의 enum은 단순한 값 목록만 가질 필요는 없다.

Enhanced Enum 안에는

- 생성자
- 필드
- getter
- 메서드

등을 정의할 수 있다.

즉, 각각의 enum 값이 추가적인 데이터와 기능도 가지게 만들 수 있다.

지금은 존재만 알아두고 나중에 Enum 문서에서 다시 보면 된다.

---

#### 상속

**보통: 개념 이해**

```dart
class Orbiter extends Spacecraft {
}
```

`Orbiter`가 `Spacecraft`를 상속받는다.

```dart
extends Spacecraft
```

를 사용하면 부모 클래스의 기능을 자식 클래스에서 사용할 수 있다.

상속을 사용하는 이유는 공통 기능을 다시 작성하지 않고 재사용하기 위해서다.

Dart는 클래스의 단일 상속을 지원한다.

즉, 하나의 클래스가 여러 부모 클래스를 동시에 직접 상속할 수는 없다.

C#에서도 클래스는 하나의 기본 클래스만 직접 상속할 수 있다.

문법은 다르다.

```text
Dart
extends

C#
:
```

---

#### Mixin

**나중에: 개념 알아두기**

```dart
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}
```

사용:

```dart
class PilotedCraft extends Spacecraft with Piloted {
}
```

Mixin은 특정 기능을 여러 클래스에서 재사용하기 위한 방법이다.

`Piloted`에는

```dart
int astronauts
```

필드와

```dart
describeCrew()
```

메서드가 있다.

```dart
with Piloted
```

를 사용하면 `PilotedCraft`에서 해당 기능들을 사용할 수 있게 된다.

왜 상속과 별도로 Mixin이 필요할까?

상속을 사용하면 부모와 자식이라는 클래스 관계가 만들어진다.

하지만 특정 기능 하나만 여러 클래스에 넣고 싶은 경우도 있다.

Mixin은 이런 기능을 따로 분리해서 재사용할 수 있게 해준다.

C#에는 Dart의 Mixin과 정확히 같은 기본 문법은 없다.

지금은

> `with`를 사용해서 다른 기능을 클래스에 추가한다.

정도로 이해하면 충분하다.

---

#### Interface와 abstract class

**보통: 개념 이해**

Dart에서는 모든 클래스가 암시적으로 인터페이스를 정의한다.

```dart
class MockSpaceship implements Spacecraft {
}
```

`implements`를 사용하면 해당 클래스가 요구하는 내용을 직접 구현해야 한다.

---

##### abstract class

```dart
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
```

```dart
void describe();
```

처럼 구현 내용이 없는 추상 메서드를 정의할 수 있다.

왜 사용할까?

```text
이 클래스를 구현하거나 상속하는 클래스라면
반드시 특정 기능을 구현해야 한다.
```

라는 규칙을 만들 수 있기 때문이다.

C#의 `interface`, `abstract class`를 알고 있다면 기본 개념은 비슷하다.

---

### 1-3. 비동기와 예외

#### 비동기 처리

**중요: 개념 반드시 이해**

```dart
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}
```

비동기 처리는 작업 결과가 즉시 나오지 않는 상황에서 사용한다.

예를 들면

- 서버에서 데이터 가져오기
- 파일 읽기
- 데이터베이스 작업
- 일정 시간 기다리기

같은 작업이 있다.

---

##### Future

```dart
Future<void>
```

`Future`는

> 지금은 작업이 끝나지 않았지만 미래에 완료될 작업

을 표현한다.

여기서는

```dart
Future<void>
```

이므로 작업은 나중에 완료되지만 최종적으로 돌려줄 값은 없다.

반대로

```dart
Future<String>
```

이라면

> 작업이 끝난 뒤 `String` 결과가 나온다.

는 뜻이다.

C#에서 비슷한 역할을 하는 것이 `Task`다.

```text
Dart
Future

C#
Task
```

---

##### async

```dart
async
```

해당 함수가 비동기 작업을 포함할 수 있도록 한다.

그리고 함수 안에서 `await`를 사용할 수 있게 된다.

```dart
Future<void> test() async {
}
```

이 함수 안에서는 `await`를 사용할 수 있다.

---

##### await

```dart
await Future.delayed(oneSecond);
```

해당 `Future` 작업이 완료되는 것을 기다린 뒤 다음 코드를 이어서 실행한다.

코드를 읽는 흐름은 다음과 같다.

```text
함수 실행
↓
비동기 작업 시작
↓
await
↓
작업 완료
↓
다음 코드 실행
```

왜 필요할까?

비동기 코드를 일반 코드처럼 위에서 아래로 읽을 수 있게 만들어 가독성을 높여준다.

Dart와 C# 모두 `async`, `await`라는 비슷한 문법을 사용한다.

---

#### 예외 처리

**보통: 개념 이해**

예외를 직접 발생시키려면 `throw`를 사용한다.

```dart
throw StateError('No astronauts.');
```

예외를 처리할 때는 다음과 같이 작성할 수 있다.

```dart
try {
  ...
} on IOException catch (e) {
  ...
} finally {
  ...
}
```

- `try`
  - 문제가 발생할 수 있는 코드
- `on`
  - 처리하고 싶은 특정 예외 타입 지정
- `catch`
  - 발생한 예외를 받아 처리
- `finally`
  - 성공이나 실패와 관계없이 마지막에 실행
- `throw`
  - 직접 예외 발생

기본 흐름은 C#의 `try`, `catch`, `finally`, `throw`와 비슷하다.

---

## 2. Variables

Introduction에서는 변수를 짧게 봤지만, Variables 문서에서는 Dart의 변수 규칙을 더 자세히 설명한다.

특히 중요한 부분은 다음이다.

- 타입 추론
- Null Safety
- `?`
- `late`
- `final`
- `const`
- `_`

---

### 2-1. 변수 기본

#### 변수는 객체를 참조한다

```dart
var name = 'Bob';
```

Dart 공식 문서에서는 변수 `name`이 `"Bob"`이라는 값을 가진 `String` 객체에 대한 참조를 저장한다고 설명한다.

처음에는 어렵게 생각할 필요는 없다.

객체를 사용하는 언어에서는

> 변수는 객체를 가리키고 있다.

는 개념이 존재한다고 이해하면 된다.

---

#### 타입 추론

```dart
var name = 'Bob';
```

초기값이 문자열이기 때문에 `name`은 `String` 타입으로 추론된다.

직접 타입을 적을 수도 있다.

```dart
String name = 'Bob';
```

보다 넓은 타입으로 만들 수도 있다.

```dart
Object name = 'Bob';
```

`Object`는 여러 종류의 객체를 담을 수 있는 상위 타입이다.

Dart에는 `dynamic`도 존재한다.

`dynamic`은 타입 검사를 런타임까지 미룰 수 있기 때문에 유연하지만, 컴파일러의 타입 검사를 약하게 만든다.

그래서 꼭 필요한 경우가 아니라면 남용하지 않는 것이 좋다.

---

### 2-2. Null Safety

**매우 중요**

Dart는 Sound Null Safety를 사용한다.

Null Safety의 핵심 목적은

> `null`일 수도 있는 값을 잘못 사용해서 발생하는 오류를 실행 전에 최대한 발견하는 것

이다.

---

#### Null Safety가 필요한 이유

예를 들어 정수 변수 `i`에서 절댓값을 가져온다고 생각해보자.

```dart
i.abs();
```

`i`가 정상적인 정수라면 문제가 없다.

하지만

```text
i = null
```

이라면 실제로는

```text
null.abs()
```

와 비슷한 문제가 생긴다.

`null`에는 우리가 원하는 `abs()` 기능이 없기 때문에 오류가 발생한다.

Dart는 이런 문제를 프로그램 실행 도중 발견하기보다는 코드 작성이나 컴파일 단계에서 미리 잡으려고 한다.

---

#### nullable `?`

```dart
String? name;
```

타입 뒤의 `?`는 이 변수에 `null`이 들어갈 수 있다는 뜻이다.

```text
String?
→ String 또는 null
```

반대로

```dart
String name;
```

은 `String` 값만 허용한다.

```text
String
→ String
→ null 불가능
```

왜 개발자가 직접 `?`를 적어야 할까?

Dart에게

> 이 값은 실제로 존재하지 않을 수도 있다.

라는 사실을 알려주기 위해서다.

그러면 Dart는 이 변수를 사용할 때 `null` 가능성까지 검사한다.

예를 들어 사용자가 별명을 설정하지 않을 수도 있다면

```dart
String? nickname;
```

처럼 표현할 수 있다.

C#의 nullable reference type에서도 `String?`처럼 비슷한 형태를 볼 수 있지만 세부 규칙은 Dart와 완전히 같지는 않다.

---

#### Null Safety의 핵심 규칙

##### 1. `?`로 null 가능 여부를 표시한다

```dart
String? name;
```

```text
null 가능
```

```dart
String name;
```

```text
null 불가능
```

---

##### 2. non-nullable 변수는 사용 전에 값이 있어야 한다

```dart
int count = 0;
```

Dart는 `int` 변수인데 값이 없는 상태로 사용되는 것을 막는다.

---

##### 3. nullable 값에는 안전하지 않은 접근을 바로 할 수 없다

```dart
String? name;
```

`name`이 실제로 `null`일 수도 있기 때문에 Dart가 사용 방법을 검사한다.

이 규칙 때문에 뒤에서 나오는

```text
?.
!
??
??=
```

같은 문법이 중요해진다.

---

#### nullable 변수의 기본값

```dart
int? lineCount;
```

nullable 변수를 초기화하지 않으면 기본적으로 `null`이다.

```dart
assert(lineCount == null);
```

숫자 타입이라고 해서 자동으로 `0`이 들어가는 것이 아니다.

```text
int?
→ int 또는 null
```

이기 때문이다.

---

#### non-nullable 변수 초기화

```dart
int lineCount = 0;
```

non-nullable 변수는 사용하기 전에 반드시 값이 들어 있어야 한다.

하지만 선언하는 순간 바로 값을 넣어야만 하는 것은 아니다.

```dart
int lineCount;

if (weLikeToCount) {
  lineCount = countLines();
} else {
  lineCount = 0;
}

print(lineCount);
```

실행 경로를 보면

```text
if 실행
→ 값 설정

else 실행
→ 값 설정
```

어느 쪽으로 가더라도 `print()` 전에 `lineCount`에 값이 들어간다.

Dart가 이 흐름을 분석할 수 있기 때문에 허용된다.

---

### 2-3. 초기화 관련 문법

#### late

**매우 중요**

```dart
late String description;

void main() {
  description = 'Feijoada!';
  print(description);
}
```

`late`는

> 지금은 값을 넣지 않지만 사용하기 전에는 반드시 초기화하겠다.

라는 의미로 사용할 수 있다.

---

##### late가 필요한 이유

다음과 같은 변수를 생각해보자.

```dart
String name;
```

`String`이므로 `null`은 허용하고 싶지 않다.

그런데 프로그램 구조상 선언 순간에는 값을 알 수 없고 나중에 값을 넣어야 할 수도 있다.

이때

```dart
String? name;
```

으로 만들면 실제로는 `null`을 허용하고 싶지 않은 변수인데 nullable 타입이 된다.

이런 상황에서

```dart
late String name;
```

을 사용할 수 있다.

정리하면

```text
String?
→ null을 실제로 허용

late String
→ null은 허용하지 않음
→ 초기화 시점만 나중으로 미룸
```

이다.

---

##### late 사용 시 주의점

```dart
late String name;

print(name);
```

값을 넣기 전에 사용하면 런타임 오류가 발생한다.

즉, `late`는 Dart가 초기화를 대신 보장해주는 문법이 아니다.

개발자가

> 사용하기 전에 내가 반드시 값을 넣겠다.

라고 책임을 가져가는 것에 가깝다.

그래서 아무 변수에나 무조건 `late`를 붙이는 것은 좋지 않다.

---

#### Lazy Initialization

`late`는 초기화 자체를 실제 사용 시점까지 미루는 데도 사용할 수 있다.

```dart
late String temperature = readThermometer();
```

이 경우 `temperature`가 실제로 처음 사용될 때 `readThermometer()`가 실행된다.

왜 필요할까?

`readThermometer()`가 실행 비용이 큰 함수라고 생각해보자.

그런데 프로그램 실행 중 `temperature`를 한 번도 사용하지 않는다면 굳이 비싼 작업을 실행할 필요가 없다.

```text
변수 사용 안 함
→ 초기화 작업도 실행 안 함

변수 처음 사용
→ 그때 초기화
```

필요할 때만 작업을 실행할 수 있다는 장점이 있다.

---

### 2-4. 변경을 제한하는 변수

#### final

**매우 중요**

```dart
final name = 'Bob';
final String nickname = 'Bobby';
```

`final` 변수는 값을 한 번만 설정할 수 있다.

```dart
name = 'Alice';
```

처럼 다시 다른 값을 넣으면 오류가 발생한다.

---

##### final을 사용하는 이유

프로그램에는

> 한 번 정한 뒤 다시 바뀌면 안 되는 값

이 많다.

이런 변수에 `final`을 사용하면 다른 코드에서 실수로 다시 대입하는 것을 막을 수 있다.

또한 코드를 읽을 때

> 이 변수는 이후에 다른 값으로 바뀌지 않는다.

라는 의도를 바로 알 수 있다.

---

##### final은 실행 중 값이 결정되어도 된다

다음 코드는 이해를 위한 예시다.

```dart
final currentTime = DateTime.now();
```

현재 시간은 프로그램이 실행되어야 알 수 있다.

하지만 한 번 가져온 뒤 다시 변경하지 않을 것이라면 `final`을 사용할 수 있다.

즉,

```text
final
→ 값이 언제 결정되는지는 상관 없음
→ 한 번만 대입 가능
```

이다.

---

#### const

**매우 중요**

```dart
const bar = 1000000;
const double atm = 1.01325 * bar;
```

`const`는 컴파일 시점에 값이 결정되는 상수다.

즉, 프로그램을 실제로 실행하기 전부터 값이 무엇인지 알 수 있어야 한다.

```dart
const value = 10;
```

`10`은 실행하지 않아도 이미 값이 정해져 있으므로 `const`로 만들 수 있다.

---

##### const가 필요한 이유

값이 절대로 변하지 않고 실행 전부터 확정되어 있다면 Dart가 그 값을 상수로 관리할 수 있다.

코드를 읽는 사람 입장에서도

```text
이 값은 절대로 바뀌지 않는다.
```

라는 의미가 명확해진다.

Flutter에서는 `const` 위젯을 굉장히 자주 보게 된다.

---

#### final과 const 차이

둘 다 값을 함부로 다시 대입하지 못하게 하지만 의미가 다르다.

```text
final
→ 한 번만 값 설정
→ 실행 중 값이 결정되어도 됨

const
→ 컴파일 시점에 값이 이미 결정되어 있어야 함
→ 상수
```

예를 들어

```dart
final currentTime = DateTime.now();
```

는 가능하다.

현재 시간은 실행해야 알 수 있기 때문이다.

반면

```dart
const currentTime = DateTime.now();
```

는 사용할 수 없다.

현재 시간은 프로그램을 실행하기 전에는 알 수 없기 때문이다.

C#으로 연결하면 Dart의 `const`는 C#의 `const`와 비슷한 성격이고, `final`은 일부 상황에서 C#의 `readonly`와 비슷하게 생각할 수 있다.

다만 완전히 같은 문법은 아니다.

---

##### final 객체와 const 객체

이 차이는 중요하다.

`final`은 변수가 다른 객체를 다시 가리키게 만드는 것을 막는다.

예를 들어

```dart
final list = [1, 2, 3];
```

`list` 변수에 새로운 리스트를 다시 대입할 수는 없다.

하지만 리스트 내부 내용은 바뀔 수 있다.

반대로 `const` 객체는 객체 자체가 변경 불가능한 값이다.

정리하면

```text
final
→ 변수의 재대입을 막음
→ 객체 내부는 변경될 수도 있음

const
→ 객체 자체도 변경 불가능
```

이다.

---

##### const 값

`const`는 변수 선언에만 사용하는 것이 아니다.

상수 객체를 만들 때도 사용할 수 있다.

```dart
var foo = const [];
final bar = const [];
const baz = [];
```

```dart
const baz = [];
```

처럼 변수 자체가 `const`라면 오른쪽의 `const`는 생략할 수 있다.

---

### 2-5. Wildcard

#### Wildcard 변수 `_`

**보통**

```dart
for (var _ in list) {
}
```

또는

```dart
catch (_) {
  print('oops');
}
```

`_`는 값은 전달되지만 그 값 자체를 사용할 필요가 없을 때 쓰는 placeholder다.

예를 들어

```dart
catch (_) {
  print('오류 발생');
}
```

에서는 오류가 발생했다는 사실만 중요하고 실제 오류 객체는 사용하지 않는다.

그래서 변수 이름을 따로 만들지 않고 `_`로 받을 수 있다.

---

## 3. Operators

Operators 문서에는 많은 연산자가 나온다.

하지만

```text
+
-
*
==
!=
>
<
&&
||
```

같은 기본 연산자는 다른 언어에서도 자주 사용하던 문법이다.

그래서 Dart에서 특징적인 부분을 중심으로 보는 것이 좋다.

---

### 3-1. 연산자 기본

#### 연산자 우선순위

```dart
if (n % i == 0 && d % i == 0) {
}
```

여러 연산자가 하나의 식에 들어 있으면 우선순위에 따라 계산된다.

위 코드는 대략 다음 순서로 이해할 수 있다.

```text
%
↓
==
↓
&&
```

가독성을 위해 괄호를 사용할 수도 있다.

```dart
if ((n % i == 0) && (d % i == 0)) {
}
```

결과는 같지만 복잡한 식에서는 괄호를 사용하면 코드가 훨씬 읽기 쉬워진다.

---

### 3-2. 산술 연산자

```text
+
-
*
/
%
```

기본적인 의미는 다른 언어와 같다.

Dart에서 따로 기억할 것은 `~/`이다.

---

#### `~/` 정수 나눗셈

**중요**

```dart
5 / 2
```

결과:

```text
2.5
```

Dart에서 `/`는 일반 나눗셈이고 결과는 `double`이다.

반면

```dart
5 ~/ 2
```

결과:

```text
2
```

`~/`는 나눗셈 결과에서 정수 몫을 얻을 때 사용한다.

예를 들어 5개를 2개씩 묶는다고 생각하면

```text
5 / 2
→ 2.5

5 ~/ 2
→ 완전한 묶음 2개
```

처럼 볼 수 있다.

C#에서는 `int / int`를 하면 정수 나눗셈이 되지만 Dart는 `/`와 `~/`를 따로 구분한다.

---

#### 증가와 감소

```dart
++a
a++
--a
a--
```

기본적인 개념은 C#과 같다.

차이는 값을 사용하는 시점이다.

```dart
b = ++a;
```

실행 순서:

```text
a 증가
↓
증가된 값을 b에 저장
```

반대로

```dart
b = a++;
```

실행 순서:

```text
현재 a 값을 b에 저장
↓
a 증가
```

---

### 3-3. 비교 연산자

```text
==
!=
>
<
>=
<=
```

기본적인 사용법은 다른 언어와 비슷하다.

다만 Dart에서는 클래스에서 `==` 연산자의 동작을 직접 정의할 수 있다.

따라서 객체 비교에서는 단순히 변수만 보는 것이 아니라 해당 클래스의 `==` 구현이 영향을 줄 수 있다.

완전히 동일한 객체인지 확인해야 할 때는 `identical()` 함수도 존재한다.

지금은 존재만 알아두면 된다.

---

### 3-4. 타입 관련 연산자

#### `is`

**중요**

```dart
employee is Person
```

`employee`가 `Person` 타입인지 확인한다.

결과는 `bool`이다.

```text
Person 타입
→ true

Person 타입 아님
→ false
```

왜 필요할까?

변수에 여러 종류의 객체가 들어올 수 있을 때 실제 객체의 타입을 확인한 뒤 그 타입이 가진 기능을 사용해야 하기 때문이다.

---

#### `is!`

```dart
employee is! Person
```

`employee`가 `Person` 타입이 아닌지 확인한다.

```text
is
→ 해당 타입인가?

is!
→ 해당 타입이 아닌가?
```

---

#### `as`

**중요**

```dart
(employee as Person).firstName = 'Bob';
```

`employee`를 `Person` 타입으로 캐스팅한다.

중요한 것은 `as`를 사용할 때 실제 객체가 해당 타입이라고 확신할 수 있어야 한다는 점이다.

실제로 `Person`이 아니라면 예외가 발생할 수 있다.

그래서 확실하지 않다면 먼저 `is`로 확인하는 방식이 안전하다.

```dart
if (employee is Person) {
  employee.firstName = 'Bob';
}
```

C#의 `is`, `as`와 상당히 비슷한 개념이다.

---

### 3-5. 대입 관련 연산자

#### 기본 대입

```dart
a = value;
```

복합 대입도 사용할 수 있다.

```dart
a += b;
a -= b;
a *= b;
a /= b;
```

예를 들어

```dart
a += b;
```

는

```dart
a = a + b;
```

와 같은 의미다.

---

#### `??=`

**매우 중요**

```dart
b ??= value;
```

뜻:

> `b`가 null일 때만 `value`를 대입한다.

예를 들어

```dart
String? name;

name ??= 'Guest';
```

현재 `name`이 `null`이기 때문에

```text
name = 'Guest'
```

가 된다.

반대로

```dart
String? name = 'Ingyu';

name ??= 'Guest';
```

라면 이미 값이 존재하므로

```text
Ingyu
```

가 그대로 유지된다.

왜 필요할까?

nullable 변수에 기본값을 넣고 싶지만 이미 정상적인 값이 있다면 그 값을 덮어쓰면 안 되는 경우가 있기 때문이다.

C#에도 `??=` 문법이 있다.

---

### 3-6. 논리 연산자

```text
!
||
&&
```

기본 사용법은 다른 언어와 같다.

```dart
if (!done && (col == 0 || col == 3)) {
}
```

- `!`
  - true와 false 반전
- `&&`
  - 두 조건이 모두 true
- `||`
  - 둘 중 하나 이상 true

---

### 3-7. 비트 연산자

**나중에**

```text
&
|
^
~
<<
>>
>>>
```

정수의 비트를 직접 조작할 때 사용한다.

일반적인 Flutter 기초 학습에서는 우선순위가 높지 않다.

```text
&
→ 비트 AND

|
→ 비트 OR

^
→ 비트 XOR

~
→ 비트 반전

<<
→ 왼쪽 시프트

>>
→ 오른쪽 시프트

>>>
→ 부호 없는 오른쪽 시프트
```

지금은 어떤 연산자가 있는지만 알아두고 필요할 때 다시 공부해도 된다.

---

### 3-8. 조건 표현식

#### 삼항 연산자

```dart
var visibility = isPublic ? 'public' : 'private';
```

구조:

```text
조건 ? 참일 때 값 : 거짓일 때 값
```

`isPublic`이 `true`라면

```text
public
```

`false`라면

```text
private
```

가 저장된다.

C#에서 사용하는 삼항 연산자와 같은 형태다.

---

#### `??`

**매우 중요**

```dart
String playerName(String? name) =>
    name ?? 'Guest';
```

`??`는 왼쪽 값이 `null`인지 확인한다.

```text
왼쪽이 null 아님
→ 왼쪽 값 사용

왼쪽이 null
→ 오른쪽 값 사용
```

예를 들어

```dart
name ?? 'Guest'
```

에서

```text
name = 'Ingyu'
```

라면 결과는

```text
Ingyu
```

이다.

반대로

```text
name = null
```

이라면

```text
Guest
```

가 된다.

왜 사용할까?

nullable 값에 기본값을 쉽게 지정할 수 있기 때문이다.

길게 작성하면 다음과 비슷하다.

```dart
if (name != null) {
  return name;
} else {
  return 'Guest';
}
```

C#의 `??`와 같은 null 병합 개념이다.

---

##### `??`와 `??=` 차이

헷갈리기 쉬운 부분이다.

```dart
name ?? 'Guest'
```

은 사용할 값을 선택한다.

```text
name이 null
→ Guest를 사용
```

하지만 `name` 변수 자체에 `Guest`를 저장하는 것은 아니다.

반대로

```dart
name ??= 'Guest';
```

은 변수에 실제로 값을 저장한다.

```text
name이 null
→ name에 Guest 저장
```

정리:

```text
??
→ 값 선택

??=
→ 값 대입
```

---

### 3-9. Dart 특유 문법

#### Cascade `..`

**중요**

```dart
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;
```

`..`는 같은 객체에 여러 작업을 연속해서 수행하는 Cascade 문법이다.

위 코드는 다음 코드와 같은 객체를 다룬다.

```dart
var paint = Paint();

paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;
```

왜 사용할까?

같은 객체 이름을 계속 반복하지 않아도 되기 때문이다.

```text
paint.
paint.
paint.
```

대신

```text
..
..
..
```

를 이용해서 처음 만든 객체를 계속 사용할 수 있다.

C#에는 Dart의 Cascade와 정확히 같은 기본 문법은 없다.

---

##### `?..`

```dart
document.querySelector('#confirm')
  ?..textContent = 'Confirm'
  ..classList.add('important')
  ..scrollIntoView();
```

`?..`는 nullable 객체에서 Cascade를 안전하게 시작할 때 사용한다.

처음 객체가 `null`이면 이후 Cascade 작업도 실행하지 않는다.

```text
객체 존재
→ 뒤의 작업 실행

객체 null
→ 뒤의 작업 실행 안 함
```

첫 Cascade에서 `?..`를 사용한 뒤 이후에는 `..`를 이어서 사용할 수 있다.

---

#### Spread `...`

**중요**

Spread는 컬렉션 안에 다른 컬렉션의 값을 펼쳐 넣을 때 사용한다.

##### 추가 예제

```dart
var first = [1, 2];

var second = [
  ...first,
  3
];
```

결과:

```text
[1, 2, 3]
```

`first` 리스트 자체를 하나의 값으로 넣는 것이 아니다.

```text
1
2
```

두 값을 각각 펼쳐서 `second` 안에 넣는다.

리스트 여러 개를 합치거나 기존 컬렉션의 내용을 새 컬렉션에 포함할 때 유용하다.

---

##### `...?`

`...?`는 nullable 컬렉션에서 사용할 수 있는 Spread 문법이다.

```text
...
→ 컬렉션 펼치기

...?
→ null일 수도 있는 컬렉션 펼치기
```

컬렉션이 `null`일 가능성이 있을 때 안전하게 사용할 수 있다.

---

### 3-10. Null Safety 관련 연산자

#### `?.`

**매우 중요**

```dart
foo?.bar
```

뜻:

> `foo`가 null이 아닐 때만 `bar`에 접근한다.

```text
foo 존재
→ foo.bar 사용

foo == null
→ bar 접근 안 함
→ 결과 null
```

왜 필요할까?

nullable 객체에는 실제 객체가 존재하지 않을 수도 있기 때문이다.

```text
foo = null
```

인데

```dart
foo.bar
```

를 실행하면 존재하지 않는 객체의 멤버를 사용하려는 문제가 생긴다.

`?.`를 사용하면 안전하게 확인하면서 접근할 수 있다.

C#의 `?.`와 거의 같은 개념이다.

---

#### `!` Null Assertion

**매우 중요**

```dart
foo!.bar
```

`!`는

> `foo`가 null이 아니라고 개발자가 직접 보장한다.

라는 뜻이다.

예를 들어 `foo`의 타입이

```dart
SomeType?
```

이라면 Dart 입장에서는 `null`일 가능성이 있다.

그래서 안전하지 않은 멤버 접근을 제한한다.

개발자가 프로그램 흐름상 절대로 `null`이 아니라고 확신한다면

```dart
foo!
```

를 사용할 수 있다.

하지만 실제로 값이 `null`이라면 런타임 오류가 발생한다.

그래서

> `!`는 null 문제를 해결하는 문법이 아니라 null이 아니라는 책임을 개발자가 가져가는 문법

이라고 이해하는 것이 좋다.

C#의 null-forgiving `!`와 모양은 비슷하지만 실제 런타임 처리 방식까지 완전히 같다고 생각하면 안 된다.

---

#### Null 관련 문법 한 번에 보기

```text
String?
```

```text
이 변수는 null일 수도 있다.
```

---

```text
?.
```

```text
null이 아닐 때만 멤버에 접근한다.
```

---

```text
!
```

```text
null이 아니라고 개발자가 보장한다.
실제로 null이면 런타임 오류가 날 수 있다.
```

---

```text
??
```

```text
null이면 다른 값을 사용한다.
```

---

```text
??=
```

```text
null일 때만 값을 대입한다.
```

---

```text
?..
```

```text
null이 아닐 때만 Cascade를 시작한다.
```

---

```text
...?
```

```text
null일 수도 있는 컬렉션을 안전하게 펼친다.
```

---

