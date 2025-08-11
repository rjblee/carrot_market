enum StepType {
  init(''), // init 상태를 추가하여 초기 상태를 설정
  dataLoad('데이터 로드'),
  authCheck('인증 체크');

  final String name;
  const StepType(this.name);
}
