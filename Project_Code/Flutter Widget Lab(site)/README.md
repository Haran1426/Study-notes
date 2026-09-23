# Flutter Widget Lab

Flutter 위젯과 핵심 개념을 **화면 예시 → 동작 원리 → 코드 → 직접 실습 → 확인 문제** 순서로 학습하는 반응형 웹사이트입니다.

위젯 이름과 속성을 외우는 데서 끝내지 않고, 실제 화면에서 어떤 역할을 하는지 확인하고 코드가 동작하는 순서를 따라가도록 구성했습니다. 특히 처음 접하면 이해하기 어려운 `BuildContext`, `setState`, `Provider`, 비동기 처리, 위젯 생명주기를 시각적인 실험과 단계별 설명으로 학습할 수 있습니다.

> 현재 버전: **3.0.0**
>
> 공개 사이트: **[Flutter Widget Lab 바로가기](https://flutter-widget-lab-ingyu.sdh240117.chatgpt.site)**

---

## 프로젝트 목적

Flutter를 공부하다 보면 아래와 같은 의문이 자주 생깁니다.

- `MaterialApp`과 `Scaffold`는 정확히 무엇이 다른가?
- `Row`와 `Column`에서 주축과 교차축은 어떻게 결정되는가?
- 변수 값을 바꿨는데 왜 화면은 그대로인가?
- `context`는 왜 필요하고, 왜 위치에 따라 결과가 달라지는가?
- `Future`, `Stream`, `initState`, `dispose`, `Key`는 언제 사용하는가?

Flutter Widget Lab은 이러한 질문을 짧은 정의 하나로 끝내지 않고 다음 흐름으로 설명합니다.

1. 실제로 볼 수 있는 화면이나 동작을 먼저 제시합니다.
2. 위젯 트리와 데이터 흐름을 기준으로 원리를 설명합니다.
3. 핵심 코드와 전체 실행 예제를 제공합니다.
4. 값을 직접 바꾸는 웹 시뮬레이션으로 결과를 비교합니다.
5. 퀴즈와 작은 응용 문제로 이해한 내용을 확인합니다.

---

## 주요 기능

### 1. 60개의 Flutter 학습 항목

위젯, 상태 관리, 화면 이동, 비동기 처리, 애니메이션, 생명주기 등 총 60개 항목을 11개 카테고리로 나누었습니다.

| 카테고리 | 학습 항목 |
| --- | --- |
| 앱 뼈대 | `MaterialApp`, `Scaffold`, `AppBar`, `SafeArea` |
| 표시·꾸미기 | `Text`, `Icon`, `Container`, `Image`, `Card`, `Divider` |
| 배치·여백 | `Padding`, `SizedBox`, `Center`, `Align`, `Row`, `Column`, `Expanded`, `Spacer`, `Stack`, `Wrap`, `Flexible`, `AspectRatio`, `LayoutBuilder` |
| 목록·스크롤 | `ListView`, `GridView`, `ListTile`, `SingleChildScrollView`, `PageView`, `RefreshIndicator` |
| 입력·동작 | `FilledButton`, `TextField`, `Form`, `GestureDetector`, `Checkbox`, `Switch`, `Slider`, `FocusNode` |
| 상태 관리 | `StatelessWidget`, `StatefulWidget`, `setState`, `Provider`, `ValueListenableBuilder` |
| 이동·피드백 | `Navigator`, `showDialog`, `SnackBar`, `NavigationBar`, `TabBar`, `TabBarView`, `showModalBottomSheet` |
| context·데이터 | `BuildContext`, `Builder`, `Theme`, `MediaQuery` |
| 애니메이션 | `AnimatedContainer`, `AnimatedSwitcher`, `TweenAnimationBuilder` |
| 비동기 처리 | `FutureBuilder`, `Future`, `async`, `await`, `StreamBuilder` |
| 생명주기·식별 | `initState`, `dispose`, `Key`, `ValueKey` |

각 항목은 이름, 역할, 사용 위치, 핵심 원리, 주의할 점, 실습 과제, 퀴즈, 공식 문서 링크를 포함합니다.

### 2. 다섯 가지 학습 탭

| 탭 | 제공 내용 |
| --- | --- |
| 이해하기 | 실제 사용 화면, 핵심 원리, 사용 위치, 위젯 구조, 자주 하는 실수 |
| 자세히 보기 | 3단계 실행 흐름, 코드 줄별 해설, 비슷한 개념 비교, 자주 묻는 질문, 응용 문제 |
| 만져보기 | 속성이나 상태를 직접 바꾸고 결과를 확인하는 웹 시뮬레이션 |
| 코드 | 핵심 코드와 `lib/main.dart`에 넣을 수 있는 전체 예제 |
| 확인 문제 | 개념별 객관식 문제와 정답 해설 |

### 3. BuildContext 실험실

`BuildContext`는 단순한 값이 아니라 **위젯 트리 안의 특정 위치에 접근하는 인터페이스**입니다. 사이트에서는 출발 위치를 직접 선택하고 필요한 조상을 찾는 과정을 단계별로 확인할 수 있습니다.

- `Scaffold.of(context)`가 실패하는 위치와 `Builder`로 해결한 위치
- `ScaffoldMessenger.of(context)`가 `SnackBar`를 표시하는 범위
- `Navigator.of(context)`가 접근하는 화면 이동 범위
- `Provider`가 제공된 범위 안과 밖의 차이
- 중첩된 `Theme`에서 가장 가까운 테마를 읽는 과정

실험은 Flutter 내부 탐색 알고리즘의 성능을 재현하지 않습니다. **어떤 위치에서 어떤 조상에 접근할 수 있는지**를 이해하기 위한 개념 모형입니다.

### 4. 인터랙티브 실습

브라우저에서 값을 바꾸며 다음 동작을 확인할 수 있습니다.

- `Row`와 `Column`의 방향 및 정렬
- `Expanded`의 `flex` 비율
- `Padding`, `borderRadius`, 글자 크기와 정렬
- `setState` 또는 `notifyListeners` 호출 여부에 따른 화면 갱신
- `Navigator.push`와 `pop`의 화면 스택
- 폼 입력값 검증과 오류 표시
- `ListView`와 `GridView`의 항목 구성
- `Checkbox`, `Switch`, `Slider`, `FocusNode`의 상태 변화
- `LayoutBuilder`를 이용한 반응형 분기
- `Future`, `Stream`, 새로고침의 대기·성공·오류 상태
- `AnimatedContainer`, `AnimatedSwitcher`, Tween 기반 애니메이션
- `initState`, `build`, `dispose`의 실행 흐름
- `ValueKey` 유무에 따른 재정렬 항목의 상태 연결

> 실습 화면은 개념을 이해하기 위한 **웹 시뮬레이션**입니다. 브라우저에서 Flutter 엔진이나 Dart 코드를 직접 실행하는 기능은 아닙니다.

### 5. 학습 기록과 복습

별도 로그인 없이 현재 브라우저에 학습 기록을 저장합니다.

- 이해 완료 표시
- 북마크
- 항목별 개인 메모
- 최근 학습 항목
- 문제 풀이 횟수와 정답·오답 상태
- 오답 복습
- 저장한 항목 플래시카드
- 라이트·다크 테마
- 큰 글씨 설정

### 6. 백업과 복원

학습 기록을 JSON 파일로 내보내고 다른 브라우저에서 가져올 수 있습니다.

- 완료 항목, 북마크, 방문 기록은 기존 데이터와 합칩니다.
- 같은 항목의 메모와 문제 기록은 저장 시간이 더 최신인 데이터를 사용합니다.
- 가져온 직후에는 현재 페이지에서 한 번 되돌릴 수 있습니다.
- 잘못된 형식, 알 수 없는 학습 ID, 지나치게 큰 파일은 검증 과정에서 거부하거나 제외합니다.

자동 계정 동기화 기능은 없습니다. 휴대폰과 PC 사이에서 기록을 옮기려면 **내 학습 → 백업 내보내기/가져오기**를 사용합니다.

---

## 추천 학습 순서

| 학습 경로 | 순서 |
| --- | --- |
| 화면 한 장 만들기 | `MaterialApp` → `Scaffold` → `AppBar` → `Text` → `SafeArea` |
| 계산기 배치 이해하기 | `Container` → `Padding` → `Row` → `Column` → `Expanded` → `Spacer` |
| 버튼이 화면을 바꾸기까지 | `FilledButton` → `StatelessWidget` → `StatefulWidget` → `setState` → `Provider` |
| context 감 잡기 | `BuildContext` → `Builder` → `Theme` → `Navigator` → `SnackBar` → `showDialog` |
| 입력부터 화면 전환까지 | `Checkbox` → `Switch` → `Slider` → `NavigationBar` → `TabBar` → `showModalBottomSheet` |
| 기다림과 움직임 표현하기 | `Future` → `FutureBuilder` → `StreamBuilder` → 위젯 생명주기 → `AnimatedContainer` → `AnimatedSwitcher` |

처음 시작한다면 **화면 한 장 만들기 → 계산기 배치 이해하기 → 버튼이 화면을 바꾸기까지 → context 감 잡기** 순서를 권장합니다.

---

## 기술 구성

별도의 프레임워크나 운영용 외부 패키지 없이 정적 웹 기술로 구성했습니다.

| 영역 | 사용 기술 |
| --- | --- |
| 마크업 | HTML5 |
| 스타일 | CSS, 반응형 미디어 쿼리, CSS 변수 |
| 애플리케이션 | JavaScript ES Modules |
| 학습 기록 | 브라우저 `localStorage` |
| 단위 검사 | Node.js 내장 `node:test` |
| 브라우저 검증 | Playwright + Chromium 기반 검증 도구 |
| 배포 형태 | 정적 사이트 |

운영 페이지에는 분석 도구, 광고, 사용자 계정 서버가 포함되어 있지 않습니다.

---

## 프로젝트 구조

```text
flutter-widget-lab/
├─ index.html              # 전체 페이지 구조와 주요 화면 영역
├─ styles.css              # 공통·반응형·다크 모드·상세 학습 스타일
├─ app.js                  # 라우팅, 화면 렌더링, 이벤트, 학습 기록 연결
├─ content.js              # 기본 학습 항목과 추천 학습 경로
├─ content-extra.js        # 추가 학습 항목
├─ deep-dives.js           # 60개 항목의 상세 해설 데이터
├─ deep-ui.js              # 자세히 보기 화면 렌더링과 상호작용
├─ playground.js           # 기본 개념의 웹 실습
├─ extra-playground.js     # 입력·비동기·애니메이션·생명주기 실습
├─ context-data.js         # context 실험 시나리오와 범위 판정
├─ state.js                # 저장 데이터 검증, 마이그레이션, 백업 병합
├─ ui.js                   # 아이콘과 안전한 코드 표시 유틸리티
├─ server.cjs              # 로컬 정적 개발 서버
├─ build.js                # 공개 파일을 dist로 복사하는 빌드 스크립트
├─ icon.svg                # 사이트 아이콘
├─ package.json            # 프로젝트 정보와 npm 명령
├─ tests/
│  ├─ state.test.js        # 콘텐츠·상태·백업·context 단위 검사
│  ├─ browser.cjs          # 전체 학습 흐름 브라우저 검증
│  └─ upgrade.cjs          # 상세 학습과 추가 실습 브라우저 검증
└─ .openai/hosting.json    # 기존 Sites 프로젝트 연결 설정
```

`dist/`는 `npm run build`로 생성되는 결과물이므로 소스 수정은 루트의 원본 파일에서 진행합니다.

---

## 로컬에서 실행하기

### 준비 사항

- Git
- ES Modules와 `node:test`를 지원하는 Node.js
- Chrome, Edge 등 최신 브라우저

운영용 npm 의존성이 없으므로 별도의 패키지 설치 없이 실행할 수 있습니다.

### 1. 저장소 받기

```powershell
git clone <저장소-주소>
cd flutter-widget-lab
```

### 2. 개발 서버 실행

```powershell
npm start
```

브라우저에서 아래 주소를 엽니다.

```text
http://127.0.0.1:4173
```

`server.cjs`는 프로젝트에서 사용하는 공개 파일만 제공하며 개발 중 변경 사항이 캐시에 남지 않도록 `Cache-Control: no-store`를 적용합니다.

### 3. 단위 검사 실행

```powershell
npm test
```

다음 내용을 검사합니다.

- 60개 학습 항목의 ID 중복 여부와 필수 데이터
- 퀴즈 정답과 전체 코드 생성 여부
- 상세 해설의 코드 표시 위치와 비교 대상
- 검색·카테고리·북마크·완료 상태 필터
- 이전 버전 학습 기록 마이그레이션
- 손상되거나 잘못된 백업 처리
- 메모와 복습 기록 병합 규칙
- 안전한 HTML 이스케이프
- context 출발 위치별 성공·실패 결과

### 4. 배포용 파일 생성

```powershell
npm run build
```

`build.js`가 공개에 필요한 13개 정적 파일을 `dist/` 폴더로 복사합니다.

### 브라우저 검증 참고

`tests/browser.cjs`와 `tests/upgrade.cjs`는 실제 Chromium에서 전체 화면 흐름을 확인하기 위한 검증 도구입니다. 모든 학습 탭, 메모·백업·복습, context 실험, 추가 실습, 다크 모드, 큰 글씨, 320/390/768/1440px 화면 폭을 확인합니다.

이 도구는 작성 환경에서 제공되는 Playwright와 Chromium 실행 경로를 사용하므로 일반적인 로컬 환경에서는 추가 설정 없이 바로 실행되는 범용 테스트 명령이 아닙니다. 기본 콘텐츠와 상태 검사는 `npm test`로 실행할 수 있습니다.

---

## 화면 이동 구조

별도의 라우팅 라이브러리 없이 URL 해시를 사용합니다.

| 주소 형태 | 화면 |
| --- | --- |
| `#learn` | 위젯 학습 기본 화면 |
| `#learn/<lesson-id>` | 특정 학습 항목 |
| `#context` | BuildContext 실험실 |
| `#study` | 북마크, 메모, 복습, 백업 |

예를 들어 `#learn/set-state`는 `setState` 학습 화면을 직접 엽니다. 각 학습 항목의 링크 복사 기능도 이 구조를 사용합니다.

---

## 학습 데이터 구조

학습 기록은 브라우저의 `flutter-lab-v2` 키에 JSON으로 저장됩니다. 사이트 버전은 3.0.0이지만 기존 사용자의 기록을 유지하기 위해 저장 키와 데이터 버전은 v2를 사용합니다.

```js
{
  version: 2,
  completed: [],
  bookmarks: [],
  visited: [],
  notes: {},
  reviews: {},
  lastLesson: 'scaffold',
  theme: 'system',
  largeText: false
}
```

| 필드 | 의미 |
| --- | --- |
| `completed` | 사용자가 직접 이해 완료로 표시한 학습 ID 목록 |
| `bookmarks` | 저장한 학습 ID 목록 |
| `visited` | 한 번 이상 열어 본 학습 ID 목록 |
| `notes` | 학습 ID별 메모와 수정 시각 |
| `reviews` | 문제 풀이 결과, 시도 횟수, 수정 시각 |
| `lastLesson` | 마지막으로 학습한 항목 |
| `theme` | `light`, `dark`, `system` 중 하나 |
| `largeText` | 큰 글씨 사용 여부 |

학습 화면을 열었다는 이유만으로 완료 처리하지 않습니다. 완료 수치는 사용자가 **이해 완료** 버튼을 직접 누른 경우에만 올라갑니다.

---

## 백업 파일 처리 방식

내보낸 JSON은 다음과 같은 최상위 구조를 사용합니다.

```js
{
  kind: 'flutter-widget-lab',
  exportedAt: '내보낸 시각',
  data: {
    // flutter-lab-v2 학습 기록
  }
}
```

가져올 때는 다음 규칙을 적용합니다.

1. 파일 크기가 1MB를 넘는지 확인합니다.
2. JSON과 `kind` 값이 올바른지 확인합니다.
3. 데이터 버전과 각 필드의 타입을 검사합니다.
4. 현재 존재하는 학습 ID만 남깁니다.
5. 완료·북마크·방문 목록은 중복을 제거해 합칩니다.
6. 메모·복습 결과는 `updatedAt`이 더 최신인 값을 사용합니다.

백업 파일에는 사용자가 작성한 메모가 포함되므로 공유 전 내용을 확인해야 합니다.

---

## 새 학습 항목 추가하기

### 1. 학습 데이터 작성

기본 항목은 `content.js`, 확장 항목은 `content-extra.js`에 추가합니다.

```js
{
  id: '고유한-url-id',
  name: '화면에 표시할 이름',
  category: '기존 카테고리 이름',
  summary: '한 줄 역할 설명',
  example: '실제 사용 상황',
  principle: '동작 원리',
  place: '코드를 넣을 위치',
  code: '핵심 Dart 코드',
  mistake: '자주 하는 실수',
  task: '직접 바꿔볼 과제',
  quiz: {
    question: '확인 문제',
    choices: ['선택지 1', '선택지 2', '선택지 3'],
    answer: 0,
    explanation: '정답 해설'
  },
  doc: '공식 문서 URL'
}
```

`id`는 URL, 브라우저 저장 데이터, 메모와 복습 기록을 연결합니다. 이미 배포된 ID를 바꾸면 기존 사용자의 기록이 연결되지 않을 수 있습니다.

### 2. 자세한 해설 작성

`deep-dives.js`에 같은 ID를 키로 사용하는 상세 데이터를 추가합니다.

- 3단계 동작 흐름
- 실제 코드에 존재하는 핵심 문자열과 해당 줄 해설
- 비교할 다른 학습 항목 ID
- 자주 묻는 질문과 답변
- 응용 문제 힌트와 예상 결과

코드 해설에 지정한 문자열은 실제 핵심 코드에서 찾아져야 합니다. 단위 검사는 모든 표시 문자열과 비교 대상이 유효한지 확인합니다.

### 3. 실습 연결

- 기존 공통 실습이면 `playground.js`의 `demo` 값을 재사용합니다.
- 새로운 상호작용이면 `extra-playground.js`에 실습 유형을 추가합니다.
- 타이머, 이벤트 리스너, 임시 대화상자는 탭을 벗어날 때 정리합니다.
- 실제 Dart 실행이 아닌 웹 시뮬레이션임을 화면에 명확하게 표시합니다.

### 4. 검증

```powershell
npm test
npm run build
```

학습 항목을 추가한 뒤에는 검색, 카테고리 개수, 추천 경로, 모바일 탭 너비도 함께 확인합니다.

---

## 접근성과 반응형 지원

- 키보드 포커스 표시와 본문 바로가기 링크
- 버튼과 아이콘의 접근 가능한 이름
- 네이티브 `dialog`를 이용한 모달과 Escape 닫기
- 모바일 하단 내비게이션
- 320px부터 데스크톱까지 반응형 배치
- 큰 글씨 모드와 다크 모드
- 시스템 설정을 따르는 초기 테마
- `prefers-reduced-motion`에 따른 애니메이션 감소
- 코드 영역과 긴 학습 이름의 가로 넘침 방지

검색 입력창이 아닌 곳에서 `/` 키를 누르면 개념 검색으로 이동할 수 있습니다.

---

## 개인정보와 저장 범위

- 계정 생성이나 로그인이 없습니다.
- 메모와 진도는 현재 브라우저의 `localStorage`에 저장됩니다.
- 사이트가 공개되어 있어도 다른 방문자가 내 브라우저의 메모를 볼 수 없습니다.
- 브라우저 데이터 삭제, 시크릿 모드 종료, 기기 변경 시 기록이 사라질 수 있습니다.
- 자동 기기 동기화나 서버 백업은 제공하지 않습니다.
- 분석 도구와 광고 추적 코드를 사용하지 않습니다.

중요한 기록은 정기적으로 JSON 백업으로 내보내는 것이 좋습니다.

---

## 구현 원칙

- 설명을 실제 화면 동작과 연결합니다.
- Flutter 위젯 트리와 데이터 흐름을 지나치게 단순화하지 않습니다.
- `Theme.of`의 fallback처럼 오류가 아닌 상황과 실제 범위 오류를 구분합니다.
- Provider 실험의 트리 이동 표현을 내부 성능 알고리즘이라고 설명하지 않습니다.
- `build`가 여러 번 실행될 수 있다는 사실을 코드 예제에 반영합니다.
- 비동기 작업 뒤에는 필요한 경우 `mounted`를 확인합니다.
- 모든 학습 항목에 Flutter 또는 Dart 공식 문서 링크를 제공합니다.
- 방문 기록과 사용자의 명시적인 완료 기록을 구분합니다.

---

## 현재 제한 사항

- 사이트 안에서 Dart 코드를 직접 수정하거나 실행할 수 없습니다.
- 웹 시뮬레이션은 Flutter 렌더링 결과를 픽셀 단위로 복제하지 않습니다.
- 서버 계정이 없어 여러 기기의 기록이 자동으로 합쳐지지 않습니다.
- 전체 Dart 예제는 학습용입니다. 실제 프로젝트에서는 프로젝트 구조, Flutter 버전, 사용 중인 패키지와 팀 규칙을 함께 확인해야 합니다.
- `Provider` 전체 예제를 실행하려면 Flutter 프로젝트에 `provider` 패키지를 추가해야 합니다.

---

## 자주 묻는 질문

### 공개 사이트인데 내 메모도 공개되나요?

아닙니다. 메모는 현재 브라우저에만 저장됩니다. 다만 직접 내보낸 백업 JSON에는 메모가 포함됩니다.

### 휴대폰에서 공부한 내용을 PC에서도 볼 수 있나요?

사이트에는 두 기기에서 모두 접속할 수 있습니다. 기록은 자동 동기화되지 않으므로 휴대폰에서 백업을 내보낸 뒤 PC에서 가져와야 합니다.

### 코드 탭의 예제를 사이트에서 바로 실행할 수 있나요?

사이트 내부에서는 실행할 수 없습니다. 전체 예제를 복사하거나 `main.dart`로 내려받아 Flutter 프로젝트의 `lib/main.dart`에서 실행할 수 있습니다.

### 왜 사이트 버전은 3인데 저장 키는 v2인가요?

기존 사용자의 메모와 진도를 유지하기 위해 저장 형식을 그대로 사용합니다. 화면 기능 버전과 저장 데이터 형식 버전은 서로 다른 목적을 가집니다.

### 학습 항목을 열었는데 완료 수치가 올라가지 않아요.

방문과 이해 완료를 구분하기 때문입니다. 내용을 확인한 뒤 **이해 완료** 버튼을 눌러야 완료 수치에 포함됩니다.

---

## 배포 정보

이 프로젝트는 `.openai/hosting.json`에 연결된 기존 Sites 프로젝트로 배포됩니다.

1. 단위 검사와 필요한 브라우저 검증을 통과합니다.
2. `npm run build`로 `dist/`를 생성합니다.
3. 검증한 소스의 커밋 SHA와 동일한 빌드 결과를 패키징합니다.
4. 새 사이트를 만들지 않고 기존 프로젝트의 새 버전으로 저장합니다.
5. 기존 공개 범위를 유지해 배포합니다.
6. 배포 상태가 `succeeded`인지 확인합니다.

현재 공개 주소:

**https://flutter-widget-lab-ingyu.sdh240117.chatgpt.site**

---

## 프로젝트 상태

- 학습 항목: **60개**
- 카테고리: **11개**
- 추천 학습 경로: **6개**
- context 실험: **5개**
- 단위 검사: **10개 통과**
- 확인한 화면 폭: **320 / 390 / 768 / 1440px**
- 배포 버전: **3**

마지막 기능 검증에서는 60개 항목의 다섯 개 탭, 전체 코드 생성, 상세 해설 이동, 입력·비동기·애니메이션·Key·생명주기 실습, 메모, 백업, 복습, context 실험, 모바일 내비게이션을 실제 Chromium에서 확인했습니다.
