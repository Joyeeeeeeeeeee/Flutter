import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  // state
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwChkController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _countController = TextEditingController();

  String _gender = "여자";
  String _idType = "주민등록증";
  int _count = 1;
  int _maxCount = 100;
  int _minCount = 0;
  final _formkey = GlobalKey<FormState>();

  // ...
  // 달력 설정
  List<DateTime> _dateDefaultValue = [DateTime.now()];

  final config = CalendarDatePicker2Config(
    // 캘린더 타입 : single, multi, range
    calendarType: CalendarDatePicker2Type.range,
    selectedDayHighlightColor: Color.fromARGB(255, 255, 226, 98),
    weekdayLabels: ['일', '월', '화', '수', '목', '금', '토'],
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    firstDayOfWeek: 0, // 시작 요일 : 0 (일), 1(월)
    controlsHeight: 50, // 높이 사이즈
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    dayTextStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    disabledDayTextStyle: const TextStyle(
      color: Colors.grey,
    ),
    // 선택 가능한 날짜 설정
    selectableDayPredicate: (day) => !day // !를 붙여서 선택 불가능한 날짜 지정 가능
        .difference(DateTime.now().subtract(const Duration(days: 10)))
        .isNegative,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListView(
          children: [
            const Text(
              "회원가입",
              style: TextStyle(fontSize: 30),
            ),
            Form(
              child: Column(
                children: [
                  // 아이디
                  TextFormField(
                    autofocus: true, // 자동 커서 지정
                    controller: _idController,
                    decoration: const InputDecoration(labelText: "아이디"),
                    // 아이디 유효성 검사
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "아이디를 입력하세요.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // 비밀번호
                  TextFormField(
                    obscureText: true, // 입력 기호로 숨김
                    autofocus: true, // 자동 커서 지정
                    controller: _pwController,
                    decoration: const InputDecoration(labelText: "비밀번호"),
                    // 비밀번호 유효성 검사
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "비밀번호를 입력하세요.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // 비밀번호 확인
                  TextFormField(
                      obscureText: true,
                      autofocus: true, // 자동 커서 지정
                      controller: _pwChkController,
                      decoration: const InputDecoration(labelText: "비밀번호 확인"),
                      // 비밀번호 확인 유효성 검사
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "비밀번호를 다시 한 번 입력하세요.";
                        }
                        if (value != _pwChkController.text) {
                          return "비밀번호가 일치하지 않습니다.";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // 성별
                  Row(
                    children: [
                      Text("성별"),
                      Radio(
                          value: "남자",
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value.toString();
                            });
                          }),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _gender = "남자";
                          });
                        },
                        child: Text("남자"),
                      ),
                      Radio(
                          value: "여자",
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value.toString();
                            });
                          }),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _gender = "여자";
                          });
                        },
                        child: Text("여자"),
                      )
                    ],
                  ),
                  // 생년 월일
                  Column(
                    children: [
                      TextFormField(
                          controller: _birthController,
                          readOnly: true,
                          decoration: InputDecoration(
                              labelText: "생년월일",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  print("생년월일 입력");
                                  picker.DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2018, 3, 5),
                                      maxTime: DateTime(2019, 6, 7),
                                      theme: picker.DatePickerTheme(
                                          headerColor: Colors.orange,
                                          backgroundColor: Colors.blue,
                                          itemStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          doneStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      onChanged: (date) {
                                    print('change $date in time zone ' +
                                        date.timeZoneOffset.inHours.toString());
                                    print("생년월일 : ${_birthController.text}");
                                    print(date);
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    print("date : $date");
                                    // date : 2024-01-17 00:0:00.000
                                    // ⬇ 변환
                                    // text : 2024/01/17
                                    var dateFormat =
                                        DateFormat('yyyy/MM/dd').format(date);

                                    // "yyyy/MM/dd" 날짜 형식으로 지정
                                    _birthController.text = dateFormat;
                                  },
                                      currentTime: DateTime.now(),
                                      locale: picker.LocaleType.ko);
                                },
                                child: Icon(Icons.calendar_month),
                              )),
                          // 생년월일 유효성 검사
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "생년월일을 입력하세요.";
                            }
                            return null;
                          }),
                    ],
                  ),
                  // 신분증 종류
                  DropdownButtonFormField(
                      items: ["주민등록증", "운전면허증", "여권"].map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _idType = value!; // 변수! : 널 아님 명시
                        });
                      }),

                  const SizedBox(
                    height: 20,
                  ),
                  // 날짜 선택
                  CalendarDatePicker2(
                    config: config,
                    value: _dateDefaultValue,
                    onValueChanged: (dates) {
                      print("선택된 날짜 : $dates ");
                      setState(() {
                        _dateDefaultValue = dates;
                      });
                    },
                  ),
                  // 수량
                  TextField(
                    textAlign: TextAlign.center,
                    controller: _countController,
                    keyboardType: TextInputType.number,
                    // 숫자만 입력 가능하도록 지정
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      // 수량 + 버튼
                      prefixIcon: ElevatedButton(
                        onPressed: () {
                          if (_count > _maxCount) {
                            return;
                          }
                          setState(() {
                            _count++;
                          });
                          _countController.text = _count.toString();
                        },
                        child: Text("+"),
                      ),
                      // 수량 - 버튼
                      suffixIcon: ElevatedButton(
                        onPressed: () {
                          if (_minCount >= _count) {
                            return;
                          }
                          setState(() {
                            _count--;
                          });
                          _countController.text = _count.toString();
                        },
                        child: Text("-"),
                      ),
                    ),
                    onChanged: (value) {
                      // String => int 변환
                      // int.parse("10") : String -> int
                      // int.parse("") : 빈 문자열이면 예외 발생
                      // int.tryParse("숫자가 아닌 문자열")
                      int newValue = int.tryParse(value) ?? -1;

                      // 값이 없을 때
                      if (newValue == -1) {
                        setState(() {
                          _count = 1;
                          return;
                        });
                      }
                      if (newValue >= _maxCount) {
                        newValue = _maxCount;
                      }
                      if (newValue < _minCount) {
                        newValue = _minCount;
                      }
                      setState(() {
                        _count = newValue;
                      });
                      _countController.text = newValue.toString();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // 회원가입 버튼
                  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          // 폼 제출
                          print("아이디 : ${_idController.text}");
                          print("비밀번호 : ${_pwController.text}");
                          print("비밀번호 확인 : ${_pwChkController.text}");
                          print("성별 : ${_gender}");
                          print("생년월일 : ${_birthController}");
                          print("신분증 종류 : ${_idType}");
                          print("선택 날짜 : ${_dateDefaultValue}");
                          print("수량 : ${_countController.text}");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan[300],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 60.0)),
                      child: Text("회원가입"))
                ],
              ),
            )
          ],
        ));
  }
}
