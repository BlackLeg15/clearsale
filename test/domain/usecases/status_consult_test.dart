import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/models/response_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/status_consult.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  MockGaranteeRepository repository;
  StatusConsult usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = StatusConsult(repository);
  });
  final successMockResponse = ResponseModel(data: OrderModel());
  test("success", () async {
    when(repository.statusConsult(any))
        .thenAnswer((realInvocation) async => right(successMockResponse));
    final response = await usecase("mock-analysisCode-code");
    expect(response | null, successMockResponse);
  });

  group("InvalidFieldFailure", () {
    group("analysisCode", () {
      test("null", () async {
        when(repository.statusConsult(any))
            .thenAnswer((realInvocation) async => right(successMockResponse));
        final response =
            await usecase(null).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analysisCode"));
      });
      test("empty", () async {
        when(repository.statusConsult(any))
            .thenAnswer((realInvocation) async => right(successMockResponse));
        final response = await usecase("").then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analysisCode"));
      });
    });
  });
}
